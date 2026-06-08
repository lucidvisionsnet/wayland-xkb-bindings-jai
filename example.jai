#import "Basic";
POSIX :: #import "POSIX";
Wayland :: #import,file "module.jai";

WIDTH_PX:  u64 : 640;
HEIGHT_PX: u64 : 480;

ClientState :: struct {
  running: bool;

  wl_compositor: *Wayland.wl_compositor;
  wl_display: *Wayland.wl_display;
  wl_keyboard: *Wayland.wl_keyboard;
  wl_registry: *Wayland.wl_registry;
  wl_seat: *Wayland.wl_seat;
  wl_shm: *Wayland.wl_shm;
  wl_surface: *Wayland.wl_surface;
  xdg_decoration_manager: *Wayland.zxdg_decoration_manager_v1;
  xdg_surface: *Wayland.xdg_surface;
  xdg_toplevel: *Wayland.xdg_toplevel;
  xdg_toplevel_decoration: *Wayland.zxdg_toplevel_decoration_v1;
  xdg_wm_base: *Wayland.xdg_wm_base;

  xkb_context: *Wayland.xkb_context;
  xkb_keymap: *Wayland.xkb_keymap;
  xkb_state: *Wayland.xkb_state;
}

wl_seat_capabilities :: (data: *void, wl_seat: *Wayland.wl_seat, caps_: u32) #c_call {
  state := cast(*ClientState)data;
  caps := cast(Wayland.wl_seat_capability_e)caps_;

  if caps & .WL_SEAT_CAPABILITY_KEYBOARD {
    if !state.wl_keyboard {
      state.wl_keyboard = Wayland.wl_seat_get_keyboard(wl_seat);
      Wayland.wl_keyboard_add_listener(state.wl_keyboard, *wl_keyboard_listener, state);
    }
  } else if state.wl_keyboard {
    Wayland.wl_keyboard_release(state.wl_keyboard);
    state.wl_keyboard = null;
  }
}

wl_seat_name :: (data: *void, wl_seat: *Wayland.wl_seat, name: *u8) #c_call {
}

wl_seat_listener := Wayland.wl_seat_listener.{
  capabilities = wl_seat_capabilities,
  name = wl_seat_name
};

wl_keyboard_keymap :: (data: *void, wl_keyboard: *Wayland.wl_keyboard, format: u32, fd: s32, size: u32) #c_call {
  state := cast(*ClientState)data;
  if (format != xx Wayland.wl_keyboard_keymap_format_e.WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1) {
      POSIX.close(fd);
      return;
  }

  map_shm := POSIX.mmap(null, size, POSIX.PROT_READ, POSIX.MAP_PRIVATE, fd, 0);
  push_context {
    assert(map_shm != POSIX.MAP_FAILED);
  }

  keymap := Wayland.xkb_keymap_new_from_string(
      state.xkb_context,
      map_shm,
      Wayland.xkb_keymap_format.XKB_KEYMAP_FORMAT_TEXT_V1,
      Wayland.xkb_keymap_compile_flags.XKB_KEYMAP_COMPILE_NO_FLAGS);
  POSIX.munmap(map_shm, size);
  POSIX.close(fd);

  if (keymap) {
      Wayland.xkb_keymap_unref(state.xkb_keymap);
      Wayland.xkb_state_unref(state.xkb_state);
      state.xkb_keymap = keymap;
      state.xkb_state = Wayland.xkb_state_new(keymap);
  }
}

wl_keyboard_enter :: (
  data: *void, wl_keyboard: *Wayland.wl_keyboard, serial: u32, wl_surface: *Wayland.wl_surface, keys: *Wayland.wl_array) #c_call {
}

wl_keyboard_leave :: (data: *void, wl_keyboard: *Wayland.wl_keyboard, serial: u32, surface: *Wayland.wl_surface) #c_call {
}

wl_keyboard_key :: (data: *void, wl_keyboard: *Wayland.wl_keyboard, serial: u32, time: u32, key: u32, state: u32) #c_call {
  client_state := cast(*ClientState)data;
  if (!client_state.xkb_state) return;

  keycode: u32 = key + 8; // evdev -> XKB offset
  sym := Wayland.xkb_state_key_get_one_sym(client_state.xkb_state, keycode);

  keysym_buf: [128]u8;
  Wayland.xkb_keysym_get_name(sym, keysym_buf.data, keysym_buf.count);

  action := ifx state == xx Wayland.wl_keyboard_key_state_e.WL_KEYBOARD_KEY_STATE_PRESSED then "pressed" else "released";
  push_context {
    print("Key %: % (keysym %)\n", action, to_string(keysym_buf), sym);
  }

  // Wayland.xkb_state_key_get_utf8(client_state.xkb_state, keycode, keysym_buf.data, keysym_buf.count);
  // push_context {
  //   if keysym_buf.count print("  UTF-8: %s\n", to_string(keysym_buf));
  // }

  // Exit on ESC.
  if (state == xx Wayland.wl_keyboard_key_state_e.WL_KEYBOARD_KEY_STATE_PRESSED) && (sym == Wayland.XKB_KEY_Escape) {
      client_state.running = false;
  }
}

