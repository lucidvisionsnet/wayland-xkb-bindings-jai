// A Jai implementation approximating the behavior of wayland-scanner.
// See: https://gitlab.freedesktop.org/wayland/wayland/-/blob/25da99a7e5459bd9ad565d8a5d1e0e4857f4e5f7/src/scanner.c
//
// The original scanner emits code for C, which involves emitting a header file
// and an implementation file per XML protocol definition. This scanner allows
// processing of multiple XML protocol definitions at once, to deduplicate
// symbols and avoid emitting symbols considered opaque in one protocol that
// are defined in another protocol.
//
// Limitations:
// 
// - currently only emits client-side code
// - currently does not emit `<type>_interface: wl_interface #elsewhere`
//   declarations

#import "Basic";
File   :: #import "File";
Sort   :: #import "Sort";
String :: #import "String";

Xml :: #import,file "xml.jai";

OUTPUT_FILENAME :: "wayland_scanner_output.jai";

Protocol :: struct {
  name: string;
  interfaces: [..] *Interface;
  /**
   * Track the longest prefix of consecutive null entries from the start of
   * the global type table across all messages in this protocol.
   */
  null_run_length: s64;
  /** The current index in building the protocol's type table. */
  type_index: s64;
}

Interface :: struct {
  name: string;
  name_upper: string;
  comment: string;
  enums: [..] *Enum;
  requests: [..] *Message;
  events: [..] *Message;
  version: s64;
}

Enum :: struct {
  name: string;
  name_upper: string;
  comment: string;
  values: [..] *EnumValue;
  is_bitfield: bool;
}

EnumValue :: struct {
  name: string;
  // @todo(orphen): Make this a string? Then we could preserve hex literals.
  value: s64;
  comment: string;
  since: s64;
}

Message :: struct {
  name: string;
  name_upper: string;
  type: string;
  comment: string;
  params: [..] *Parameter;
  since: s64;
  new_id_count: s64;
  /**
   * Tracks whether all argument types map to null in the global type table of
   * the protocol containing this message.
   */
  all_null_in_protocol_type_table: bool;
  /**
   * The start offset for this message's args' types in the protocol type table.
   */
  type_index_start: s64;
}

Parameter :: struct {
  name: string;
  // @todo(orphen): Make this an enum so we aren't comparing strings everywhere.
  type: string;
  nullable: bool;
  iface: string;
  comment: string;
}

get_attribute_value :: (attrs: [..] *Xml.Attribute, name: string) -> value: string, found: bool {
  for attrs {
    if it.name == name { return it.value, true; }
  }
  return "", false;
}

extract_enum :: (node: *Xml.Node) -> *Enum {
  if node.name != "enum" {
    log_error("can't extract an enum from a node that is not an enum\n");
    return null;
  }

  new_enum: *Enum = alloc(size_of(Enum));
  new_enum.* = .{};
  ok: bool;
  new_enum.name, ok = get_attribute_value(node.attributes, "name");
  if !ok {
    log_error("enum has no name\n");
    return null;
  }
  new_enum.name_upper = copy_string(new_enum.name);
  String.to_upper_in_place(new_enum.name_upper);

  is_bitfield: string;
  is_bitfield, ok = get_attribute_value(node.attributes, "bitfield");
  new_enum.is_bitfield = ok && is_bitfield == "true";

  for node.children {
    if it.name == {
      case "description";
        // We don't require the summary/comment to exist.
        new_enum.comment = get_attribute_value(it.attributes, "summary");
      case "entry";
        new_value: *EnumValue = alloc(size_of(EnumValue));
        new_value.* = .{};
    
        ok: bool;
        new_value.name, ok = get_attribute_value(it.attributes, "name");
        if !ok {
          log_error("missing enum entry name\n");
          return null;
        }
        // Value names are only dealt with in their all-uppercase form, so we
        // convert them preemptively.
        String.to_upper_in_place(new_value.name);

        base := 10;
        value_str: string;
        value_str, ok = get_attribute_value(it.attributes, "value");
        if !ok {
          log_error("missing enum entry value\n");
          return null;
        }
        if String.starts_with(value_str, "0x") || String.starts_with(value_str, "0X") {
          value_str.data += 2;
          value_str.count -= 2;
          base = 16;
        }
        new_value.value, ok = string_to_int(value_str, base);
        if !ok {
          log_error("failed to convert enum value from string to int: %\n", value_str);
          return null;
        }
    
        // We don't require the summary/comment to exist.
        new_value.comment = get_attribute_value(it.attributes, "summary");

        since_str: string;
        since_str, ok = get_attribute_value(it.attributes, "since");
        if !ok { since_str = "1"; }
        new_value.since, ok = string_to_int(since_str);
        if !ok {
          log_error("failed to convert 'since' attribute to int\n");
          return null;
        }

        array_add(*new_enum.values, new_value);
      case;
        log_error("unexpected node name when looking for enum entries: %\n", it.name);
        return null;
    }
  }

  return new_enum;
}

