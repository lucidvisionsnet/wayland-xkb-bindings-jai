#load "wayland.jai";
#load "xkb.jai";

//-----------------------------------------------------------------------------
// The following are declared `static inline` or `extern` in C code generated
// from `xdg-shell.xml`, so we implement them ourselves here.
// ----------------------------------------------------------------------------

xdg_surface_interface: wl_interface #elsewhere libxdg_shell_client;
xdg_toplevel_interface: wl_interface #elsewhere libxdg_shell_client;
xdg_wm_base_interface: wl_interface #elsewhere libxdg_shell_client;

xdg_wm_base_add_listener :: (xdg_wm_base_: *xdg_wm_base, listener: *xdg_wm_base_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)xdg_wm_base_, xx listener, data);
}

// @todo(orphen): Implement these:
// xdg_wm_base_set_user_data
// xdg_wm_base_get_user_data
// xdg_wm_base_get_version

xdg_wm_base_destroy :: (the_xdg_wm_base: *xdg_wm_base) {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_wm_base,
    XDG_WM_BASE_DESTROY,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base),
    WL_MARSHAL_FLAG_DESTROY);
}

// @todo(orphen): Implement these:
// xdg_wm_base_create_positioner

xdg_wm_base_get_xdg_surface :: (the_xdg_wm_base: *xdg_wm_base, surface: *wl_surface) -> *xdg_surface #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_wm_base,
    XDG_WM_BASE_GET_XDG_SURFACE,
    *xdg_surface_interface,
    wl_proxy_get_version(cast(*wl_proxy)xdg_wm_base),
    0,
    null,
    surface);
  return cast(*xdg_surface)id;
}

xdg_wm_base_pong :: (xdg_wm_base_: *xdg_wm_base, serial: u32) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)xdg_wm_base_,
    XDG_WM_BASE_PONG,
    null,
    wl_proxy_get_version(cast(*wl_proxy)xdg_wm_base),
    0,
    serial);
}

// @todo(orphen): Implement these:
// xdg_positioner_set_user_data
// xdg_positioner_get_user_data
// xdg_positioner_get_version
// xdg_positioner_destroy
// xdg_positioner_set_size
// xdg_positioner_set_anchor_rect
// xdg_positioner_set_anchor
// xdg_positioner_set_gravity
// xdg_positioner_set_constraint_adjustment
// xdg_positioner_set_offset
// xdg_positioner_set_reactive
// xdg_positioner_set_parent_size
// xdg_positioner_set_parent_configure

xdg_surface_add_listener :: (the_xdg_surface: *xdg_surface, listener: *xdg_surface_listener, data: *void) -> int #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_xdg_surface, xx listener, data);

}

// @todo(orphen): Implement these:
// xdg_surface_set_user_data
// xdg_surface_get_user_data
// xdg_surface_get_version

xdg_surface_destroy :: (the_xdg_surface: *xdg_surface) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_surface,
    XDG_SURFACE_DESTROY,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface),
    WL_MARSHAL_FLAG_DESTROY);
}

xdg_surface_get_toplevel :: (the_xdg_surface: *xdg_surface) -> *xdg_toplevel #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_surface,
    XDG_SURFACE_GET_TOPLEVEL,
    *xdg_toplevel_interface,
    wl_proxy_get_version(cast(*wl_proxy)xdg_surface),
    0,
    null);
  return cast(*xdg_toplevel)id;
}

// @todo(orphen): Implement these:
// xdg_surface_get_popup
// xdg_surface_set_window_geometry

xdg_surface_ack_configure :: (the_xdg_surface: *xdg_surface, serial: u32) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_surface,
    XDG_SURFACE_ACK_CONFIGURE,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface),
    0,
    serial);
}

// @todo(orphen): Implement these:
// xdg_toplevel_add_listener
// xdg_toplevel_set_user_data
// xdg_toplevel_get_user_data
// xdg_toplevel_get_version
xdg_toplevel_destroy :: (the_xdg_toplevel: *xdg_toplevel) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_toplevel,
    XDG_TOPLEVEL_DESTROY,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel),
    WL_MARSHAL_FLAG_DESTROY);
}

// @todo(orphen): Implement these:
// xdg_toplevel_set_parent