wl_keyboard_modifiers :: (
  data: *void,
  wl_keyboard: *Wayland.wl_keyboard, 
  serial: u32,
  mods_depressed: u32,
  mods_latched: u32,
  mods_locked: u32,
  group: u32
) #c_call {
  state := cast(*ClientState)data;
  if (state.xkb_state) {
      Wayland.xkb_state_update_mask(state.xkb_state, mods_depressed, mods_latched, mods_locked, 0, 0, group);
  }
}

wl_keyboard_repeat_info :: (data: *void, wl_keyboard: *Wayland.wl_keyboard, rate: s32, delay: s32) #c_call {
}

wl_keyboard_listener := Wayland.wl_keyboard_listener.{
  keymap = wl_keyboard_keymap,
  enter = wl_keyboard_enter,
  leave = wl_keyboard_leave,
  key = wl_keyboard_key,
  modifiers = wl_keyboard_modifiers,
  repeat_info = wl_keyboard_repeat_info
};

xdg_wm_base_ping :: (data: *void, xdg_wm_base: *Wayland.xdg_wm_base, serial: u32) #c_call {
  Wayland.xdg_wm_base_pong(xdg_wm_base, serial);
}

xdg_wm_base_listener := Wayland.xdg_wm_base_listener.{
  ping = xdg_wm_base_ping,
};

allocate_shm_file :: (size: u64) -> s32 #c_call {
  name := "/wl_shm-jai-wayland-example";
  fd := POSIX.shm_open(name.data, POSIX.O_RDWR | POSIX.O_CREAT | POSIX.O_EXCL, 0600);
  if (fd < 0) return -1;
  POSIX.shm_unlink(name.data);
  if (POSIX.ftruncate(fd, cast(s64)size) < 0) {
      POSIX.close(fd);
      return -1;
  }
  return fd;
}

draw_frame :: (state: *ClientState) -> *Wayland.wl_buffer #c_call {
  bytes_per_pixel: u64 = 4;
  pixel_stride := WIDTH_PX * bytes_per_pixel;
  buffer_size := pixel_stride * HEIGHT_PX;

  fd := allocate_shm_file(buffer_size);
  if (fd == -1) return null;

  data := cast(*u32)POSIX.mmap(null, buffer_size, POSIX.PROT_READ | POSIX.PROT_WRITE, POSIX.MAP_SHARED, fd, 0);
  if (data == POSIX.MAP_FAILED) {
      POSIX.close(fd);
      return null;
  }

  pool := Wayland.wl_shm_create_pool(state.wl_shm, fd, cast(s32)buffer_size);
  buffer := Wayland.wl_shm_pool_create_buffer(
    pool,
    0,
    xx WIDTH_PX,
    xx HEIGHT_PX,
    xx pixel_stride,
    xx Wayland.wl_shm_format_e.WL_SHM_FORMAT_XRGB8888);
  Wayland.wl_shm_pool_destroy(pool);
  POSIX.close(fd);

  color: u32 = 0xff00a0ff;
  for 0..(WIDTH_PX * HEIGHT_PX) - 1 {
    data[it] = color;
  }

  POSIX.munmap(data, buffer_size);
  return buffer;
}

xdg_surface_configure :: (data: *void, xdg_surface: *Wayland.xdg_surface, serial: u32) #c_call {
  state := cast(*ClientState)data;
  Wayland.xdg_surface_ack_configure(xdg_surface, serial);

  buffer := draw_frame(state);
  Wayland.wl_surface_attach(state.wl_surface, buffer, 0, 0);
  Wayland.wl_surface_commit(state.wl_surface);
}

xdg_surface_listener := Wayland.xdg_surface_listener.{
  configure = xdg_surface_configure,
};

streq :: (a: *u8, b: *u8) -> bool #c_call {
  if a == null && b == null { return true; }
  if a == null || b == null { return false; }
  i: u32;
  while a[i] && b[i] && (a[i] == b[i]) { i += 1; }
  return a[i] == b[i];
}