is_jai_keyword :: (s: string) -> bool {
  if s == {
    case "interface";
      return true;
    case;
      return false;
  }
}

extract_message :: (node: *Xml.Node) -> *Message {
  if node.name != "request" && node.name != "event" {
    log_error("can't parse a message from the provided node: %\n", node.name);
    return null;
  }

  new_message: *Message = alloc(size_of(Message));
  new_message.* = .{};

  ok: bool;
  new_message.name, ok = get_attribute_value(node.attributes, "name");
  if !ok {
    log_error("message has no name\n");
    return null;
  }
  new_message.name_upper = copy_string(new_message.name);
  String.to_upper_in_place(new_message.name_upper);

  // We don't require this attribute to exist.
  new_message.type = get_attribute_value(node.attributes, "type");

  since_str := get_attribute_value(node.attributes, "since");
  if !since_str { since_str = "1"; }
  new_message.since, ok = string_to_int(since_str);
  if !ok {
    log_error("failed to convert message 'since' attribute to an int\n");
    return null;
  }

  for node.children {
    if it.name == {
      case "arg";
        new_parameter: *Parameter = alloc(size_of(Parameter));
        new_parameter.* = .{};
        new_parameter.name, ok = get_attribute_value(it.attributes, "name");
        if !ok {
          log_error("message parameter has no name\n");
          return null;
        }
        if is_jai_keyword(new_parameter.name) {
          old_name := new_parameter.name;
          new_parameter.name = sprint("the_%", new_parameter.name);
          log("message '%': arg name '%' is a Jai keyword; renaming to '%'\n",
              new_message.name, old_name, new_parameter.name, flags=.WARNING);

        }
        new_parameter.type, ok = get_attribute_value(it.attributes, "type");
        if !ok {
          log_error("message parameter has no type\n");
          return null;
        }
        if new_parameter.type == "new_id" { new_message.new_id_count += 1; }
        // We don't require this to exist.
        new_parameter.iface = get_attribute_value(it.attributes, "interface");
        // We don't require this to exist.
        new_parameter.comment = get_attribute_value(it.attributes, "summary");
        // We don't require this to exist.
        allow_null: string;
        allow_null, _ = get_attribute_value(it.attributes, "allow-null");
        new_parameter.nullable = allow_null == "true";

        array_add(*new_message.params, new_parameter);
      case "description";
        // We don't require this to exist.
        new_message.comment = get_attribute_value(it.attributes, "summary");
      case;
        log_error("unexpected element when looking for message args: %\n", it.name);
        return null;
    }
  }

  return new_message;
}

/**
 * @param node A node in an XML DOM to extract an interface definition from.
 * @return The extracted interface instance or `null` on any error.
 */
extract_interface :: (node: *Xml.Node) -> *Interface {
  if node.name != "interface" {
    log_error("can't extract an interface from a node that is not an interface\n");
    return null;
  }

  iface: *Interface = alloc(size_of(Interface));
  iface.* = .{};

  ok: bool;
  iface.name, ok = get_attribute_value(node.attributes, "name");
  if !ok {
    log_error("interface has no name attribute\n");
    return null;
  }
  iface.name_upper = copy_string(iface.name);
  String.to_upper_in_place(iface.name_upper);
  version_str: string;
  version_str, ok = get_attribute_value(node.attributes, "version");
  // We don't require the interface version to exist.
  if ok {
    iface.version, ok = string_to_int(version_str);
    if !ok {
      log_error("failed to convert interface version to an integer\n");
      return null;
    }
  }

  for node.children {
    if it.name == {
      case "description";
        comment, found := get_attribute_value(it.attributes, "summary");
        if found {
          iface.comment = comment;
        }
      case "enum";
        new_enum := extract_enum(it);
        if new_enum {
          array_add(*iface.enums, new_enum);
        } else {
          log_error("failed to extract enum\n");
          return null;
        }
      case "request";
        new_message := extract_message(it);
        if new_message {
          array_add(*iface.requests, new_message);
        } else {
          log_error("failed to extract request\n");
          return null;
        }
      case "event";
        new_message := extract_message(it);
        if new_message {
          array_add(*iface.events, new_message);
        } else {
          log_error("failed to extract event\n");
          return null;
        }
      case;
        log("warning: unsupported interface child element: %\n", it.name);
    }
  }

  return iface;
}