xdg_toplevel_set_title :: (the_xdg_toplevel: *xdg_toplevel, title: *u8) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_toplevel,
    XDG_TOPLEVEL_SET_TITLE,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel),
    0,
    title);
}

xdg_toplevel_set_app_id :: (the_xdg_toplevel: *xdg_toplevel, app_id: *u8) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_xdg_toplevel,
    XDG_TOPLEVEL_SET_APP_ID,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel),
    0,
    app_id);
}

// @todo(orphen): Implement these:
// xdg_toplevel_show_window_menu
// xdg_toplevel_move
// xdg_toplevel_resize
// xdg_toplevel_set_max_size
// xdg_toplevel_set_min_size
// xdg_toplevel_set_maximized
// xdg_toplevel_unset_maximized
// xdg_toplevel_set_fullscreen
// xdg_toplevel_unset_fullscreen
// xdg_toplevel_set_minimized
// xdg_popup_add_listener
// xdg_popup_set_user_data
// xdg_popup_get_user_data
// xdg_popup_get_version
// xdg_popup_destroy
// xdg_popup_grab
// xdg_popup_reposition

// ----------------------------------------------------------------------------
// The following are declared `static inline` or `extern` in
// `xdg-decoration-unstable-v1-client-protocol.h`, so we implement them
// ourselves here.
//-----------------------------------------------------------------------------

zxdg_decoration_manager_v1_interface: wl_interface #elsewhere libxdg_shell_client;
zxdg_toplevel_decoration_v1_interface: wl_interface #elsewhere libxdg_shell_client;

// @todo(orphen): Implement these:
// zxdg_decoration_manager_v1_set_user_data
// zxdg_decoration_manager_v1_get_user_data
// zxdg_decoration_manager_v1_get_version
// zxdg_decoration_manager_v1_destroy
zxdg_decoration_manager_v1_get_toplevel_decoration :: (
  dm: *zxdg_decoration_manager_v1,
  toplevel: *xdg_toplevel
) -> *zxdg_toplevel_decoration_v1 #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)dm,
    ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION,
    *zxdg_toplevel_decoration_v1_interface,
    wl_proxy_get_version(cast(*wl_proxy)dm),
    0,
    null,
    toplevel);
  return cast(*zxdg_toplevel_decoration_v1)id;
}

// @todo(orphen): Implement these:
// zxdg_toplevel_decoration_v1_add_listener
// zxdg_toplevel_decoration_v1_set_user_data
// zxdg_toplevel_decoration_v1_get_user_data
// zxdg_toplevel_decoration_v1_get_version
// zxdg_toplevel_decoration_v1_destroy

zxdg_toplevel_decoration_v1_set_mode :: (decoration: *zxdg_toplevel_decoration_v1, mode: u32) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)decoration,
    ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE,
    null,
    wl_proxy_get_version(cast(*wl_proxy)decoration),
    0,
    mode);
}

// @todo(orphen): Implement these:
// zxdg_toplevel_decoration_v1_unset_mode

// ----------------------------------------------------------------------------
// The following are declared `static inline` or `extern` in
// `wayland-client-protocol.h`, so we implement them ourselves here.
//-----------------------------------------------------------------------------

// @todo(orphen): Implement these:
// wl_display_add_listener
// wl_display_set_user_data
// wl_display_get_user_data
// wl_display_get_version
// wl_display_sync

wl_display_get_registry :: (wl_display_: *wl_display) -> *wl_registry #c_call {
  registry := wl_proxy_marshal_flags(
    cast(*wl_proxy) wl_display_,
    WL_DISPLAY_GET_REGISTRY,
    *wl_registry_interface,
    wl_proxy_get_version(cast(*wl_proxy)wl_display_),
    0, 
    null);
  return cast(*wl_registry)registry;
}

wl_registry_add_listener :: (wl_registry_: *wl_registry, listener: *wl_registry_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)wl_registry_, xx listener, data);
}

// @todo(orphen): Implement these:
// wl_registry_set_user_data
// wl_registry_get_user_data
// wl_registry_get_version

wl_registry_destroy :: (wl_registry_: *wl_registry) #c_call {
  wl_proxy_destroy(cast(*wl_proxy)wl_registry_);
}

