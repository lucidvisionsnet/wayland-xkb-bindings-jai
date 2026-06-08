#import "Basic";
File :: #import "File";

Node :: struct {
  name: string;
  attributes: [..] *Attribute;
  parent: *Node;
  children: [..] *Node;
  text: string;
}

Attribute :: struct {
  name: string;
  value: string;
}

eat_whitespace :: (text: *u8) -> bytes_consumed: s64 {
  index := 0;
  while is_space(text[index]) { index += 1; }
  return index;
}

/**
 * @param xml The contents of an XML file.
 * @return An XML DOM on success; null on failure. Strings in the XML DOM
 *         reference into `xml`, so `xml` should be kept alive as long as
 *         the returned XML DOM is required.
 */
parse_xml :: (xml: string) -> *Node {
  root: *Node;
  current_node: *Node;

  index := 0;
  while index < xml.count {
    if xml[index] == #char "<" {
      // Tag. Look at the next character to determine the tag type.
      if index + 1 >= xml.count { log_error("ran out of text to parse\n"); return null; }
      next_char := xml[index + 1];

      if is_alpha(next_char) {
        // Regular element tag.
        node: *Node = alloc(size_of(Node));
        node.* = .{};
        if current_node != null {
          array_add(*current_node.children, node);
          node.parent = current_node;
        } else {
          root = node;
        }
        current_node = node;

        // Parse node name.
        index += 1;
        current_node.name.data = *xml[index];
        while index < xml.count && is_alpha(xml[index]) { index += 1; }
        current_node.name.count = *xml[index] - current_node.name.data;

        index += eat_whitespace(*xml[index]);

        // Maybe parse attributes.
        if is_alpha(xml[index]) {
          while index < xml.count && is_alpha(xml[index]) {
            attr: *Attribute = alloc(size_of(Attribute));
            attr.* = .{};
            attr.name.data = *xml[index];
            while index < xml.count && xml[index] != #char "=" { index += 1; }
            attr.name.count = *xml[index] - attr.name.data;
            // Skip '="'.
            index += 2;

            attr.value.data = *xml[index];
            while index < xml.count && xml[index] != #char "\"" { index += 1; }
            attr.value.count = *xml[index] - attr.value.data;
            // Skip '"'.
            index += 1;

            array_add(*current_node.attributes, attr);
            index += eat_whitespace(*xml[index]);
          }
        }

        if xml[index] == #char ">" {
          // End of open tag. Skip character.
          index += 1;
        } else if xml[index] == #char "/" {
          // Self-closing tag. Skip "/>".
          index += 2;
          current_node = current_node.parent;
        }
      } else if next_char == #char "/" {
        // Close tag.
        while index < xml.count && xml[index] != #char ">" { index += 1; }
        // Skip ">".
        index += 1;
        current_node = current_node.parent;
      } else if next_char == #char "?" {
        // Processing instruction. Skip tag.
        while index < xml.count && xml[index] != #char ">" { index += 1; }
        index += 1; // Skip '>'.
      } else if next_char == #char "!" {
        // Markup declaration. Skip tag.
        while index < xml.count && xml[index] != #char ">" { index += 1; }
        index += 1; // Skip '>'.
      }
    } else if is_alpha(xml[index]) {
      // Text. We expect text to be followed by a tag, so search for such.
      if !current_node {
        log_error("tried to parse text with no backing node\n");
        return null;
      }
      if current_node.text {
        log_error("wanted to parse text, but current node already has text\n");
        return null;
      }
      current_node.text.data = *xml[index];
      while index < xml.count && xml[index] != #char "<" { index += 1; }
      current_node.text.count = *xml[index] - current_node.text.data;
    } else if is_space(xml[index]) {
      index += eat_whitespace(*xml[index]);
    } else {
      log_error("unexpected state\n");
      return null;
    }
  }

  return root;
}

/**
 * @param node The root of an XML DOM to delete. All memory allocated to
 *        represent the DOM is freed.
 */
delete_xml :: (node: *Node) {
  if !node return;
  for node.attributes { free(it); }
  array_free(node.attributes);
  for node.children { delete_xml(it); }
  array_free(node.children);
  free(node);
}

/**
 * A simple visualization of an XML DOM.
 *
 * @param xml The DOM root to start printing from.
 * @param print_node_text_member Controls whether a node's `text` member is
 *        printed. Pass `false` for a minimal DOM view.
 */
print_xml :: (xml: *Node, print_node_text_member: bool) {
  _print_xml :: (
    node: *Node, indent: s64, print_text: bool, builder: *String_Builder
  ) {
    for 0..indent - 1 { print_to_builder(builder, " "); }
    print_to_builder(builder, "%", node.name);

    if node.attributes {
      first := true;
      print_to_builder(builder, " (");
      for node.attributes {
        if !first { print_to_builder(builder, ", "); } else { first = false; }
        print_to_builder(builder, "%=\"%\"", it.name, it.value);
      }
      print_to_builder(builder, ")");
    }
    print_to_builder(builder, "\n");

    if print_text && node.text { print_to_builder(builder, "%\n", node.text); }

    for node.children { _print_xml(it, indent + 2, print_text, builder); }
  }
  builder: String_Builder;
  init_string_builder(*builder);
  _print_xml(xml, 0, print_node_text_member, *builder);
  print("%", builder_to_string(*builder));
}