build_protocol :: (xml: *Xml.Node) -> *Protocol, ok: bool {
  if xml.name != "protocol" {
    log_error("can't extract a protocol from node of type %\n", xml.name);
    return null, false;
  }

  protocol: *Protocol = alloc(size_of(Protocol));
  protocol.* = .{};

  ok: bool;
  protocol.name, ok = get_attribute_value(xml.attributes, "name");
  if !ok {
    log_error("protocol requires a name but has none\n");
    return null, false;
  }

  protocol.interfaces, ok = build_interfaces(xml.children);
  if !ok {
    log_error("failed to build interfaces for protocol %\n", protocol.name);
    return null, false;
  }

  return protocol, true;
}

/**
 * @param nodes A collection of child nodes, assumed to be children of a
 *        protocol node.
 * @return A collection of interfaces or `null` on any error. The collection
 *         points into the memory of the various nodes provided, so those nodes
 *         must be kept alive for as long as the returned interfaces will be
 *         used.
 */
 build_interfaces :: (nodes: [] *Xml.Node) -> [..] *Interface, ok: bool {
  interfaces: [..] *Interface;
  current_interface: *Interface;

  for nodes {
    if it.name == {
      case "interface";
        new_iface := extract_interface(it);
        if new_iface {
          array_add(*interfaces, new_iface);
        } else {
          log_error("failed to extract interface; skipping\n");
        }
      case "copyright";
        // @todo(orphen): Extract the copyright info.
      case;
        log_error("unexpected node name: %\n", it.name);
        return interfaces, false;
    }
  }

  return interfaces, true;
}

/**
 * Note that, following the original scanner implementation of this function,
 * this not only "emits" code but also changes the state of the protocol and
 * its messages!
 */
emit_types_forward_declarations :: (protocol: *Protocol, messages: [..] *Message, types: *[..] string) {
  for message: messages {
    length := 0;
    message.all_null_in_protocol_type_table = true;

    for param: message.params {
      length += 1;
      if param.type == "new_id" && !param.iface {
        // This parameter results in implicit string and uint arguments being
        // added to the interface later on.
        length += 2;
      }

      if param.type == {
        case "new_id"; #through;
        case "object";
          if !param.iface { continue; }

          message.all_null_in_protocol_type_table = false;
          array_add(types, param.iface);
      }
    }

    // Update the protocol null run length to the maximum null run length prefix
    // seen among all messages whose arguments map to null in the protocol type
    // table.
    if message.all_null_in_protocol_type_table && length > protocol.null_run_length {
      protocol.null_run_length = length;
    }
  }
}

// We differ from the original scanner by appending a `_e` to the enum name.
// The original scanner emits names that may conflict with function names in C,
// but this isn't allowed in Jai.
emit_enumerations :: (iface: *Interface, with_validators: bool, builder: *String_Builder) {
  first := true;
  for iface.enums {
    if !first { print_to_builder(builder, "\n"); } else { first = false; }

    print_to_builder(builder, "%_%_e :: enum u32 {\n", iface.name, it.name);
    for value: it.values {
      // Some interfaces feature enums with values that are numbers, such as
      // `90`. The original scanner makes these valid C identifiers by prefixing
      // the value with the interface and enum name. We need to do the same to
      // make a valid Jai identifier.
      print_to_builder(builder, "  %_%_% :: %;\n", iface.name_upper, it.name_upper, value.name, value.value);
    }
    print_to_builder(builder, "}\n");

    for value: it.values {
      if value.since == 1 { continue; }
      print_to_builder(builder,
                       "%_%_%_SINCE_VERSION: u32 : %;\n",
                       iface.name_upper, it.name_upper, value.name, value.since);
    }

    if with_validators { emit_validator(iface, it, builder); }
  }
}

emit_validator :: (iface: *Interface, e: *Enum, builder: *String_Builder) {
  print_to_builder(builder, "%_%_is_valid :: (value: u32, version: u32) -> bool {\n", iface.name, e.name);

  if e.is_bitfield {
    print_to_builder(builder, "  valid: u64 = 0;\n");
    for e.values {
      print_to_builder(
        builder,
        "  if version >= % { valid |= xx %_%_e.%_%_%; }\n",
        it.since, iface.name, e.name, iface.name_upper, e.name_upper, it.name);
    }
    print_to_builder(builder, "  return (value & ~valid) == 0;\n");
  } else {
    print_to_builder(builder, "  if value == {\n");
    for e.values {
      // The original implementation conditionally performs a cast, but we just
      // bake it in here for simplicity.
      print_to_builder(
        builder,
        "    case cast(u32)%_%_e.%_%_%;\n      return version >= %;\n",
        iface.name, e.name, iface.name_upper, e.name_upper, it.name, it.since);
    }
    print_to_builder(builder, "    case;\n      return false;\n  }\n");
  }

  print_to_builder(builder, "}\n");
}

