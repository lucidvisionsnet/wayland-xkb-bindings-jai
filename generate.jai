#import "Basic";
BindingsGenerator :: #import "Bindings_Generator";
BuildCpp :: #import "BuildCpp";
Compiler :: #import "Compiler";
POSIX :: #import "POSIX";

EmitFor :: enum {
  CLIENT :: 0;
  SERVER :: 1;
}

USAGE :: #string EOS
usage: jai generate.jai [...] - [{client|server}]

Options:
  {client|server}    Generate bindings for client or server applications. If
                     not provided, the tool generates bindings for clients.
EOS;

#run generate_bindings();

generate_bindings :: () -> bool {
  Compiler.set_build_options_dc(.{ do_output = false });

  options := Compiler.get_build_options();
  args := options.compile_time_command_line;

  side: EmitFor;
  if args.count == {
    case 0;
      side = .CLIENT;
    case 1;
      if args[0] == {
        case "client";
          side = .CLIENT;
        case "server";
          side = .SERVER;
        case;
          print(USAGE);
          return false;
      }
    case;
      print(USAGE);
      return false;
  }

  if !run_wayland_scanner_jai(side) { return false; }
  if !generate_wayland_bindings(side) { return false; }
  return generate_xkb_bindings();
}

run_wayland_scanner_jai :: (side: EmitFor) -> bool {
  xmls: [..] string;
  if side == {
    case .CLIENT;
      array_add(*xmls, "/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml");
      array_add(*xmls, "/usr/share/wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml");
      array_add(*xmls, "/usr/share/wayland/wayland.xml");
    case;
      array_add(*xmls, "/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml");
      array_add(*xmls, "/usr/share/wayland/wayland.xml");
  }

  command_builder: String_Builder;
  init_string_builder(*command_builder);
  print_to_builder(
    *command_builder,
    "./wayland-scanner-jai % --dont-emit-opaque-decls",
    ifx side == .CLIENT "client" else "server"
  );
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

generate_wayland_bindings :: (side: EmitFor) -> bool {
  // Generate bindings.
  output_filename: string;
  opts: BindingsGenerator.Generate_Bindings_Options;
  opts.generate_library_declarations = false;

  if side == {
    case .CLIENT;
      array_add(*opts.source_files, "wayland-client-core.h");
      array_add(*opts.libraries, .{filename="libwayland-client.so.0"});
      array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-client-core.h");
    case;
      array_add(*opts.source_files, "wayland-server-core.h");
      array_add(*opts.libraries, .{filename="libwayland-server.so.0"});
      array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-server-core.h");
  }

  array_add(*opts.source_files, "wayland-util.h");
  array_add(*opts.source_files, "wayland-version.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-util.h");
  array_add(*opts.path_fragments_to_treat_as_non_system_paths, "wayland-version.h");

  lib_path := "/usr/lib/x86_64-linux-gnu";
  array_add(*opts.library_search_paths, lib_path);

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
