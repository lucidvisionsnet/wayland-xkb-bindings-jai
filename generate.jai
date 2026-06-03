#import "Basic";
BindingsGenerator :: #import "Bindings_Generator";
BuildCpp :: #import "BuildCpp";

#run generate_bindings();

generate_bindings :: () -> bool {
  if !generate_wayland_bindings() return false;
  return generate_xkb_bindings();
}

generate_wayland_bindings :: () -> bool {
  // Compile the xdg-shell-client library (with some extras) from generated C.
  files := string.[
    "xdg-decoration-unstable-v1-client-protocol.c",
    "xdg-shell-client-protocol.c",
    "wayland-client-protocol.c"
  ];
  success := BuildCpp.build_cpp_dynamic_lib("xdg_shell_client", ..files, debug=true);
  if !success {
    print("Failed to build the xdg-shell-client library.\n");
    return false;
  }

  // Generate bindings.
  output_filename: string;
  opts: BindingsGenerator.Generate_Bindings_Options;
  opts.generate_library_declarations = false;

  array_add(*opts.source_files, "xdg-shell-client-protocol.h");
  array_add(*opts.source_files, "xdg-decoration-unstable-v1-client-protocol.h");
  array_add(*opts.source_files, "wayland-client-core.h");
  array_add(*opts.libraries, .{filename="libwayland-client.so.0"});
  lib_path := "/usr/lib/x86_64-linux-gnu";
  array_add(*opts.library_search_paths, lib_path);

  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-client-core.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-client-protocol.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-util.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-version.h");

  opts.visitor_with_data = wayland_declaration_visitor_with_data;

  HEADER :: #string EOS
libwayland_client   :: #library,system "libwayland-client.so.0";
libxdg_shell_client :: #library "./xdg_shell_client";
EOS;
  opts.header = HEADER;

  output_filename = "wayland.jai";
  return BindingsGenerator.generate_bindings(opts, output_filename);
}

wayland_declaration_visitor_with_data :: (
  decl: *BindingsGenerator.Declaration,
  parent_decl: *BindingsGenerator.Declaration,
  user_data: *void
) -> BindingsGenerator.Declaration_Visit_Result {
  // The Wayland API features instances of function parameters with the same
  // name as the types they point to (ex: `foo* foo`). When translated to Jai,
  // these produce compile errors ("Attempt to use a value inside its own
  // declaration"). To avoid this, we modify the declaration name.
  // @todo(orphen): Make sure the new name we choose is not already in use?
  if decl.type && decl.type.pointer_to && decl.type.pointer_to.type_of_function {
    for decl.type.pointer_to.type_of_function.arguments {
      if it.type && it.type.pointer_to && it.type.pointer_to.type_of_struct {
        if it.name == it.type.pointer_to.type_of_struct.name {
          BindingsGenerator.log(decl.location, "Disambiguating identifier '%' from its type with trailing '_'.\n", it.name);
          it.output_name = tprint("%_", it.name);
        }
      }
    }
  }

  return .RECURSE;
}

generate_xkb_bindings :: () -> bool {
  output_filename: string;
  opts: BindingsGenerator.Generate_Bindings_Options;
  opts.generate_library_declarations = false;

  array_add(*opts.source_files, "/usr/include/xkbcommon/xkbcommon.h");
  array_add(*opts.source_files, "/usr/include/xkbcommon/xkbcommon-names.h");
  array_add(*opts.source_files, "/usr/include/xkbcommon/xkbcommon-keysyms.h");
  array_add(*opts.libraries, .{filename="libxkbcommon.so.0"});
  lib_path := "/usr/include/xkbcommon";
  array_add(*opts.library_search_paths, lib_path);

  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "xkbcommon.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "xkbcommon-names.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "xkbcommon-keysyms.h");

  HEADER :: #string EOS
#import "POSIX"; // Required for `FILE`, etc.
libxkbcommon :: #library,system "libxkbcommon.so.0";
EOS;
  opts.header = HEADER;

  output_filename = "xkb.jai";
  return BindingsGenerator.generate_bindings(opts, output_filename);
}