emit_type :: (param: *Parameter, builder: *String_Builder) {
  if param.type == {
    case "int"; #through;
    case "fd";
      print_to_builder(builder, "s32");
    case "uint"; #through;
    case "new_id";
      print_to_builder(builder, "u32");
    case "fixed";
      print_to_builder(builder, "wl_fixed_t");
    case "string";
      print_to_builder(builder, "*u8");
    case "object";
      assert(param.iface.count > 0, "param has no iface value, so can't translate type 'object'\n");
      print_to_builder(builder, "*%", param.iface);
    case "array";
      print_to_builder(builder, "*wl_array");
    case;
      assert(false, "cannot translate unsupported type: %\n", param.type);
  }
}

emit_structs :: (side: EmitFor, iface_name: string, messages: [..] *Message, builder: *String_Builder) {
  if messages.count == 0 { return; }

  // Emit struct definition with function pointer members.
  print_to_builder(builder, "%_% :: struct {\n", iface_name, ifx side == .CLIENT "listener" else "interface");

  for message: messages {
    print_to_builder(builder, "  %: #type (", message.name);
    if side == .CLIENT {
      print_to_builder(builder, "data: *void, the_%: *%", iface_name, iface_name);
    } else {
      print_to_builder(builder, "client: *wl_client, resource: *wl_resource");
    }

    for param: message.params {
      if side == .SERVER && param.type == "object" {
        print_to_builder(builder, ", %: ", param.name);
        print_to_builder(builder, "*wl_resource");
      } else if side == .SERVER && param.type == "new_id" && param.iface == "" {
        print_to_builder(builder, ", iface: *u8, version: u32");
        print_to_builder(builder, ", %: ", param.name);
        print_to_builder(builder, "u32");
      } else if side == .CLIENT && param.type == "object" && param.iface == "" {
        print_to_builder(builder, ", %: ", param.name);
        print_to_builder(builder, "*void");
      } else if side == .CLIENT && param.type == "new_id" {
        print_to_builder(builder, ", %: ", param.name);
        print_to_builder(builder, "*%", param.iface);
      } else {
        print_to_builder(builder, ", %: ", param.name);
        emit_type(param, builder);
      }
    }

    print_to_builder(builder, ") -> void #c_call;\n");
  }

  print_to_builder(builder, "}\n\n");

  if side == .CLIENT{
    // Emit listener registration declaration.
    defn := #string EOS
%_add_listener :: (the_%: *%, listener: *%_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_%, xx listener, data);
}
    EOS;
    print_to_builder(builder, defn, iface_name, iface_name, iface_name, iface_name, iface_name);
  }
}

emit_opcodes :: (iface_name_upper: string, messages: [..] *Message, builder: *String_Builder) {
  if !messages { return; }

  opcode: u32 = 0;
  for messages {
    print_to_builder(builder, "%_%: u32 : %;\n", iface_name_upper, it.name_upper, opcode);
    opcode += 1;
  }
}

emit_opcode_versions :: (iface_name_upper: string, messages: [..] *Message, builder: *String_Builder) {
  for messages {
    print_to_builder(builder, "%_%_SINCE_VERSION: u32 : %;\n", iface_name_upper, it.name_upper, it.since);
  }
}

emit_stubs :: (iface_name: string, iface_name_upper: string, messages: [..] *Message, builder: *String_Builder) {
  defn := #string EOS
%_set_user_data :: (the_%: *%, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_%, user_data);
}

  EOS;
  print_to_builder(builder, defn, iface_name, iface_name, iface_name, iface_name);

  defn = #string EOS
%_get_user_data :: (the_%: *%) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_%);
}

  EOS;
  print_to_builder(builder, defn, iface_name, iface_name, iface_name, iface_name);

  defn = #string EOS