wl_registry_bind :: (wl_registry_: *wl_registry, name: u32, iface: *wl_interface, version: u32) -> *void #c_call {
  id := wl_proxy_marshal_flags(cast(*wl_proxy)wl_registry_, WL_REGISTRY_BIND, iface, version, 0, name, iface.name, version, null);
  return cast(*void)id;
}

// @todo(orphen): Implement these.
// wl_callback_add_listener
// wl_callback_set_user_data
// wl_callback_get_user_data
// wl_callback_get_version
// wl_callback_destroy
// wl_compositor_set_user_data
// wl_compositor_get_user_data
// wl_compositor_get_version

wl_compositor_destroy :: (the_wl_compositor: *wl_compositor) #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_compositor);
}

wl_compositor_create_surface :: (the_wl_compositor: *wl_compositor) -> *wl_surface #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_compositor,
    WL_COMPOSITOR_CREATE_SURFACE,
    *wl_surface_interface,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_compositor),
    0,
    null);
  return cast(*wl_surface)id;
}

// @todo(orphen): Implement these.
// wl_compositor_create_region
// wl_shm_pool_set_user_data
// wl_shm_pool_get_user_data
// wl_shm_pool_get_version

wl_shm_pool_create_buffer :: (
  the_wl_shm_pool: *wl_shm_pool,
  offset: s32,
  width: s32,
  height: s32,
  stride: s32,
  format: u32
) -> *wl_buffer #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_shm_pool,
    WL_SHM_POOL_CREATE_BUFFER,
    *wl_buffer_interface,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool),
    0,
    null,
    offset,
    width,
    height,
    stride,
    format);
  return cast(*wl_buffer)id;
}

wl_shm_pool_destroy :: (the_wl_shm_pool: *wl_shm_pool) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_shm_pool,
    WL_SHM_POOL_DESTROY,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool),
    WL_MARSHAL_FLAG_DESTROY);
}

// @todo(orphen): Implement these.
// wl_shm_pool_resize
// wl_shm_add_listener
// wl_shm_set_user_data
// wl_shm_get_user_data
// wl_shm_get_version

wl_shm_destroy :: (the_wl_shm: *wl_shm) #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_shm);
}

wl_shm_create_pool :: (the_wl_shm: *wl_shm, fd: s32, size: s32) -> *wl_shm_pool #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_shm,
    WL_SHM_CREATE_POOL,
    *wl_shm_pool_interface,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_shm),
    0,
    null,
    fd,
    size);

	return cast(*wl_shm_pool)id;
}

// @todo(orphen): Implement these.
// wl_buffer_add_listener
// wl_buffer_set_user_data
// wl_buffer_get_user_data
// wl_buffer_get_version
// wl_buffer_destroy
// wl_data_offer_add_listener
// wl_data_offer_set_user_data
// wl_data_offer_get_user_data
// wl_data_offer_get_version
// wl_data_offer_accept
// wl_data_offer_receive
// wl_data_offer_destroy
// wl_data_offer_finish
// wl_data_offer_set_actions
// wl_data_source_add_listener
// wl_data_source_set_user_data
// wl_data_source_get_user_data
// wl_data_source_get_version
// wl_data_source_offer
// wl_data_source_destroy
// wl_data_source_set_actions
// wl_data_device_add_listener
// wl_data_device_set_user_data
// wl_data_device_get_user_data
// wl_data_device_get_version
// wl_data_device_destroy
// wl_data_device_start_drag
// wl_data_device_set_selection
// wl_data_device_release
// wl_data_device_manager_set_user_data
// wl_data_device_manager_get_user_data
// wl_data_device_manager_get_version
// wl_data_device_manager_destroy
// wl_data_device_manager_create_data_source
// wl_data_device_manager_get_data_device
// wl_shell_set_user_data
// wl_shell_get_user_data
// wl_shell_get_version
// wl_shell_destroy
// wl_shell_get_shell_surface
// wl_shell_surface_add_listener
// wl_shell_surface_set_user_data
// wl_shell_surface_get_user_data
// wl_shell_surface_get_version
// wl_shell_surface_destroy
// wl_shell_surface_pong
// wl_shell_surface_move
// wl_shell_surface_resize
// wl_shell_surface_set_toplevel
// wl_shell_surface_set_transient
// wl_shell_surface_set_fullscreen
// wl_shell_surface_set_popup
// wl_shell_surface_set_maximized
// wl_shell_surface_set_title
// wl_shell_surface_set_class
// wl_surface_add_listener
// wl_surface_set_user_data
// wl_surface_get_user_data
// wl_surface_get_version

