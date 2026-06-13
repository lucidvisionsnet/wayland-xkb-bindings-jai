#import "Basic";
BindingsGenerator :: #import "Bindings_Generator";
BuildCpp :: #import "BuildCpp";
POSIX :: #import "POSIX";

#run generate_bindings();

generate_bindings :: () -> bool {
  if !run_jai_wayland_scanner() { return false; }
  if !generate_wayland_bindings() { return false; }
  return generate_xkb_bindings();
}

run_jai_wayland_scanner :: () -> bool {
  xmls := string.[
    "/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml",
    "/usr/share/wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml",
    "/usr/share/wayland/wayland.xml",
  ];

  command_builder: String_Builder;
  init_string_builder(*command_builder);
  print_to_builder(*command_builder, "wayland-scanner-jai client --dont-emit-opaque-decls");
  for xmls { print_to_builder(*command_builder, " %", it); }
  print_to_builder(*command_builder, " "); // Extra byte for null termination.
  cmd := builder_to_string(*command_builder);
  cmd[cmd.count - 1] = 0; // Null-terminate the string for use in POSIX.system.

  log("executing: %\n", cmd);
  exit_code := POSIX.system(cmd.data);
  if exit_code != 0 {
    log_error("scanner failed\n");
    return false;
  }

  return true;
}

generate_wayland_bindings :: () -> bool {
  // Generate bindings.
  output_filename: string;
  opts: BindingsGenerator.Generate_Bindings_Options;
  opts.generate_library_declarations = false;

  array_add(*opts.source_files, "wayland-client-core.h");
  array_add(*opts.source_files, "wayland-util.h");
  array_add(*opts.source_files, "wayland-version.h");
  array_add(*opts.libraries, .{filename="libwayland-client.so.0"});
  lib_path := "/usr/lib/x86_64-linux-gnu";
  array_add(*opts.library_search_paths, lib_path);

  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-client-core.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-util.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-version.h");

  output_filename = "wayland_bindings_gen.jai";
  return BindingsGenerator.generate_bindings(opts, output_filename);
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