%_get_version :: (the_%: *%) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_%);
}

  EOS;
  print_to_builder(builder, defn, iface_name, iface_name, iface_name, iface_name);

  has_destructor := false;
  has_destroy := false;
  for messages {
    if it.type == "destructor" { has_destructor = true; }
    if it.name == "destroy"    { has_destroy = true; }
  }

  if !has_destructor && has_destroy {
    assert(false, "interface % has message destroy but no destructor\n", iface_name);
  }

  if !has_destroy && iface_name != "wl_display" {
    defn = #string EOS
%_destroy :: (the_%: *%) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_%);
}

    EOS;
    print_to_builder(builder, defn, iface_name, iface_name, iface_name, iface_name);
  }

  if !messages { return; }

  first := true;
  for message: messages {
    if !first { print_to_builder(builder, "\n"); } else { first = false; }

    if message.new_id_count > 1 {
      log("message %::% has more than one new_id arg; not emitting stub",
          iface_name, message.name, flags=.WARNING);
      continue;
    }

    maybe_return_ident: *Parameter;
    for param: message.params {
      if param.type == "new_id" { maybe_return_ident = param; }
    }
    return_type := "void";
    if maybe_return_ident && !maybe_return_ident.iface {
      return_type = "*void";
    } else if maybe_return_ident {
      return_type = sprint("*%", maybe_return_ident.iface);
    }

    print_to_builder(builder, "%_% :: (the_%: *%", iface_name, message.name, iface_name, iface_name);
    for param: message.params {
      if param.type == "new_id" && !param.iface {
        print_to_builder(builder, ", iface: *wl_interface, version: u32");
        continue;
      } else if param.type == "new_id" {
        continue;
      }
      print_to_builder(builder, ", %: ", param.name);
      emit_type(param, builder);
    }
    print_to_builder(builder, ") -> % #c_call {\n  ", return_type);
    if maybe_return_ident {
      print_to_builder(builder, "%: *wl_proxy;\n  % = ", maybe_return_ident.name, maybe_return_ident.name);
    }
    print_to_builder(builder, "wl_proxy_marshal_flags(cast(*wl_proxy)the_%, %_%",
                     iface_name, iface_name_upper, message.name_upper);
    if maybe_return_ident {
      if maybe_return_ident.iface {
        // Append `_instance` to disambiguate from type of the same name.
        print_to_builder(builder, ", *%_interface_instance", maybe_return_ident.iface);
      } else {
        print_to_builder(builder, ", iface");
      }
    } else {
      print_to_builder(builder, ", null");
    }
    if maybe_return_ident && !maybe_return_ident.iface {
      print_to_builder(builder, ", version");
    } else {
      print_to_builder(builder, ", wl_proxy_get_version(cast(*wl_proxy)the_%)", iface_name);
    }
    print_to_builder(builder, ", %", ifx message.type == "destructor" then "WL_MARSHAL_FLAG_DESTROY" else "0");
    for param: message.params {
      if param.type == "new_id" {
        if !param.iface {
          print_to_builder(builder, ", iface.name, version");
        } else {
          print_to_builder(builder, ", null");
        }
      } else {
        print_to_builder(builder, ", %", param.name);
      }
    }
    print_to_builder(builder, ");\n");
    if maybe_return_ident && !maybe_return_ident.iface {
      print_to_builder(builder, "  return cast(*void)%;\n", maybe_return_ident.name);
    } else if maybe_return_ident {
      print_to_builder(builder, "  return cast(*%)%;\n", maybe_return_ident.iface, maybe_return_ident.name);
    }
    print_to_builder(builder, "}\n");
  }
}

// Unlike the original scanner implementation, we emit assignments to elements
// in the array associated with the protocol types identifier.
emit_null_run :: (protocol: *Protocol, protocol_types_identifier: string, builder: *String_Builder) {
  for 0..protocol.null_run_length - 1 {
    print_to_builder(builder, "  %[%] = null;\n", protocol_types_identifier, it);
  }
}

// Unlike the original scanner implementation, we emit assignments to elements
// in the array associated with the protocol types identifier.
emit_types :: (protocol: *Protocol, protocol_types_identifier: string, messages: [] *Message, builder: *String_Builder) {
  for message: messages {
    if message.all_null_in_protocol_type_table {
      message.type_index_start = 0;
      continue;
    }

    message.type_index_start = protocol.null_run_length + protocol.type_index;
    assign_to_index := message.type_index_start;

    for param: message.params {
      protocol.type_index += 1;
      if param.type == "new_id" && !param.iface {
        print_to_builder(builder, "  %[%] = null;\n", protocol_types_identifier, assign_to_index + 0);
        print_to_builder(builder, "  %[%] = null;\n", protocol_types_identifier, assign_to_index + 1);
        protocol.type_index += 2;
        assign_to_index += 2;
      }

      if param.type == {
        case "new_id"; #through;
        case "object";
          if param.iface {
            // We append `_instance` here because elsewhere we disambiguate
            // the struct typename from the global instance name.
            print_to_builder(builder, "  %[%] = *%_interface_instance;\n", protocol_types_identifier, assign_to_index, param.iface);
          } else {
            print_to_builder(builder, "  %[%] = null;\n", protocol_types_identifier, assign_to_index);
          }
        case;
          print_to_builder(builder, "  %[%] = null;\n", protocol_types_identifier, assign_to_index);
      }
      assign_to_index += 1;
    }
  }
}