wl_surface_destroy :: (the_wl_surface: *wl_surface) {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_surface,
    WL_SURFACE_DESTROY,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_surface),
    WL_MARSHAL_FLAG_DESTROY);
}

wl_surface_attach :: (the_wl_surface: *wl_surface, buffer: *wl_buffer, x: s32, y: s32) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)the_wl_surface,
    WL_SURFACE_ATTACH,
    null,
    wl_proxy_get_version(cast(*wl_proxy)the_wl_surface),
    0,
    buffer,
    x,
    y);
}

// @todo(orphen): Implement these.
// wl_surface_damage
// wl_surface_frame
// wl_surface_set_opaque_region
// wl_surface_set_input_region

wl_surface_commit :: (the_wl_surface: *wl_surface) #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_COMMIT, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0);
}

// wl_surface_set_buffer_transform
// wl_surface_set_buffer_scale
// wl_surface_damage_buffer
// wl_surface_offset

wl_seat_add_listener :: (wl_seat_: *wl_seat, listener: *wl_seat_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)wl_seat_, xx listener, data);
}

// @todo(orphen): Implement these:
// wl_seat_set_user_data
// wl_seat_get_user_data
// wl_seat_get_version
wl_seat_destroy :: (the_wl_seat: *wl_seat) #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_seat);
}

// wl_seat_get_pointer

wl_seat_get_keyboard :: (wl_seat_: *wl_seat) -> *wl_keyboard #c_call {
  id := wl_proxy_marshal_flags(
    cast(*wl_proxy)wl_seat_,
    WL_SEAT_GET_KEYBOARD,
    *wl_keyboard_interface,
    wl_proxy_get_version(cast(*wl_proxy)wl_seat_),
    0,
    null);
  return cast(*wl_keyboard)id;
}

// @todo(orphen): Implement these:
// wl_seat_get_touch
// wl_seat_release
// wl_pointer_add_listener
// wl_pointer_set_user_data
// wl_pointer_get_user_data
// wl_pointer_get_version
// wl_pointer_destroy
// wl_pointer_set_cursor
// wl_pointer_release

wl_keyboard_add_listener :: (wl_keyboard_: *wl_keyboard, listener: *wl_keyboard_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)wl_keyboard_, xx listener, data);
}

// @todo(orphen): Implement these:
// wl_keyboard_set_user_data
// wl_keyboard_get_user_data
// wl_keyboard_get_version
// wl_keyboard_destroy

wl_keyboard_release :: (wl_keyboard_: *wl_keyboard) #c_call {
  wl_proxy_marshal_flags(
    cast(*wl_proxy)wl_keyboard_,
    WL_KEYBOARD_RELEASE,
    null,
    wl_proxy_get_version(cast(*wl_proxy)wl_keyboard_),
    WL_MARSHAL_FLAG_DESTROY);
}

// @todo(orphen): Implement these:
// wl_touch_add_listener
// wl_touch_set_user_data
// wl_touch_get_user_data
// wl_touch_get_version
// wl_touch_destroy
// wl_touch_release
// wl_output_add_listener
// wl_output_set_user_data
// wl_output_get_user_data
// wl_output_get_version
// wl_output_destroy
// wl_output_release
// wl_region_set_user_data
// wl_region_get_user_data
// wl_region_get_version
// wl_region_destroy
// wl_region_add
// wl_region_subtract
// wl_subcompositor_set_user_data
// wl_subcompositor_get_user_data
// wl_subcompositor_get_version
// wl_subcompositor_destroy
// wl_subcompositor_get_subsurface
// wl_subsurface_set_user_data
// wl_subsurface_get_user_data
// wl_subsurface_get_version
// wl_subsurface_destroy
// wl_subsurface_set_position
// wl_subsurface_place_above
// wl_subsurface_place_below
// wl_subsurface_set_sync
// wl_subsurface_set_desync