registry_global :: (data: *void, wl_registry: *Wayland.wl_registry, name: u32, iface: *u8, version: u32) #c_call {
  state := cast(*ClientState)data;

  if streq(iface, Wayland.wl_shm_interface.name) {
    state.wl_shm = Wayland.wl_registry_bind(wl_registry, name, *Wayland.wl_shm_interface, 1);
  } else if streq(iface, Wayland.wl_compositor_interface.name) {
    state.wl_compositor = Wayland.wl_registry_bind(wl_registry, name, *Wayland.wl_compositor_interface, 4);
  } else if streq(iface, Wayland.xdg_wm_base_interface.name) {
    state.xdg_wm_base = Wayland.wl_registry_bind(wl_registry, name, *Wayland.xdg_wm_base_interface, 1);
    Wayland.xdg_wm_base_add_listener(state.xdg_wm_base, *xdg_wm_base_listener, state);
  } else if streq(iface, Wayland.wl_seat_interface.name) {
    state.wl_seat = Wayland.wl_registry_bind(wl_registry, name, *Wayland.wl_seat_interface, 5);
    Wayland.wl_seat_add_listener(state.wl_seat, *wl_seat_listener, state);
  } else if streq(iface, Wayland.zxdg_decoration_manager_v1_interface.name) {
    state.xdg_decoration_manager = Wayland.wl_registry_bind(wl_registry, name, *Wayland.zxdg_decoration_manager_v1_interface, 1);
  }
}

main :: () {
  Wayland.init_wayland_protocol_bindings();

  state: ClientState;

  state.xkb_context = Wayland.xkb_context_new(Wayland.xkb_context_flags.XKB_CONTEXT_NO_FLAGS);
  assert(state.xkb_context != null, "error: failed to get an xkb context\n");

  state.wl_display = Wayland.wl_display_connect(null);
  assert(state.wl_display != null, "error: failed to connect to the Wayland compositor\n");

  state.wl_registry = Wayland.wl_display_get_registry(state.wl_display);
  assert(state.wl_registry != null, "error: failed to get the registry from the display\n");
  listener := Wayland.wl_registry_listener.{
    global = registry_global
  };
  Wayland.wl_registry_add_listener(state.wl_registry, *listener, *state);

  Wayland.wl_display_roundtrip(state.wl_display);
  assert(state.wl_compositor && state.xdg_wm_base && state.wl_shm);

  state.wl_surface = Wayland.wl_compositor_create_surface(state.wl_compositor);
  state.xdg_surface = Wayland.xdg_wm_base_get_xdg_surface(state.xdg_wm_base, state.wl_surface);
  Wayland.xdg_surface_add_listener(state.xdg_surface, *xdg_surface_listener, *state);

  state.xdg_toplevel = Wayland.xdg_surface_get_toplevel(state.xdg_surface);
  // Request window decorations (title bar, close button, etc.).
  // Note that GNOME on Ubuntu 24.04 does not support server-side decorations,
  // meaning you will need to render these yourself.
  if state.xdg_decoration_manager {
    state.xdg_toplevel_decoration = Wayland.zxdg_decoration_manager_v1_get_toplevel_decoration(
      state.xdg_decoration_manager, state.xdg_toplevel);
    Wayland.zxdg_toplevel_decoration_v1_set_mode(
      state.xdg_toplevel_decoration,
      xx Wayland.zxdg_toplevel_decoration_v1_mode_e.ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE);
  }
  Wayland.xdg_toplevel_set_title(state.xdg_toplevel, "Jai Wayland Example");
  Wayland.xdg_toplevel_set_app_id(state.xdg_toplevel, "org.example.wayland.jai");

  Wayland.wl_surface_commit(state.wl_surface);

  state.running = true;
  while state.running {
    Wayland.wl_display_dispatch_pending(state.wl_display);
    if Wayland.wl_display_prepare_read(state.wl_display) == 0 {
      Wayland.wl_display_read_events(state.wl_display);
      Wayland.wl_display_dispatch_pending(state.wl_display);
    } else { // Someone else (ex: a different thread) prepared a read.
      Wayland.wl_display_cancel_read(state.wl_display);
    }

    // This is where other work would go, like game logic.

    Wayland.wl_display_flush(state.wl_display);
    POSIX.usleep(16_000); // 16 ms, ~60 fps.
  }

  if state.wl_keyboard   Wayland.wl_keyboard_release(state.wl_keyboard);
  if state.xdg_toplevel  Wayland.xdg_toplevel_destroy(state.xdg_toplevel);
  if state.xdg_surface   Wayland.xdg_surface_destroy(state.xdg_surface);
  if state.wl_surface    Wayland.wl_surface_destroy(state.wl_surface);
  if state.xdg_wm_base   Wayland.xdg_wm_base_destroy(state.xdg_wm_base);
  if state.wl_compositor Wayland.wl_compositor_destroy(state.wl_compositor);
  if state.wl_shm        Wayland.wl_shm_destroy(state.wl_shm);
  if state.wl_seat       Wayland.wl_seat_destroy(state.wl_seat);
  if state.wl_registry   Wayland.wl_registry_destroy(state.wl_registry);

  if state.xkb_state     Wayland.xkb_state_unref(state.xkb_state);
  if state.xkb_keymap    Wayland.xkb_keymap_unref(state.xkb_keymap);
  if state.xkb_context   Wayland.xkb_context_unref(state.xkb_context);

  Wayland.wl_display_disconnect(state.wl_display);
}