is_nullable_type :: (param: *Parameter) -> bool {
  if param.type == {
    case "string"; #through;
    case "object";
      return true;
    case;
      return false;
  }
}

emit_messages :: (protocol_name: string, messages: [] *Message, iface: *Interface, suffix: string, builder: *String_Builder) {
  if !messages { return; }

  print_to_builder(builder, "%_% := wl_message.[\n", iface.name, suffix);

  for message: messages {
    print_to_builder(builder, "  {\"%\", \"", message.name);
    if message.since > 1 { print_to_builder(builder, "%", message.since); }

    for param: message.params {
      if is_nullable_type(param) && param.nullable {
        print_to_builder(builder, "?");
      }

      if param.type == {
        case; #through;
        case "int";
          print_to_builder(builder, "i");
        case "new_id";
          if !param.iface {
            print_to_builder(builder, "su");
          }
          print_to_builder(builder, "n");
        case "uint";
          print_to_builder(builder, "u");
        case "fixed";
          print_to_builder(builder, "f");
        case "string";
          print_to_builder(builder, "s");
        case "object";
          print_to_builder(builder, "o");
        case "array";
          print_to_builder(builder, "a");
        case "fd";
          print_to_builder(builder, "h");
      }
    }
    print_to_builder(builder, "\", %_types.data + %},\n", protocol_name, message.type_index_start);
  }
  print_to_builder(builder, "];\n\n");
}

emit_event_wrappers :: (iface_name: string, iface_name_upper: string, messages: [..] *Message, builder: *String_Builder) {
  // Provide handrolled procedures elsewhere for the display object.
  if iface_name == "wl_display" { return; }

  for message: messages {
    print_to_builder(builder, "%_send_% :: (resource: *wl_resource", iface_name, message.name);

    for message.params {
      print_to_builder(builder, ", %: ", it.name);
      if it.type == {
        case "new_id"; #through;
        case "object";
          print_to_builder(builder, "*wl_resource");
        case;
          emit_type(it, builder);
      }
    }
    print_to_builder(builder, ") -> void #c_call {\n");
    print_to_builder(builder, "  wl_resource_post_event(resource, %_%", iface_name_upper, message.name_upper);

    for message.params {
      print_to_builder(builder, ", %", it.name);
    }
    print_to_builder(builder, ");\n}\n\n");
  }
}

emit_combined_header_and_code :: (
  side: EmitFor,
  protocol: *Protocol,
  opaque_struct_types: *[..] string,
  builder: *String_Builder,
  defer_init_builder: *String_Builder
) {
  print_to_builder(builder, "// Protocol %\n\n", protocol.name);
  // -------------------------------------------------------
  // This part follows the original scanner's `emit_header`.

  if side == .SERVER {
    array_add(opaque_struct_types, "wl_client :: struct {};");
    array_add(opaque_struct_types, "wl_resource :: struct {};");
  }

  // Iterate through all interfaces and emit the opaque struct types.
  opaque_types: [..] string;
  for iface: protocol.interfaces {
    emit_types_forward_declarations(protocol, iface.requests, *opaque_types);
    emit_types_forward_declarations(protocol, iface.events, *opaque_types);
    array_add(*opaque_types, iface.name);
  }

  // De-dupe the opaque types by first sorting them and then tracking whether
  // we have printed a value already.
  sorted_opaque_types := Sort.quick_sort(opaque_types, Sort.compare_strings);
  last_added: string;
  for sorted_opaque_types {
    if it == last_added { continue; }
    array_add(opaque_struct_types, it);
    last_added = it;
  }

  // Iterate through all interfaces and emit enums, structs, messages, etc.
  first := true;
  for iface: protocol.interfaces {
    if !first { print_to_builder(builder, "\n"); } else { first = false; }

    print_to_builder(builder, "// Interface %\n\n", iface.name);

    emit_enumerations(iface, side == .SERVER, builder);
    print_to_builder(builder, "\n");

    if side == .SERVER {
      emit_structs(side, iface.name, iface.requests, builder);
      print_to_builder(builder, "\n");

      emit_opcodes(iface.name_upper, iface.events, builder);
      print_to_builder(builder, "\n");

      emit_opcode_versions(iface.name_upper, iface.events, builder);
      emit_opcode_versions(iface.name_upper, iface.requests, builder);
      print_to_builder(builder, "\n");

      emit_event_wrappers(iface.name, iface.name_upper, iface.events, builder);
    } else {
      emit_structs(side, iface.name, iface.events, builder);
      print_to_builder(builder, "\n");

      emit_opcodes(iface.name_upper, iface.requests, builder);
      print_to_builder(builder, "\n");

      emit_opcode_versions(iface.name_upper, iface.events, builder);
      emit_opcode_versions(iface.name_upper, iface.requests, builder);
      print_to_builder(builder, "\n");

      emit_stubs(iface.name, iface.name_upper, iface.requests, builder);
    }
  }
  print_to_builder(builder, "\n");

  // -----------------------------------------------------
  // This part follows the original scanner's `emit_code`.

  // We differ from the original scanner's behavior significantly here.
  // The original behavior would emit `_types` and `_requests` arrays
  // and an `_interface` definition which would cause a compile-time
  // circular dependency in Jai. The only way around this as of toolchain
  // version 0.2.029 is to execute these definitions (assign to the
  // declarations) at runtime. So we split the definitions into declarations,
  // save off the definitions as assignments, and return the collection of
  // those assignments to the caller who we assume will compose some kind
  // of `init` function containing the assignments we need done.

  array_reset_keeping_memory(*opaque_types);
  for iface: protocol.interfaces {
    emit_types_forward_declarations(protocol, iface.requests, *opaque_types);
    emit_types_forward_declarations(protocol, iface.events, *opaque_types);
  }

  // @todo(orphen): Re-enable this functionality and filter declarations that
  // other protocols actually provide.
  //
  // Similar de-dupe approach as used above.
  // sorted_opaque_types = Sort.quick_sort(opaque_types, Sort.compare_strings);
  // last_printed: string;
  // print_to_builder(builder, "// Opaque interface types.\n\n");

  // for sot: sorted_opaque_types {
  //   if sot == last_printed { continue; }
  //   // The original scanner emits extern declarations without any filtering,
  //   // but some interfaces go on to provide the definition in the same
  //   // translation unit. We can't do this in Jai, so we need to filter out
  //   // such identifiers.
  //   for iface: protocol.interfaces { if sot == iface.name { continue sot; } }
  //   print_to_builder(builder, "%_interface: wl_interface #elsewhere libwayland_client;\n", sot);
  //   last_printed = sot;
  // }
  // print_to_builder(builder, "\n");

  protocol_types_identifier := sprint("%_types", protocol.name);
  emit_null_run(protocol, protocol_types_identifier, defer_init_builder);
  for iface: protocol.interfaces {
    emit_types(protocol, protocol_types_identifier, iface.requests, defer_init_builder);
    emit_types(protocol, protocol_types_identifier, iface.events, defer_init_builder);
  }
  print_to_builder(defer_init_builder, "\n");

  // This must come after we iteratively call `emit_types` above since,
  // following the original scanner implementation, `emit_types` updates
  // protocol state (the type index).
  num_protocol_types := protocol.null_run_length + protocol.type_index;
  print_to_builder(builder, "%: [%] *wl_interface;\n", protocol_types_identifier, num_protocol_types);

  for iface: protocol.interfaces {
    emit_messages(protocol.name, iface.requests, iface, "requests", builder);
    emit_messages(protocol.name, iface.events, iface, "events", builder);
    // Note that Wayland often uses variable identifiers with names identical
    // to their types. This works in C namespacing but not in Jai. We therefore
    // append `_instance` to disambiguate the names.
    print_to_builder(builder, "%_interface_instance := wl_interface.{\n  \"%\", %,\n",
                     iface.name, iface.name, iface.version);

    if iface.requests {
      print_to_builder(builder, "  %, %_requests.data,\n", iface.requests.count, iface.name);
    } else {
      print_to_builder(builder, "  0, null,\n");
    }

    if iface.events {
      print_to_builder(builder, "  %, %_events.data,\n", iface.events.count, iface.name);
    } else {
      print_to_builder(builder, "  0, null,\n");
    }

    print_to_builder(builder, "};\n\n");
  }
}

EmitFor :: enum {
  CLIENT :: 0;
  SERVER :: 1;
}

Config :: struct {
  input_pathnames: [..] string;
  output_pathname: string;
  dont_emit_opaque_decls: bool;
  side: EmitFor;
  parse_args_ok: bool;
}

parse_args :: () -> Config {
  args := get_command_line_arguments();
  HELP_TEXT_FORMAT_STRING :: #string EOS
A Jai implementation of wayland-scanner, emitting Wayland protocol code in Jai.

usage: % {client|server} [file.xml]+ [options]

  (client|server)      Select whether to emit code for clients or servers.
  file.xml             One or more (space-separated) pathnames to additional
                       Wayland XML protocol definitions. Protocol code will be
                       generated for all provided XML files and duplicated
                       declarations will be consolidated.

options:
  --dont-emit-opaque-decls    If provided, the generator will not emit
                       declarations for types a protocol definition considers
                       opaque. This option is useful when you want to manually
                       declare opaque types to avoid redeclaration or
                       redefinition errors.

This tool outputs a single source file (%)
containing all generated protocol code in the directory this tool is run.
  EOS;
  help_text := sprint(HELP_TEXT_FORMAT_STRING, args[0], OUTPUT_FILENAME);

  config := Config.{ parse_args_ok = true };

  if args.count < 3 {
    print(help_text, args[0]);
    config.parse_args_ok = false;
  } else {
    if args[1] == {
      case "client";
        config.side = .CLIENT;
      case "server";
        config.side = .SERVER;
      case;
        print("wanted one of {client|server} on the command line, not %\n", args[1]);
        print(help_text, args[0]);
        config.parse_args_ok = false;
    }

    config.output_pathname = String.path_strip_filename(args[0]);
    config.output_pathname = sprint("%%", config.output_pathname, OUTPUT_FILENAME);

    for 2..args.count - 1 {
      if String.begins_with(args[it], "--") {
        if args[it] == "--dont-emit-opaque-decls" {
          config.dont_emit_opaque_decls = true;
        } else {
          print("unsupported option %\n", args[it]);
          print(help_text, args[0]);
          config.parse_args_ok = false;
        }
      } else {
        array_add(*config.input_pathnames, args[it]);
      }
    }
  }

  return config;
}

main :: () {
  config := parse_args();
  if !config.parse_args_ok { exit(1); }

  // Create two builders. The first collects all the code to emit per protocol.
  // The second collects all the initialization code that we need to emit for
  // each protocol that can't be done at compile time. For the second, we print
  // its contents inside a function implementation the user of the generated
  // code must call to finish initialization at runtime.
  builder: String_Builder;
  init_string_builder(*builder);

  defer_init_builder: String_Builder;
  init_string_builder(*defer_init_builder);
  defer_init_signature :: #string EOS
// Users of these bindings must call this function before attempting to use any
// other code provided by the bindings. This initializes fundamental Wayland
// protocol types that we are not able to initialize at compile time in Jai at
// this time.
init_wayland_protocol_bindings :: () {
EOS;
  print_to_builder(*defer_init_builder, defer_init_signature);

  // Individual protocol specifications consider types they don't define as
  // opaque, but when we combine multiple protocol specifications in a single
  // output file, we get redeclaration errors if the same opaque type is
  // declared multiple times. So we collect supposed opaque types so that we
  // can deduplicate them across protocols before emitting them.
  opaque_struct_types: [..] string;

  for config.input_pathnames {
    log("processing file: %\n", it);

    // @todo(orphen): Clean up `xml_bytes`. Have to be careful since
    // `opaque_struc_types` has strings that point into it.
    xml_bytes, ok := File.read_entire_file(it);
    if !ok { log_error("failed to read XML file %\n", it); exit(1); }

    // @todo(orphen): Clean up `xml`. Have to be careful for the same reason for
    // `xml_bytes`.
    xml := Xml.parse_xml(xml_bytes);
    if !xml { log_error("failed to parse XML DOM\n"); exit(1); }

    // @todo(orphen): Clean up `protocol`. Have to be careful for the same
    // reason for `xml`.
    protocol: *Protocol;
    protocol, ok = build_protocol(xml);
    if !ok {
      log_error("failed to build protocol\n");
      exit(1);
    }

    emit_combined_header_and_code(
      config.side, protocol, *opaque_struct_types, *builder, *defer_init_builder);
  }

  if !config.dont_emit_opaque_decls {
    // De-dupe the opaque struct types by sorting them and then tracking whether
    // we've printed a value already.
    sorted_opaque_struct_types := Sort.quick_sort(opaque_struct_types, Sort.compare_strings);
    last_added: string;
    for opaque_struct_types {
      if it == last_added { continue; }
      print_to_builder(*builder, "% :: struct {}\n", it);
      last_added = it;
    }
    print_to_builder(*builder, "\n");
  }

  print_to_builder(*defer_init_builder, "}\n");
  append(*builder, builder_to_string(*defer_init_builder));

  ok := File.write_entire_file(config.output_pathname, *builder);
  if !ok {
    log_error("failed to write output file\n");
    exit(1);
  }
}
