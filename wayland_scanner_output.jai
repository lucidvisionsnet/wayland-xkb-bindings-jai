// Protocol xdg_shell

// Interface xdg_wm_base

xdg_wm_base_error_e :: enum u32 {
  XDG_WM_BASE_ERROR_ROLE :: 0;
  XDG_WM_BASE_ERROR_DEFUNCT_SURFACES :: 1;
  XDG_WM_BASE_ERROR_NOT_THE_TOPMOST_POPUP :: 2;
  XDG_WM_BASE_ERROR_INVALID_POPUP_PARENT :: 3;
  XDG_WM_BASE_ERROR_INVALID_SURFACE_STATE :: 4;
  XDG_WM_BASE_ERROR_INVALID_POSITIONER :: 5;
  XDG_WM_BASE_ERROR_UNRESPONSIVE :: 6;
}

xdg_wm_base_listener :: struct {
  ping: #type (data: *void, the_xdg_wm_base: *xdg_wm_base, serial: u32) -> void #c_call;
}

xdg_wm_base_add_listener :: (the_xdg_wm_base: *xdg_wm_base, listener: *xdg_wm_base_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_xdg_wm_base, xx listener, data);
}

XDG_WM_BASE_DESTROY: u32 : 0;
XDG_WM_BASE_CREATE_POSITIONER: u32 : 1;
XDG_WM_BASE_GET_XDG_SURFACE: u32 : 2;
XDG_WM_BASE_PONG: u32 : 3;

XDG_WM_BASE_PING_SINCE_VERSION: u32 : 1;
XDG_WM_BASE_DESTROY_SINCE_VERSION: u32 : 1;
XDG_WM_BASE_CREATE_POSITIONER_SINCE_VERSION: u32 : 1;
XDG_WM_BASE_GET_XDG_SURFACE_SINCE_VERSION: u32 : 1;
XDG_WM_BASE_PONG_SINCE_VERSION: u32 : 1;

xdg_wm_base_set_user_data :: (the_xdg_wm_base: *xdg_wm_base, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_xdg_wm_base, user_data);
}

xdg_wm_base_get_user_data :: (the_xdg_wm_base: *xdg_wm_base) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_xdg_wm_base);
}

xdg_wm_base_get_version :: (the_xdg_wm_base: *xdg_wm_base) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base);
}

xdg_wm_base_destroy :: (the_xdg_wm_base: *xdg_wm_base) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_wm_base, XDG_WM_BASE_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base), WL_MARSHAL_FLAG_DESTROY);
}

xdg_wm_base_create_positioner :: (the_xdg_wm_base: *xdg_wm_base) -> *xdg_positioner #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_wm_base, XDG_WM_BASE_CREATE_POSITIONER, *xdg_positioner_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base), 0, null);
  return cast(*xdg_positioner)id;
}

xdg_wm_base_get_xdg_surface :: (the_xdg_wm_base: *xdg_wm_base, surface: *wl_surface) -> *xdg_surface #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_wm_base, XDG_WM_BASE_GET_XDG_SURFACE, *xdg_surface_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base), 0, null, surface);
  return cast(*xdg_surface)id;
}

xdg_wm_base_pong :: (the_xdg_wm_base: *xdg_wm_base, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_wm_base, XDG_WM_BASE_PONG, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_wm_base), 0, serial);
}

// Interface xdg_positioner

xdg_positioner_error_e :: enum u32 {
  XDG_POSITIONER_ERROR_INVALID_INPUT :: 0;
}

xdg_positioner_anchor_e :: enum u32 {
  XDG_POSITIONER_ANCHOR_NONE :: 0;
  XDG_POSITIONER_ANCHOR_TOP :: 1;
  XDG_POSITIONER_ANCHOR_BOTTOM :: 2;
  XDG_POSITIONER_ANCHOR_LEFT :: 3;
  XDG_POSITIONER_ANCHOR_RIGHT :: 4;
  XDG_POSITIONER_ANCHOR_TOP_LEFT :: 5;
  XDG_POSITIONER_ANCHOR_BOTTOM_LEFT :: 6;
  XDG_POSITIONER_ANCHOR_TOP_RIGHT :: 7;
  XDG_POSITIONER_ANCHOR_BOTTOM_RIGHT :: 8;
}

xdg_positioner_gravity_e :: enum u32 {
  XDG_POSITIONER_GRAVITY_NONE :: 0;
  XDG_POSITIONER_GRAVITY_TOP :: 1;
  XDG_POSITIONER_GRAVITY_BOTTOM :: 2;
  XDG_POSITIONER_GRAVITY_LEFT :: 3;
  XDG_POSITIONER_GRAVITY_RIGHT :: 4;
  XDG_POSITIONER_GRAVITY_TOP_LEFT :: 5;
  XDG_POSITIONER_GRAVITY_BOTTOM_LEFT :: 6;
  XDG_POSITIONER_GRAVITY_TOP_RIGHT :: 7;
  XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT :: 8;
}

xdg_positioner_constraint_adjustment_e :: enum u32 {
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE :: 0;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X :: 1;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y :: 2;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_X :: 4;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_Y :: 8;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_X :: 16;
  XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_Y :: 32;
}


XDG_POSITIONER_DESTROY: u32 : 0;
XDG_POSITIONER_SET_SIZE: u32 : 1;
XDG_POSITIONER_SET_ANCHOR_RECT: u32 : 2;
XDG_POSITIONER_SET_ANCHOR: u32 : 3;
XDG_POSITIONER_SET_GRAVITY: u32 : 4;
XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT: u32 : 5;
XDG_POSITIONER_SET_OFFSET: u32 : 6;
XDG_POSITIONER_SET_REACTIVE: u32 : 7;
XDG_POSITIONER_SET_PARENT_SIZE: u32 : 8;
XDG_POSITIONER_SET_PARENT_CONFIGURE: u32 : 9;

XDG_POSITIONER_DESTROY_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_SIZE_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_ANCHOR_RECT_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_ANCHOR_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_GRAVITY_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_OFFSET_SINCE_VERSION: u32 : 1;
XDG_POSITIONER_SET_REACTIVE_SINCE_VERSION: u32 : 3;
XDG_POSITIONER_SET_PARENT_SIZE_SINCE_VERSION: u32 : 3;
XDG_POSITIONER_SET_PARENT_CONFIGURE_SINCE_VERSION: u32 : 3;

xdg_positioner_set_user_data :: (the_xdg_positioner: *xdg_positioner, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_xdg_positioner, user_data);
}

xdg_positioner_get_user_data :: (the_xdg_positioner: *xdg_positioner) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_xdg_positioner);
}

xdg_positioner_get_version :: (the_xdg_positioner: *xdg_positioner) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner);
}

xdg_positioner_destroy :: (the_xdg_positioner: *xdg_positioner) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), WL_MARSHAL_FLAG_DESTROY);
}

xdg_positioner_set_size :: (the_xdg_positioner: *xdg_positioner, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_SIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, width, height);
}

xdg_positioner_set_anchor_rect :: (the_xdg_positioner: *xdg_positioner, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_ANCHOR_RECT, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, x, y, width, height);
}

xdg_positioner_set_anchor :: (the_xdg_positioner: *xdg_positioner, anchor: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_ANCHOR, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, anchor);
}

xdg_positioner_set_gravity :: (the_xdg_positioner: *xdg_positioner, gravity: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_GRAVITY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, gravity);
}

xdg_positioner_set_constraint_adjustment :: (the_xdg_positioner: *xdg_positioner, constraint_adjustment: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, constraint_adjustment);
}

xdg_positioner_set_offset :: (the_xdg_positioner: *xdg_positioner, x: s32, y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_OFFSET, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, x, y);
}

xdg_positioner_set_reactive :: (the_xdg_positioner: *xdg_positioner) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_REACTIVE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0);
}

xdg_positioner_set_parent_size :: (the_xdg_positioner: *xdg_positioner, parent_width: s32, parent_height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_PARENT_SIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, parent_width, parent_height);
}

xdg_positioner_set_parent_configure :: (the_xdg_positioner: *xdg_positioner, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_positioner, XDG_POSITIONER_SET_PARENT_CONFIGURE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_positioner), 0, serial);
}

// Interface xdg_surface

xdg_surface_error_e :: enum u32 {
  XDG_SURFACE_ERROR_NOT_CONSTRUCTED :: 1;
  XDG_SURFACE_ERROR_ALREADY_CONSTRUCTED :: 2;
  XDG_SURFACE_ERROR_UNCONFIGURED_BUFFER :: 3;
  XDG_SURFACE_ERROR_INVALID_SERIAL :: 4;
  XDG_SURFACE_ERROR_INVALID_SIZE :: 5;
  XDG_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT :: 6;
}

xdg_surface_listener :: struct {
  configure: #type (data: *void, the_xdg_surface: *xdg_surface, serial: u32) -> void #c_call;
}

xdg_surface_add_listener :: (the_xdg_surface: *xdg_surface, listener: *xdg_surface_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_xdg_surface, xx listener, data);
}

XDG_SURFACE_DESTROY: u32 : 0;
XDG_SURFACE_GET_TOPLEVEL: u32 : 1;
XDG_SURFACE_GET_POPUP: u32 : 2;
XDG_SURFACE_SET_WINDOW_GEOMETRY: u32 : 3;
XDG_SURFACE_ACK_CONFIGURE: u32 : 4;

XDG_SURFACE_CONFIGURE_SINCE_VERSION: u32 : 1;
XDG_SURFACE_DESTROY_SINCE_VERSION: u32 : 1;
XDG_SURFACE_GET_TOPLEVEL_SINCE_VERSION: u32 : 1;
XDG_SURFACE_GET_POPUP_SINCE_VERSION: u32 : 1;
XDG_SURFACE_SET_WINDOW_GEOMETRY_SINCE_VERSION: u32 : 1;
XDG_SURFACE_ACK_CONFIGURE_SINCE_VERSION: u32 : 1;

xdg_surface_set_user_data :: (the_xdg_surface: *xdg_surface, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_xdg_surface, user_data);
}

xdg_surface_get_user_data :: (the_xdg_surface: *xdg_surface) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_xdg_surface);
}

xdg_surface_get_version :: (the_xdg_surface: *xdg_surface) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface);
}

xdg_surface_destroy :: (the_xdg_surface: *xdg_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_surface, XDG_SURFACE_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface), WL_MARSHAL_FLAG_DESTROY);
}

xdg_surface_get_toplevel :: (the_xdg_surface: *xdg_surface) -> *xdg_toplevel #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_surface, XDG_SURFACE_GET_TOPLEVEL, *xdg_toplevel_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface), 0, null);
  return cast(*xdg_toplevel)id;
}

xdg_surface_get_popup :: (the_xdg_surface: *xdg_surface, parent: *xdg_surface, positioner: *xdg_positioner) -> *xdg_popup #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_surface, XDG_SURFACE_GET_POPUP, *xdg_popup_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface), 0, null, parent, positioner);
  return cast(*xdg_popup)id;
}

xdg_surface_set_window_geometry :: (the_xdg_surface: *xdg_surface, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_surface, XDG_SURFACE_SET_WINDOW_GEOMETRY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface), 0, x, y, width, height);
}

xdg_surface_ack_configure :: (the_xdg_surface: *xdg_surface, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_surface, XDG_SURFACE_ACK_CONFIGURE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_surface), 0, serial);
}

// Interface xdg_toplevel

xdg_toplevel_error_e :: enum u32 {
  XDG_TOPLEVEL_ERROR_INVALID_RESIZE_EDGE :: 0;
  XDG_TOPLEVEL_ERROR_INVALID_PARENT :: 1;
  XDG_TOPLEVEL_ERROR_INVALID_SIZE :: 2;
}

xdg_toplevel_resize_edge_e :: enum u32 {
  XDG_TOPLEVEL_RESIZE_EDGE_NONE :: 0;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP :: 1;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM :: 2;
  XDG_TOPLEVEL_RESIZE_EDGE_LEFT :: 4;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT :: 5;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT :: 6;
  XDG_TOPLEVEL_RESIZE_EDGE_RIGHT :: 8;
  XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT :: 9;
  XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT :: 10;
}

xdg_toplevel_state_e :: enum u32 {
  XDG_TOPLEVEL_STATE_MAXIMIZED :: 1;
  XDG_TOPLEVEL_STATE_FULLSCREEN :: 2;
  XDG_TOPLEVEL_STATE_RESIZING :: 3;
  XDG_TOPLEVEL_STATE_ACTIVATED :: 4;
  XDG_TOPLEVEL_STATE_TILED_LEFT :: 5;
  XDG_TOPLEVEL_STATE_TILED_RIGHT :: 6;
  XDG_TOPLEVEL_STATE_TILED_TOP :: 7;
  XDG_TOPLEVEL_STATE_TILED_BOTTOM :: 8;
  XDG_TOPLEVEL_STATE_SUSPENDED :: 9;
  XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT :: 10;
  XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT :: 11;
  XDG_TOPLEVEL_STATE_CONSTRAINED_TOP :: 12;
  XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM :: 13;
}
XDG_TOPLEVEL_STATE_TILED_LEFT_SINCE_VERSION: u32 : 2;
XDG_TOPLEVEL_STATE_TILED_RIGHT_SINCE_VERSION: u32 : 2;
XDG_TOPLEVEL_STATE_TILED_TOP_SINCE_VERSION: u32 : 2;
XDG_TOPLEVEL_STATE_TILED_BOTTOM_SINCE_VERSION: u32 : 2;
XDG_TOPLEVEL_STATE_SUSPENDED_SINCE_VERSION: u32 : 6;
XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT_SINCE_VERSION: u32 : 7;
XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT_SINCE_VERSION: u32 : 7;
XDG_TOPLEVEL_STATE_CONSTRAINED_TOP_SINCE_VERSION: u32 : 7;
XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM_SINCE_VERSION: u32 : 7;

xdg_toplevel_wm_capabilities_e :: enum u32 {
  XDG_TOPLEVEL_WM_CAPABILITIES_WINDOW_MENU :: 1;
  XDG_TOPLEVEL_WM_CAPABILITIES_MAXIMIZE :: 2;
  XDG_TOPLEVEL_WM_CAPABILITIES_FULLSCREEN :: 3;
  XDG_TOPLEVEL_WM_CAPABILITIES_MINIMIZE :: 4;
}

xdg_toplevel_listener :: struct {
  configure: #type (data: *void, the_xdg_toplevel: *xdg_toplevel, width: s32, height: s32, states: *wl_array) -> void #c_call;
  close: #type (data: *void, the_xdg_toplevel: *xdg_toplevel) -> void #c_call;
  configure_bounds: #type (data: *void, the_xdg_toplevel: *xdg_toplevel, width: s32, height: s32) -> void #c_call;
  wm_capabilities: #type (data: *void, the_xdg_toplevel: *xdg_toplevel, capabilities: *wl_array) -> void #c_call;
}

xdg_toplevel_add_listener :: (the_xdg_toplevel: *xdg_toplevel, listener: *xdg_toplevel_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_xdg_toplevel, xx listener, data);
}

XDG_TOPLEVEL_DESTROY: u32 : 0;
XDG_TOPLEVEL_SET_PARENT: u32 : 1;
XDG_TOPLEVEL_SET_TITLE: u32 : 2;
XDG_TOPLEVEL_SET_APP_ID: u32 : 3;
XDG_TOPLEVEL_SHOW_WINDOW_MENU: u32 : 4;
XDG_TOPLEVEL_MOVE: u32 : 5;
XDG_TOPLEVEL_RESIZE: u32 : 6;
XDG_TOPLEVEL_SET_MAX_SIZE: u32 : 7;
XDG_TOPLEVEL_SET_MIN_SIZE: u32 : 8;
XDG_TOPLEVEL_SET_MAXIMIZED: u32 : 9;
XDG_TOPLEVEL_UNSET_MAXIMIZED: u32 : 10;
XDG_TOPLEVEL_SET_FULLSCREEN: u32 : 11;
XDG_TOPLEVEL_UNSET_FULLSCREEN: u32 : 12;
XDG_TOPLEVEL_SET_MINIMIZED: u32 : 13;

XDG_TOPLEVEL_CONFIGURE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_CLOSE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_CONFIGURE_BOUNDS_SINCE_VERSION: u32 : 4;
XDG_TOPLEVEL_WM_CAPABILITIES_SINCE_VERSION: u32 : 5;
XDG_TOPLEVEL_DESTROY_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_PARENT_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_TITLE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_APP_ID_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SHOW_WINDOW_MENU_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_MOVE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_RESIZE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_MAX_SIZE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_MIN_SIZE_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_MAXIMIZED_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_UNSET_MAXIMIZED_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_FULLSCREEN_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_UNSET_FULLSCREEN_SINCE_VERSION: u32 : 1;
XDG_TOPLEVEL_SET_MINIMIZED_SINCE_VERSION: u32 : 1;

xdg_toplevel_set_user_data :: (the_xdg_toplevel: *xdg_toplevel, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_xdg_toplevel, user_data);
}

xdg_toplevel_get_user_data :: (the_xdg_toplevel: *xdg_toplevel) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_xdg_toplevel);
}

xdg_toplevel_get_version :: (the_xdg_toplevel: *xdg_toplevel) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel);
}

xdg_toplevel_destroy :: (the_xdg_toplevel: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), WL_MARSHAL_FLAG_DESTROY);
}

xdg_toplevel_set_parent :: (the_xdg_toplevel: *xdg_toplevel, parent: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_PARENT, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, parent);
}

xdg_toplevel_set_title :: (the_xdg_toplevel: *xdg_toplevel, title: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_TITLE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, title);
}

xdg_toplevel_set_app_id :: (the_xdg_toplevel: *xdg_toplevel, app_id: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_APP_ID, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, app_id);
}

xdg_toplevel_show_window_menu :: (the_xdg_toplevel: *xdg_toplevel, seat: *wl_seat, serial: u32, x: s32, y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SHOW_WINDOW_MENU, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, seat, serial, x, y);
}

xdg_toplevel_move :: (the_xdg_toplevel: *xdg_toplevel, seat: *wl_seat, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_MOVE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, seat, serial);
}

xdg_toplevel_resize :: (the_xdg_toplevel: *xdg_toplevel, seat: *wl_seat, serial: u32, edges: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_RESIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, seat, serial, edges);
}

xdg_toplevel_set_max_size :: (the_xdg_toplevel: *xdg_toplevel, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_MAX_SIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, width, height);
}

xdg_toplevel_set_min_size :: (the_xdg_toplevel: *xdg_toplevel, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_MIN_SIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, width, height);
}

xdg_toplevel_set_maximized :: (the_xdg_toplevel: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_MAXIMIZED, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0);
}

xdg_toplevel_unset_maximized :: (the_xdg_toplevel: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_UNSET_MAXIMIZED, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0);
}

xdg_toplevel_set_fullscreen :: (the_xdg_toplevel: *xdg_toplevel, output: *wl_output) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_FULLSCREEN, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0, output);
}

xdg_toplevel_unset_fullscreen :: (the_xdg_toplevel: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_UNSET_FULLSCREEN, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0);
}

xdg_toplevel_set_minimized :: (the_xdg_toplevel: *xdg_toplevel) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_toplevel, XDG_TOPLEVEL_SET_MINIMIZED, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_toplevel), 0);
}

// Interface xdg_popup

xdg_popup_error_e :: enum u32 {
  XDG_POPUP_ERROR_INVALID_GRAB :: 0;
}

xdg_popup_listener :: struct {
  configure: #type (data: *void, the_xdg_popup: *xdg_popup, x: s32, y: s32, width: s32, height: s32) -> void #c_call;
  popup_done: #type (data: *void, the_xdg_popup: *xdg_popup) -> void #c_call;
  repositioned: #type (data: *void, the_xdg_popup: *xdg_popup, token: u32) -> void #c_call;
}

xdg_popup_add_listener :: (the_xdg_popup: *xdg_popup, listener: *xdg_popup_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_xdg_popup, xx listener, data);
}

XDG_POPUP_DESTROY: u32 : 0;
XDG_POPUP_GRAB: u32 : 1;
XDG_POPUP_REPOSITION: u32 : 2;

XDG_POPUP_CONFIGURE_SINCE_VERSION: u32 : 1;
XDG_POPUP_POPUP_DONE_SINCE_VERSION: u32 : 1;
XDG_POPUP_REPOSITIONED_SINCE_VERSION: u32 : 3;
XDG_POPUP_DESTROY_SINCE_VERSION: u32 : 1;
XDG_POPUP_GRAB_SINCE_VERSION: u32 : 1;
XDG_POPUP_REPOSITION_SINCE_VERSION: u32 : 3;

xdg_popup_set_user_data :: (the_xdg_popup: *xdg_popup, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_xdg_popup, user_data);
}

xdg_popup_get_user_data :: (the_xdg_popup: *xdg_popup) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_xdg_popup);
}

xdg_popup_get_version :: (the_xdg_popup: *xdg_popup) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_xdg_popup);
}

xdg_popup_destroy :: (the_xdg_popup: *xdg_popup) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_popup, XDG_POPUP_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_popup), WL_MARSHAL_FLAG_DESTROY);
}

xdg_popup_grab :: (the_xdg_popup: *xdg_popup, seat: *wl_seat, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_popup, XDG_POPUP_GRAB, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_popup), 0, seat, serial);
}

xdg_popup_reposition :: (the_xdg_popup: *xdg_popup, positioner: *xdg_positioner, token: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_xdg_popup, XDG_POPUP_REPOSITION, null, wl_proxy_get_version(cast(*wl_proxy)the_xdg_popup), 0, positioner, token);
}

xdg_shell_types: [26] *wl_interface;
xdg_wm_base_requests := wl_message.[
  {"destroy", "", xdg_shell_types.data + 0},
  {"create_positioner", "n", xdg_shell_types.data + 4},
  {"get_xdg_surface", "no", xdg_shell_types.data + 5},
  {"pong", "u", xdg_shell_types.data + 0},
];

xdg_wm_base_events := wl_message.[
  {"ping", "u", xdg_shell_types.data + 0},
];

xdg_wm_base_interface_instance := wl_interface.{
  "xdg_wm_base", 7,
  4, xdg_wm_base_requests.data,
  1, xdg_wm_base_events.data,
};

xdg_positioner_requests := wl_message.[
  {"destroy", "", xdg_shell_types.data + 0},
  {"set_size", "ii", xdg_shell_types.data + 0},
  {"set_anchor_rect", "iiii", xdg_shell_types.data + 0},
  {"set_anchor", "u", xdg_shell_types.data + 0},
  {"set_gravity", "u", xdg_shell_types.data + 0},
  {"set_constraint_adjustment", "u", xdg_shell_types.data + 0},
  {"set_offset", "ii", xdg_shell_types.data + 0},
  {"set_reactive", "3", xdg_shell_types.data + 0},
  {"set_parent_size", "3ii", xdg_shell_types.data + 0},
  {"set_parent_configure", "3u", xdg_shell_types.data + 0},
];

xdg_positioner_interface_instance := wl_interface.{
  "xdg_positioner", 7,
  10, xdg_positioner_requests.data,
  0, null,
};

xdg_surface_requests := wl_message.[
  {"destroy", "", xdg_shell_types.data + 0},
  {"get_toplevel", "n", xdg_shell_types.data + 7},
  {"get_popup", "n?oo", xdg_shell_types.data + 8},
  {"set_window_geometry", "iiii", xdg_shell_types.data + 0},
  {"ack_configure", "u", xdg_shell_types.data + 0},
];

xdg_surface_events := wl_message.[
  {"configure", "u", xdg_shell_types.data + 0},
];

xdg_surface_interface_instance := wl_interface.{
  "xdg_surface", 7,
  5, xdg_surface_requests.data,
  1, xdg_surface_events.data,
};

xdg_toplevel_requests := wl_message.[
  {"destroy", "", xdg_shell_types.data + 0},
  {"set_parent", "?o", xdg_shell_types.data + 11},
  {"set_title", "s", xdg_shell_types.data + 0},
  {"set_app_id", "s", xdg_shell_types.data + 0},
  {"show_window_menu", "ouii", xdg_shell_types.data + 12},
  {"move", "ou", xdg_shell_types.data + 16},
  {"resize", "ouu", xdg_shell_types.data + 18},
  {"set_max_size", "ii", xdg_shell_types.data + 0},
  {"set_min_size", "ii", xdg_shell_types.data + 0},
  {"set_maximized", "", xdg_shell_types.data + 0},
  {"unset_maximized", "", xdg_shell_types.data + 0},
  {"set_fullscreen", "?o", xdg_shell_types.data + 21},
  {"unset_fullscreen", "", xdg_shell_types.data + 0},
  {"set_minimized", "", xdg_shell_types.data + 0},
];

xdg_toplevel_events := wl_message.[
  {"configure", "iia", xdg_shell_types.data + 0},
  {"close", "", xdg_shell_types.data + 0},
  {"configure_bounds", "4ii", xdg_shell_types.data + 0},
  {"wm_capabilities", "5a", xdg_shell_types.data + 0},
];

xdg_toplevel_interface_instance := wl_interface.{
  "xdg_toplevel", 7,
  14, xdg_toplevel_requests.data,
  4, xdg_toplevel_events.data,
};

xdg_popup_requests := wl_message.[
  {"destroy", "", xdg_shell_types.data + 0},
  {"grab", "ou", xdg_shell_types.data + 22},
  {"reposition", "3ou", xdg_shell_types.data + 24},
];

xdg_popup_events := wl_message.[
  {"configure", "iiii", xdg_shell_types.data + 0},
  {"popup_done", "", xdg_shell_types.data + 0},
  {"repositioned", "3u", xdg_shell_types.data + 0},
];

xdg_popup_interface_instance := wl_interface.{
  "xdg_popup", 7,
  3, xdg_popup_requests.data,
  3, xdg_popup_events.data,
};

// Protocol xdg_decoration_unstable_v1

// Interface zxdg_decoration_manager_v1



ZXDG_DECORATION_MANAGER_V1_DESTROY: u32 : 0;
ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION: u32 : 1;

ZXDG_DECORATION_MANAGER_V1_DESTROY_SINCE_VERSION: u32 : 1;
ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION_SINCE_VERSION: u32 : 1;

zxdg_decoration_manager_v1_set_user_data :: (the_zxdg_decoration_manager_v1: *zxdg_decoration_manager_v1, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_zxdg_decoration_manager_v1, user_data);
}

zxdg_decoration_manager_v1_get_user_data :: (the_zxdg_decoration_manager_v1: *zxdg_decoration_manager_v1) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_zxdg_decoration_manager_v1);
}

zxdg_decoration_manager_v1_get_version :: (the_zxdg_decoration_manager_v1: *zxdg_decoration_manager_v1) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_zxdg_decoration_manager_v1);
}

zxdg_decoration_manager_v1_destroy :: (the_zxdg_decoration_manager_v1: *zxdg_decoration_manager_v1) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_zxdg_decoration_manager_v1, ZXDG_DECORATION_MANAGER_V1_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_zxdg_decoration_manager_v1), WL_MARSHAL_FLAG_DESTROY);
}

zxdg_decoration_manager_v1_get_toplevel_decoration :: (the_zxdg_decoration_manager_v1: *zxdg_decoration_manager_v1, toplevel: *xdg_toplevel) -> *zxdg_toplevel_decoration_v1 #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_zxdg_decoration_manager_v1, ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION, *zxdg_toplevel_decoration_v1_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_zxdg_decoration_manager_v1), 0, null, toplevel);
  return cast(*zxdg_toplevel_decoration_v1)id;
}

// Interface zxdg_toplevel_decoration_v1

zxdg_toplevel_decoration_v1_error_e :: enum u32 {
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_UNCONFIGURED_BUFFER :: 0;
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ALREADY_CONSTRUCTED :: 1;
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ORPHANED :: 2;
  ZXDG_TOPLEVEL_DECORATION_V1_ERROR_INVALID_MODE :: 3;
}

zxdg_toplevel_decoration_v1_mode_e :: enum u32 {
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE :: 1;
  ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE :: 2;
}

zxdg_toplevel_decoration_v1_listener :: struct {
  configure: #type (data: *void, the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1, mode: u32) -> void #c_call;
}

zxdg_toplevel_decoration_v1_add_listener :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1, listener: *zxdg_toplevel_decoration_v1_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1, xx listener, data);
}

ZXDG_TOPLEVEL_DECORATION_V1_DESTROY: u32 : 0;
ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE: u32 : 1;
ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE: u32 : 2;

ZXDG_TOPLEVEL_DECORATION_V1_CONFIGURE_SINCE_VERSION: u32 : 1;
ZXDG_TOPLEVEL_DECORATION_V1_DESTROY_SINCE_VERSION: u32 : 1;
ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE_SINCE_VERSION: u32 : 1;
ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE_SINCE_VERSION: u32 : 1;

zxdg_toplevel_decoration_v1_set_user_data :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1, user_data);
}

zxdg_toplevel_decoration_v1_get_user_data :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1);
}

zxdg_toplevel_decoration_v1_get_version :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1);
}

zxdg_toplevel_decoration_v1_destroy :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1, ZXDG_TOPLEVEL_DECORATION_V1_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1), WL_MARSHAL_FLAG_DESTROY);
}

zxdg_toplevel_decoration_v1_set_mode :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1, mode: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1, ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE, null, wl_proxy_get_version(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1), 0, mode);
}

zxdg_toplevel_decoration_v1_unset_mode :: (the_zxdg_toplevel_decoration_v1: *zxdg_toplevel_decoration_v1) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1, ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE, null, wl_proxy_get_version(cast(*wl_proxy)the_zxdg_toplevel_decoration_v1), 0);
}

xdg_decoration_unstable_v1_types: [3] *wl_interface;
zxdg_decoration_manager_v1_requests := wl_message.[
  {"destroy", "", xdg_decoration_unstable_v1_types.data + 0},
  {"get_toplevel_decoration", "no", xdg_decoration_unstable_v1_types.data + 1},
];

zxdg_decoration_manager_v1_interface_instance := wl_interface.{
  "zxdg_decoration_manager_v1", 1,
  2, zxdg_decoration_manager_v1_requests.data,
  0, null,
};

zxdg_toplevel_decoration_v1_requests := wl_message.[
  {"destroy", "", xdg_decoration_unstable_v1_types.data + 0},
  {"set_mode", "u", xdg_decoration_unstable_v1_types.data + 0},
  {"unset_mode", "", xdg_decoration_unstable_v1_types.data + 0},
];

zxdg_toplevel_decoration_v1_events := wl_message.[
  {"configure", "u", xdg_decoration_unstable_v1_types.data + 0},
];

zxdg_toplevel_decoration_v1_interface_instance := wl_interface.{
  "zxdg_toplevel_decoration_v1", 1,
  3, zxdg_toplevel_decoration_v1_requests.data,
  1, zxdg_toplevel_decoration_v1_events.data,
};

// Protocol wayland

// Interface wl_display

wl_display_error_e :: enum u32 {
  WL_DISPLAY_ERROR_INVALID_OBJECT :: 0;
  WL_DISPLAY_ERROR_INVALID_METHOD :: 1;
  WL_DISPLAY_ERROR_NO_MEMORY :: 2;
  WL_DISPLAY_ERROR_IMPLEMENTATION :: 3;
}

wl_display_listener :: struct {
  error: #type (data: *void, the_wl_display: *wl_display, object_id: *void, code: u32, message: *u8) -> void #c_call;
  delete_id: #type (data: *void, the_wl_display: *wl_display, id: u32) -> void #c_call;
}

wl_display_add_listener :: (the_wl_display: *wl_display, listener: *wl_display_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_display, xx listener, data);
}

WL_DISPLAY_SYNC: u32 : 0;
WL_DISPLAY_GET_REGISTRY: u32 : 1;

WL_DISPLAY_ERROR_SINCE_VERSION: u32 : 1;
WL_DISPLAY_DELETE_ID_SINCE_VERSION: u32 : 1;
WL_DISPLAY_SYNC_SINCE_VERSION: u32 : 1;
WL_DISPLAY_GET_REGISTRY_SINCE_VERSION: u32 : 1;

wl_display_set_user_data :: (the_wl_display: *wl_display, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_display, user_data);
}

wl_display_get_user_data :: (the_wl_display: *wl_display) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_display);
}

wl_display_get_version :: (the_wl_display: *wl_display) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_display);
}

wl_display_sync :: (the_wl_display: *wl_display) -> *wl_callback #c_call {
  callback: *wl_proxy;
  callback = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_display, WL_DISPLAY_SYNC, *wl_callback_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_display), 0, null);
  return cast(*wl_callback)callback;
}

wl_display_get_registry :: (the_wl_display: *wl_display) -> *wl_registry #c_call {
  registry: *wl_proxy;
  registry = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_display, WL_DISPLAY_GET_REGISTRY, *wl_registry_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_display), 0, null);
  return cast(*wl_registry)registry;
}

// Interface wl_registry


wl_registry_listener :: struct {
  global: #type (data: *void, the_wl_registry: *wl_registry, name: u32, the_interface: *u8, version: u32) -> void #c_call;
  global_remove: #type (data: *void, the_wl_registry: *wl_registry, name: u32) -> void #c_call;
}

wl_registry_add_listener :: (the_wl_registry: *wl_registry, listener: *wl_registry_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_registry, xx listener, data);
}

WL_REGISTRY_BIND: u32 : 0;

WL_REGISTRY_GLOBAL_SINCE_VERSION: u32 : 1;
WL_REGISTRY_GLOBAL_REMOVE_SINCE_VERSION: u32 : 1;
WL_REGISTRY_BIND_SINCE_VERSION: u32 : 1;

wl_registry_set_user_data :: (the_wl_registry: *wl_registry, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_registry, user_data);
}

wl_registry_get_user_data :: (the_wl_registry: *wl_registry) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_registry);
}

wl_registry_get_version :: (the_wl_registry: *wl_registry) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_registry);
}

wl_registry_destroy :: (the_wl_registry: *wl_registry) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_registry);
}

wl_registry_bind :: (the_wl_registry: *wl_registry, name: u32, iface: *wl_interface, version: u32) -> *void #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_registry, WL_REGISTRY_BIND, iface, version, 0, name, iface.name, version);
  return cast(*void)id;
}

// Interface wl_callback


wl_callback_listener :: struct {
  done: #type (data: *void, the_wl_callback: *wl_callback, callback_data: u32) -> void #c_call;
}

wl_callback_add_listener :: (the_wl_callback: *wl_callback, listener: *wl_callback_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_callback, xx listener, data);
}


WL_CALLBACK_DONE_SINCE_VERSION: u32 : 1;

wl_callback_set_user_data :: (the_wl_callback: *wl_callback, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_callback, user_data);
}

wl_callback_get_user_data :: (the_wl_callback: *wl_callback) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_callback);
}

wl_callback_get_version :: (the_wl_callback: *wl_callback) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_callback);
}

wl_callback_destroy :: (the_wl_callback: *wl_callback) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_callback);
}


// Interface wl_compositor



WL_COMPOSITOR_CREATE_SURFACE: u32 : 0;
WL_COMPOSITOR_CREATE_REGION: u32 : 1;

WL_COMPOSITOR_CREATE_SURFACE_SINCE_VERSION: u32 : 1;
WL_COMPOSITOR_CREATE_REGION_SINCE_VERSION: u32 : 1;

wl_compositor_set_user_data :: (the_wl_compositor: *wl_compositor, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_compositor, user_data);
}

wl_compositor_get_user_data :: (the_wl_compositor: *wl_compositor) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_compositor);
}

wl_compositor_get_version :: (the_wl_compositor: *wl_compositor) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_compositor);
}

wl_compositor_destroy :: (the_wl_compositor: *wl_compositor) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_compositor);
}

wl_compositor_create_surface :: (the_wl_compositor: *wl_compositor) -> *wl_surface #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_compositor, WL_COMPOSITOR_CREATE_SURFACE, *wl_surface_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_compositor), 0, null);
  return cast(*wl_surface)id;
}

wl_compositor_create_region :: (the_wl_compositor: *wl_compositor) -> *wl_region #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_compositor, WL_COMPOSITOR_CREATE_REGION, *wl_region_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_compositor), 0, null);
  return cast(*wl_region)id;
}

// Interface wl_shm_pool



WL_SHM_POOL_CREATE_BUFFER: u32 : 0;
WL_SHM_POOL_DESTROY: u32 : 1;
WL_SHM_POOL_RESIZE: u32 : 2;

WL_SHM_POOL_CREATE_BUFFER_SINCE_VERSION: u32 : 1;
WL_SHM_POOL_DESTROY_SINCE_VERSION: u32 : 1;
WL_SHM_POOL_RESIZE_SINCE_VERSION: u32 : 1;

wl_shm_pool_set_user_data :: (the_wl_shm_pool: *wl_shm_pool, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_shm_pool, user_data);
}

wl_shm_pool_get_user_data :: (the_wl_shm_pool: *wl_shm_pool) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_shm_pool);
}

wl_shm_pool_get_version :: (the_wl_shm_pool: *wl_shm_pool) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool);
}

wl_shm_pool_create_buffer :: (the_wl_shm_pool: *wl_shm_pool, offset: s32, width: s32, height: s32, stride: s32, format: u32) -> *wl_buffer #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shm_pool, WL_SHM_POOL_CREATE_BUFFER, *wl_buffer_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool), 0, null, offset, width, height, stride, format);
  return cast(*wl_buffer)id;
}

wl_shm_pool_destroy :: (the_wl_shm_pool: *wl_shm_pool) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shm_pool, WL_SHM_POOL_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool), WL_MARSHAL_FLAG_DESTROY);
}

wl_shm_pool_resize :: (the_wl_shm_pool: *wl_shm_pool, size: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shm_pool, WL_SHM_POOL_RESIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shm_pool), 0, size);
}

// Interface wl_shm

wl_shm_error_e :: enum u32 {
  WL_SHM_ERROR_INVALID_FORMAT :: 0;
  WL_SHM_ERROR_INVALID_STRIDE :: 1;
  WL_SHM_ERROR_INVALID_FD :: 2;
}

wl_shm_format_e :: enum u32 {
  WL_SHM_FORMAT_ARGB8888 :: 0;
  WL_SHM_FORMAT_XRGB8888 :: 1;
  WL_SHM_FORMAT_C8 :: 538982467;
  WL_SHM_FORMAT_RGB332 :: 943867730;
  WL_SHM_FORMAT_BGR233 :: 944916290;
  WL_SHM_FORMAT_XRGB4444 :: 842093144;
  WL_SHM_FORMAT_XBGR4444 :: 842089048;
  WL_SHM_FORMAT_RGBX4444 :: 842094674;
  WL_SHM_FORMAT_BGRX4444 :: 842094658;
  WL_SHM_FORMAT_ARGB4444 :: 842093121;
  WL_SHM_FORMAT_ABGR4444 :: 842089025;
  WL_SHM_FORMAT_RGBA4444 :: 842088786;
  WL_SHM_FORMAT_BGRA4444 :: 842088770;
  WL_SHM_FORMAT_XRGB1555 :: 892424792;
  WL_SHM_FORMAT_XBGR1555 :: 892420696;
  WL_SHM_FORMAT_RGBX5551 :: 892426322;
  WL_SHM_FORMAT_BGRX5551 :: 892426306;
  WL_SHM_FORMAT_ARGB1555 :: 892424769;
  WL_SHM_FORMAT_ABGR1555 :: 892420673;
  WL_SHM_FORMAT_RGBA5551 :: 892420434;
  WL_SHM_FORMAT_BGRA5551 :: 892420418;
  WL_SHM_FORMAT_RGB565 :: 909199186;
  WL_SHM_FORMAT_BGR565 :: 909199170;
  WL_SHM_FORMAT_RGB888 :: 875710290;
  WL_SHM_FORMAT_BGR888 :: 875710274;
  WL_SHM_FORMAT_XBGR8888 :: 875709016;
  WL_SHM_FORMAT_RGBX8888 :: 875714642;
  WL_SHM_FORMAT_BGRX8888 :: 875714626;
  WL_SHM_FORMAT_ABGR8888 :: 875708993;
  WL_SHM_FORMAT_RGBA8888 :: 875708754;
  WL_SHM_FORMAT_BGRA8888 :: 875708738;
  WL_SHM_FORMAT_XRGB2101010 :: 808669784;
  WL_SHM_FORMAT_XBGR2101010 :: 808665688;
  WL_SHM_FORMAT_RGBX1010102 :: 808671314;
  WL_SHM_FORMAT_BGRX1010102 :: 808671298;
  WL_SHM_FORMAT_ARGB2101010 :: 808669761;
  WL_SHM_FORMAT_ABGR2101010 :: 808665665;
  WL_SHM_FORMAT_RGBA1010102 :: 808665426;
  WL_SHM_FORMAT_BGRA1010102 :: 808665410;
  WL_SHM_FORMAT_YUYV :: 1448695129;
  WL_SHM_FORMAT_YVYU :: 1431918169;
  WL_SHM_FORMAT_UYVY :: 1498831189;
  WL_SHM_FORMAT_VYUY :: 1498765654;
  WL_SHM_FORMAT_AYUV :: 1448433985;
  WL_SHM_FORMAT_NV12 :: 842094158;
  WL_SHM_FORMAT_NV21 :: 825382478;
  WL_SHM_FORMAT_NV16 :: 909203022;
  WL_SHM_FORMAT_NV61 :: 825644622;
  WL_SHM_FORMAT_YUV410 :: 961959257;
  WL_SHM_FORMAT_YVU410 :: 961893977;
  WL_SHM_FORMAT_YUV411 :: 825316697;
  WL_SHM_FORMAT_YVU411 :: 825316953;
  WL_SHM_FORMAT_YUV420 :: 842093913;
  WL_SHM_FORMAT_YVU420 :: 842094169;
  WL_SHM_FORMAT_YUV422 :: 909202777;
  WL_SHM_FORMAT_YVU422 :: 909203033;
  WL_SHM_FORMAT_YUV444 :: 875713881;
  WL_SHM_FORMAT_YVU444 :: 875714137;
  WL_SHM_FORMAT_R8 :: 538982482;
  WL_SHM_FORMAT_R16 :: 540422482;
  WL_SHM_FORMAT_RG88 :: 943212370;
  WL_SHM_FORMAT_GR88 :: 943215175;
  WL_SHM_FORMAT_RG1616 :: 842221394;
  WL_SHM_FORMAT_GR1616 :: 842224199;
  WL_SHM_FORMAT_XRGB16161616F :: 1211388504;
  WL_SHM_FORMAT_XBGR16161616F :: 1211384408;
  WL_SHM_FORMAT_ARGB16161616F :: 1211388481;
  WL_SHM_FORMAT_ABGR16161616F :: 1211384385;
  WL_SHM_FORMAT_XYUV8888 :: 1448434008;
  WL_SHM_FORMAT_VUY888 :: 875713878;
  WL_SHM_FORMAT_VUY101010 :: 808670550;
  WL_SHM_FORMAT_Y210 :: 808530521;
  WL_SHM_FORMAT_Y212 :: 842084953;
  WL_SHM_FORMAT_Y216 :: 909193817;
  WL_SHM_FORMAT_Y410 :: 808531033;
  WL_SHM_FORMAT_Y412 :: 842085465;
  WL_SHM_FORMAT_Y416 :: 909194329;
  WL_SHM_FORMAT_XVYU2101010 :: 808670808;
  WL_SHM_FORMAT_XVYU12_16161616 :: 909334104;
  WL_SHM_FORMAT_XVYU16161616 :: 942954072;
  WL_SHM_FORMAT_Y0L0 :: 810299481;
  WL_SHM_FORMAT_X0L0 :: 810299480;
  WL_SHM_FORMAT_Y0L2 :: 843853913;
  WL_SHM_FORMAT_X0L2 :: 843853912;
  WL_SHM_FORMAT_YUV420_8BIT :: 942691673;
  WL_SHM_FORMAT_YUV420_10BIT :: 808539481;
  WL_SHM_FORMAT_XRGB8888_A8 :: 943805016;
  WL_SHM_FORMAT_XBGR8888_A8 :: 943800920;
  WL_SHM_FORMAT_RGBX8888_A8 :: 943806546;
  WL_SHM_FORMAT_BGRX8888_A8 :: 943806530;
  WL_SHM_FORMAT_RGB888_A8 :: 943798354;
  WL_SHM_FORMAT_BGR888_A8 :: 943798338;
  WL_SHM_FORMAT_RGB565_A8 :: 943797586;
  WL_SHM_FORMAT_BGR565_A8 :: 943797570;
  WL_SHM_FORMAT_NV24 :: 875714126;
  WL_SHM_FORMAT_NV42 :: 842290766;
  WL_SHM_FORMAT_P210 :: 808530512;
  WL_SHM_FORMAT_P010 :: 808530000;
  WL_SHM_FORMAT_P012 :: 842084432;
  WL_SHM_FORMAT_P016 :: 909193296;
  WL_SHM_FORMAT_AXBXGXRX106106106106 :: 808534593;
  WL_SHM_FORMAT_NV15 :: 892425806;
  WL_SHM_FORMAT_Q410 :: 808531025;
  WL_SHM_FORMAT_Q401 :: 825242705;
  WL_SHM_FORMAT_XRGB16161616 :: 942953048;
  WL_SHM_FORMAT_XBGR16161616 :: 942948952;
  WL_SHM_FORMAT_ARGB16161616 :: 942953025;
  WL_SHM_FORMAT_ABGR16161616 :: 942948929;
}

wl_shm_listener :: struct {
  format: #type (data: *void, the_wl_shm: *wl_shm, format: u32) -> void #c_call;
}

wl_shm_add_listener :: (the_wl_shm: *wl_shm, listener: *wl_shm_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_shm, xx listener, data);
}

WL_SHM_CREATE_POOL: u32 : 0;

WL_SHM_FORMAT_SINCE_VERSION: u32 : 1;
WL_SHM_CREATE_POOL_SINCE_VERSION: u32 : 1;

wl_shm_set_user_data :: (the_wl_shm: *wl_shm, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_shm, user_data);
}

wl_shm_get_user_data :: (the_wl_shm: *wl_shm) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_shm);
}

wl_shm_get_version :: (the_wl_shm: *wl_shm) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_shm);
}

wl_shm_destroy :: (the_wl_shm: *wl_shm) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_shm);
}

wl_shm_create_pool :: (the_wl_shm: *wl_shm, fd: s32, size: s32) -> *wl_shm_pool #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shm, WL_SHM_CREATE_POOL, *wl_shm_pool_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_shm), 0, null, fd, size);
  return cast(*wl_shm_pool)id;
}

// Interface wl_buffer


wl_buffer_listener :: struct {
  release: #type (data: *void, the_wl_buffer: *wl_buffer) -> void #c_call;
}

wl_buffer_add_listener :: (the_wl_buffer: *wl_buffer, listener: *wl_buffer_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_buffer, xx listener, data);
}

WL_BUFFER_DESTROY: u32 : 0;

WL_BUFFER_RELEASE_SINCE_VERSION: u32 : 1;
WL_BUFFER_DESTROY_SINCE_VERSION: u32 : 1;

wl_buffer_set_user_data :: (the_wl_buffer: *wl_buffer, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_buffer, user_data);
}

wl_buffer_get_user_data :: (the_wl_buffer: *wl_buffer) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_buffer);
}

wl_buffer_get_version :: (the_wl_buffer: *wl_buffer) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_buffer);
}

wl_buffer_destroy :: (the_wl_buffer: *wl_buffer) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_buffer, WL_BUFFER_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_buffer), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_data_offer

wl_data_offer_error_e :: enum u32 {
  WL_DATA_OFFER_ERROR_INVALID_FINISH :: 0;
  WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK :: 1;
  WL_DATA_OFFER_ERROR_INVALID_ACTION :: 2;
  WL_DATA_OFFER_ERROR_INVALID_OFFER :: 3;
}

wl_data_offer_listener :: struct {
  offer: #type (data: *void, the_wl_data_offer: *wl_data_offer, mime_type: *u8) -> void #c_call;
  source_actions: #type (data: *void, the_wl_data_offer: *wl_data_offer, source_actions: u32) -> void #c_call;
  action: #type (data: *void, the_wl_data_offer: *wl_data_offer, dnd_action: u32) -> void #c_call;
}

wl_data_offer_add_listener :: (the_wl_data_offer: *wl_data_offer, listener: *wl_data_offer_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_data_offer, xx listener, data);
}

WL_DATA_OFFER_ACCEPT: u32 : 0;
WL_DATA_OFFER_RECEIVE: u32 : 1;
WL_DATA_OFFER_DESTROY: u32 : 2;
WL_DATA_OFFER_FINISH: u32 : 3;
WL_DATA_OFFER_SET_ACTIONS: u32 : 4;

WL_DATA_OFFER_OFFER_SINCE_VERSION: u32 : 1;
WL_DATA_OFFER_SOURCE_ACTIONS_SINCE_VERSION: u32 : 3;
WL_DATA_OFFER_ACTION_SINCE_VERSION: u32 : 3;
WL_DATA_OFFER_ACCEPT_SINCE_VERSION: u32 : 1;
WL_DATA_OFFER_RECEIVE_SINCE_VERSION: u32 : 1;
WL_DATA_OFFER_DESTROY_SINCE_VERSION: u32 : 1;
WL_DATA_OFFER_FINISH_SINCE_VERSION: u32 : 3;
WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION: u32 : 3;

wl_data_offer_set_user_data :: (the_wl_data_offer: *wl_data_offer, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_data_offer, user_data);
}

wl_data_offer_get_user_data :: (the_wl_data_offer: *wl_data_offer) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_data_offer);
}

wl_data_offer_get_version :: (the_wl_data_offer: *wl_data_offer) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer);
}

wl_data_offer_accept :: (the_wl_data_offer: *wl_data_offer, serial: u32, mime_type: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_offer, WL_DATA_OFFER_ACCEPT, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer), 0, serial, mime_type);
}

wl_data_offer_receive :: (the_wl_data_offer: *wl_data_offer, mime_type: *u8, fd: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_offer, WL_DATA_OFFER_RECEIVE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer), 0, mime_type, fd);
}

wl_data_offer_destroy :: (the_wl_data_offer: *wl_data_offer) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_offer, WL_DATA_OFFER_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer), WL_MARSHAL_FLAG_DESTROY);
}

wl_data_offer_finish :: (the_wl_data_offer: *wl_data_offer) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_offer, WL_DATA_OFFER_FINISH, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer), 0);
}

wl_data_offer_set_actions :: (the_wl_data_offer: *wl_data_offer, dnd_actions: u32, preferred_action: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_offer, WL_DATA_OFFER_SET_ACTIONS, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_offer), 0, dnd_actions, preferred_action);
}

// Interface wl_data_source

wl_data_source_error_e :: enum u32 {
  WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK :: 0;
  WL_DATA_SOURCE_ERROR_INVALID_SOURCE :: 1;
}

wl_data_source_listener :: struct {
  target: #type (data: *void, the_wl_data_source: *wl_data_source, mime_type: *u8) -> void #c_call;
  send: #type (data: *void, the_wl_data_source: *wl_data_source, mime_type: *u8, fd: s32) -> void #c_call;
  cancelled: #type (data: *void, the_wl_data_source: *wl_data_source) -> void #c_call;
  dnd_drop_performed: #type (data: *void, the_wl_data_source: *wl_data_source) -> void #c_call;
  dnd_finished: #type (data: *void, the_wl_data_source: *wl_data_source) -> void #c_call;
  action: #type (data: *void, the_wl_data_source: *wl_data_source, dnd_action: u32) -> void #c_call;
}

wl_data_source_add_listener :: (the_wl_data_source: *wl_data_source, listener: *wl_data_source_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_data_source, xx listener, data);
}

WL_DATA_SOURCE_OFFER: u32 : 0;
WL_DATA_SOURCE_DESTROY: u32 : 1;
WL_DATA_SOURCE_SET_ACTIONS: u32 : 2;

WL_DATA_SOURCE_TARGET_SINCE_VERSION: u32 : 1;
WL_DATA_SOURCE_SEND_SINCE_VERSION: u32 : 1;
WL_DATA_SOURCE_CANCELLED_SINCE_VERSION: u32 : 1;
WL_DATA_SOURCE_DND_DROP_PERFORMED_SINCE_VERSION: u32 : 3;
WL_DATA_SOURCE_DND_FINISHED_SINCE_VERSION: u32 : 3;
WL_DATA_SOURCE_ACTION_SINCE_VERSION: u32 : 3;
WL_DATA_SOURCE_OFFER_SINCE_VERSION: u32 : 1;
WL_DATA_SOURCE_DESTROY_SINCE_VERSION: u32 : 1;
WL_DATA_SOURCE_SET_ACTIONS_SINCE_VERSION: u32 : 3;

wl_data_source_set_user_data :: (the_wl_data_source: *wl_data_source, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_data_source, user_data);
}

wl_data_source_get_user_data :: (the_wl_data_source: *wl_data_source) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_data_source);
}

wl_data_source_get_version :: (the_wl_data_source: *wl_data_source) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_data_source);
}

wl_data_source_offer :: (the_wl_data_source: *wl_data_source, mime_type: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_source, WL_DATA_SOURCE_OFFER, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_source), 0, mime_type);
}

wl_data_source_destroy :: (the_wl_data_source: *wl_data_source) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_source, WL_DATA_SOURCE_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_source), WL_MARSHAL_FLAG_DESTROY);
}

wl_data_source_set_actions :: (the_wl_data_source: *wl_data_source, dnd_actions: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_source, WL_DATA_SOURCE_SET_ACTIONS, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_source), 0, dnd_actions);
}

// Interface wl_data_device

wl_data_device_error_e :: enum u32 {
  WL_DATA_DEVICE_ERROR_ROLE :: 0;
}

wl_data_device_listener :: struct {
  data_offer: #type (data: *void, the_wl_data_device: *wl_data_device, id: *wl_data_offer) -> void #c_call;
  enter: #type (data: *void, the_wl_data_device: *wl_data_device, serial: u32, surface: *wl_surface, x: wl_fixed_t, y: wl_fixed_t, id: *wl_data_offer) -> void #c_call;
  leave: #type (data: *void, the_wl_data_device: *wl_data_device) -> void #c_call;
  motion: #type (data: *void, the_wl_data_device: *wl_data_device, time: u32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;
  drop: #type (data: *void, the_wl_data_device: *wl_data_device) -> void #c_call;
  selection: #type (data: *void, the_wl_data_device: *wl_data_device, id: *wl_data_offer) -> void #c_call;
}

wl_data_device_add_listener :: (the_wl_data_device: *wl_data_device, listener: *wl_data_device_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_data_device, xx listener, data);
}

WL_DATA_DEVICE_START_DRAG: u32 : 0;
WL_DATA_DEVICE_SET_SELECTION: u32 : 1;
WL_DATA_DEVICE_RELEASE: u32 : 2;

WL_DATA_DEVICE_DATA_OFFER_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_ENTER_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_LEAVE_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_MOTION_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_DROP_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_SELECTION_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_START_DRAG_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_SET_SELECTION_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_RELEASE_SINCE_VERSION: u32 : 2;

wl_data_device_set_user_data :: (the_wl_data_device: *wl_data_device, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_data_device, user_data);
}

wl_data_device_get_user_data :: (the_wl_data_device: *wl_data_device) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_data_device);
}

wl_data_device_get_version :: (the_wl_data_device: *wl_data_device) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device);
}

wl_data_device_destroy :: (the_wl_data_device: *wl_data_device) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_data_device);
}

wl_data_device_start_drag :: (the_wl_data_device: *wl_data_device, source: *wl_data_source, origin: *wl_surface, icon: *wl_surface, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_device, WL_DATA_DEVICE_START_DRAG, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device), 0, source, origin, icon, serial);
}

wl_data_device_set_selection :: (the_wl_data_device: *wl_data_device, source: *wl_data_source, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_device, WL_DATA_DEVICE_SET_SELECTION, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device), 0, source, serial);
}

wl_data_device_release :: (the_wl_data_device: *wl_data_device) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_device, WL_DATA_DEVICE_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_data_device_manager

wl_data_device_manager_dnd_action_e :: enum u32 {
  WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE :: 0;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY :: 1;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_MOVE :: 2;
  WL_DATA_DEVICE_MANAGER_DND_ACTION_ASK :: 4;
}


WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE: u32 : 0;
WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE: u32 : 1;

WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE_SINCE_VERSION: u32 : 1;
WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE_SINCE_VERSION: u32 : 1;

wl_data_device_manager_set_user_data :: (the_wl_data_device_manager: *wl_data_device_manager, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_data_device_manager, user_data);
}

wl_data_device_manager_get_user_data :: (the_wl_data_device_manager: *wl_data_device_manager) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_data_device_manager);
}

wl_data_device_manager_get_version :: (the_wl_data_device_manager: *wl_data_device_manager) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device_manager);
}

wl_data_device_manager_destroy :: (the_wl_data_device_manager: *wl_data_device_manager) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_data_device_manager);
}

wl_data_device_manager_create_data_source :: (the_wl_data_device_manager: *wl_data_device_manager) -> *wl_data_source #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_device_manager, WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE, *wl_data_source_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device_manager), 0, null);
  return cast(*wl_data_source)id;
}

wl_data_device_manager_get_data_device :: (the_wl_data_device_manager: *wl_data_device_manager, seat: *wl_seat) -> *wl_data_device #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_data_device_manager, WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE, *wl_data_device_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_data_device_manager), 0, null, seat);
  return cast(*wl_data_device)id;
}

// Interface wl_shell

wl_shell_error_e :: enum u32 {
  WL_SHELL_ERROR_ROLE :: 0;
}


WL_SHELL_GET_SHELL_SURFACE: u32 : 0;

WL_SHELL_GET_SHELL_SURFACE_SINCE_VERSION: u32 : 1;

wl_shell_set_user_data :: (the_wl_shell: *wl_shell, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_shell, user_data);
}

wl_shell_get_user_data :: (the_wl_shell: *wl_shell) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_shell);
}

wl_shell_get_version :: (the_wl_shell: *wl_shell) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_shell);
}

wl_shell_destroy :: (the_wl_shell: *wl_shell) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_shell);
}

wl_shell_get_shell_surface :: (the_wl_shell: *wl_shell, surface: *wl_surface) -> *wl_shell_surface #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell, WL_SHELL_GET_SHELL_SURFACE, *wl_shell_surface_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell), 0, null, surface);
  return cast(*wl_shell_surface)id;
}

// Interface wl_shell_surface

wl_shell_surface_resize_e :: enum u32 {
  WL_SHELL_SURFACE_RESIZE_NONE :: 0;
  WL_SHELL_SURFACE_RESIZE_TOP :: 1;
  WL_SHELL_SURFACE_RESIZE_BOTTOM :: 2;
  WL_SHELL_SURFACE_RESIZE_LEFT :: 4;
  WL_SHELL_SURFACE_RESIZE_TOP_LEFT :: 5;
  WL_SHELL_SURFACE_RESIZE_BOTTOM_LEFT :: 6;
  WL_SHELL_SURFACE_RESIZE_RIGHT :: 8;
  WL_SHELL_SURFACE_RESIZE_TOP_RIGHT :: 9;
  WL_SHELL_SURFACE_RESIZE_BOTTOM_RIGHT :: 10;
}

wl_shell_surface_transient_e :: enum u32 {
  WL_SHELL_SURFACE_TRANSIENT_INACTIVE :: 1;
}

wl_shell_surface_fullscreen_method_e :: enum u32 {
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DEFAULT :: 0;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_SCALE :: 1;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_DRIVER :: 2;
  WL_SHELL_SURFACE_FULLSCREEN_METHOD_FILL :: 3;
}

wl_shell_surface_listener :: struct {
  ping: #type (data: *void, the_wl_shell_surface: *wl_shell_surface, serial: u32) -> void #c_call;
  configure: #type (data: *void, the_wl_shell_surface: *wl_shell_surface, edges: u32, width: s32, height: s32) -> void #c_call;
  popup_done: #type (data: *void, the_wl_shell_surface: *wl_shell_surface) -> void #c_call;
}

wl_shell_surface_add_listener :: (the_wl_shell_surface: *wl_shell_surface, listener: *wl_shell_surface_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_shell_surface, xx listener, data);
}

WL_SHELL_SURFACE_PONG: u32 : 0;
WL_SHELL_SURFACE_MOVE: u32 : 1;
WL_SHELL_SURFACE_RESIZE: u32 : 2;
WL_SHELL_SURFACE_SET_TOPLEVEL: u32 : 3;
WL_SHELL_SURFACE_SET_TRANSIENT: u32 : 4;
WL_SHELL_SURFACE_SET_FULLSCREEN: u32 : 5;
WL_SHELL_SURFACE_SET_POPUP: u32 : 6;
WL_SHELL_SURFACE_SET_MAXIMIZED: u32 : 7;
WL_SHELL_SURFACE_SET_TITLE: u32 : 8;
WL_SHELL_SURFACE_SET_CLASS: u32 : 9;

WL_SHELL_SURFACE_PING_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_CONFIGURE_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_POPUP_DONE_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_PONG_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_MOVE_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_RESIZE_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_TOPLEVEL_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_TRANSIENT_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_FULLSCREEN_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_POPUP_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_MAXIMIZED_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_TITLE_SINCE_VERSION: u32 : 1;
WL_SHELL_SURFACE_SET_CLASS_SINCE_VERSION: u32 : 1;

wl_shell_surface_set_user_data :: (the_wl_shell_surface: *wl_shell_surface, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_shell_surface, user_data);
}

wl_shell_surface_get_user_data :: (the_wl_shell_surface: *wl_shell_surface) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_shell_surface);
}

wl_shell_surface_get_version :: (the_wl_shell_surface: *wl_shell_surface) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface);
}

wl_shell_surface_destroy :: (the_wl_shell_surface: *wl_shell_surface) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_shell_surface);
}

wl_shell_surface_pong :: (the_wl_shell_surface: *wl_shell_surface, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_PONG, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, serial);
}

wl_shell_surface_move :: (the_wl_shell_surface: *wl_shell_surface, seat: *wl_seat, serial: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_MOVE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, seat, serial);
}

wl_shell_surface_resize :: (the_wl_shell_surface: *wl_shell_surface, seat: *wl_seat, serial: u32, edges: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_RESIZE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, seat, serial, edges);
}

wl_shell_surface_set_toplevel :: (the_wl_shell_surface: *wl_shell_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_TOPLEVEL, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0);
}

wl_shell_surface_set_transient :: (the_wl_shell_surface: *wl_shell_surface, parent: *wl_surface, x: s32, y: s32, flags: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_TRANSIENT, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, parent, x, y, flags);
}

wl_shell_surface_set_fullscreen :: (the_wl_shell_surface: *wl_shell_surface, method: u32, framerate: u32, output: *wl_output) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_FULLSCREEN, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, method, framerate, output);
}

wl_shell_surface_set_popup :: (the_wl_shell_surface: *wl_shell_surface, seat: *wl_seat, serial: u32, parent: *wl_surface, x: s32, y: s32, flags: u32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_POPUP, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, seat, serial, parent, x, y, flags);
}

wl_shell_surface_set_maximized :: (the_wl_shell_surface: *wl_shell_surface, output: *wl_output) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_MAXIMIZED, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, output);
}

wl_shell_surface_set_title :: (the_wl_shell_surface: *wl_shell_surface, title: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_TITLE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, title);
}

wl_shell_surface_set_class :: (the_wl_shell_surface: *wl_shell_surface, class_: *u8) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_shell_surface, WL_SHELL_SURFACE_SET_CLASS, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_shell_surface), 0, class_);
}

// Interface wl_surface

wl_surface_error_e :: enum u32 {
  WL_SURFACE_ERROR_INVALID_SCALE :: 0;
  WL_SURFACE_ERROR_INVALID_TRANSFORM :: 1;
  WL_SURFACE_ERROR_INVALID_SIZE :: 2;
  WL_SURFACE_ERROR_INVALID_OFFSET :: 3;
  WL_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT :: 4;
}

wl_surface_listener :: struct {
  enter: #type (data: *void, the_wl_surface: *wl_surface, output: *wl_output) -> void #c_call;
  leave: #type (data: *void, the_wl_surface: *wl_surface, output: *wl_output) -> void #c_call;
  preferred_buffer_scale: #type (data: *void, the_wl_surface: *wl_surface, factor: s32) -> void #c_call;
  preferred_buffer_transform: #type (data: *void, the_wl_surface: *wl_surface, transform: u32) -> void #c_call;
}

wl_surface_add_listener :: (the_wl_surface: *wl_surface, listener: *wl_surface_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_surface, xx listener, data);
}

WL_SURFACE_DESTROY: u32 : 0;
WL_SURFACE_ATTACH: u32 : 1;
WL_SURFACE_DAMAGE: u32 : 2;
WL_SURFACE_FRAME: u32 : 3;
WL_SURFACE_SET_OPAQUE_REGION: u32 : 4;
WL_SURFACE_SET_INPUT_REGION: u32 : 5;
WL_SURFACE_COMMIT: u32 : 6;
WL_SURFACE_SET_BUFFER_TRANSFORM: u32 : 7;
WL_SURFACE_SET_BUFFER_SCALE: u32 : 8;
WL_SURFACE_DAMAGE_BUFFER: u32 : 9;
WL_SURFACE_OFFSET: u32 : 10;

WL_SURFACE_ENTER_SINCE_VERSION: u32 : 1;
WL_SURFACE_LEAVE_SINCE_VERSION: u32 : 1;
WL_SURFACE_PREFERRED_BUFFER_SCALE_SINCE_VERSION: u32 : 6;
WL_SURFACE_PREFERRED_BUFFER_TRANSFORM_SINCE_VERSION: u32 : 6;
WL_SURFACE_DESTROY_SINCE_VERSION: u32 : 1;
WL_SURFACE_ATTACH_SINCE_VERSION: u32 : 1;
WL_SURFACE_DAMAGE_SINCE_VERSION: u32 : 1;
WL_SURFACE_FRAME_SINCE_VERSION: u32 : 1;
WL_SURFACE_SET_OPAQUE_REGION_SINCE_VERSION: u32 : 1;
WL_SURFACE_SET_INPUT_REGION_SINCE_VERSION: u32 : 1;
WL_SURFACE_COMMIT_SINCE_VERSION: u32 : 1;
WL_SURFACE_SET_BUFFER_TRANSFORM_SINCE_VERSION: u32 : 2;
WL_SURFACE_SET_BUFFER_SCALE_SINCE_VERSION: u32 : 3;
WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION: u32 : 4;
WL_SURFACE_OFFSET_SINCE_VERSION: u32 : 5;

wl_surface_set_user_data :: (the_wl_surface: *wl_surface, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_surface, user_data);
}

wl_surface_get_user_data :: (the_wl_surface: *wl_surface) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_surface);
}

wl_surface_get_version :: (the_wl_surface: *wl_surface) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_surface);
}

wl_surface_destroy :: (the_wl_surface: *wl_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), WL_MARSHAL_FLAG_DESTROY);
}

wl_surface_attach :: (the_wl_surface: *wl_surface, buffer: *wl_buffer, x: s32, y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_ATTACH, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, buffer, x, y);
}

wl_surface_damage :: (the_wl_surface: *wl_surface, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_DAMAGE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, x, y, width, height);
}

wl_surface_frame :: (the_wl_surface: *wl_surface) -> *wl_callback #c_call {
  callback: *wl_proxy;
  callback = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_FRAME, *wl_callback_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, null);
  return cast(*wl_callback)callback;
}

wl_surface_set_opaque_region :: (the_wl_surface: *wl_surface, region: *wl_region) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_SET_OPAQUE_REGION, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, region);
}

wl_surface_set_input_region :: (the_wl_surface: *wl_surface, region: *wl_region) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_SET_INPUT_REGION, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, region);
}

wl_surface_commit :: (the_wl_surface: *wl_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_COMMIT, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0);
}

wl_surface_set_buffer_transform :: (the_wl_surface: *wl_surface, transform: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_SET_BUFFER_TRANSFORM, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, transform);
}

wl_surface_set_buffer_scale :: (the_wl_surface: *wl_surface, scale: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_SET_BUFFER_SCALE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, scale);
}

wl_surface_damage_buffer :: (the_wl_surface: *wl_surface, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_DAMAGE_BUFFER, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, x, y, width, height);
}

wl_surface_offset :: (the_wl_surface: *wl_surface, x: s32, y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_surface, WL_SURFACE_OFFSET, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_surface), 0, x, y);
}

// Interface wl_seat

wl_seat_capability_e :: enum u32 {
  WL_SEAT_CAPABILITY_POINTER :: 1;
  WL_SEAT_CAPABILITY_KEYBOARD :: 2;
  WL_SEAT_CAPABILITY_TOUCH :: 4;
}

wl_seat_error_e :: enum u32 {
  WL_SEAT_ERROR_MISSING_CAPABILITY :: 0;
}

wl_seat_listener :: struct {
  capabilities: #type (data: *void, the_wl_seat: *wl_seat, capabilities: u32) -> void #c_call;
  name: #type (data: *void, the_wl_seat: *wl_seat, name: *u8) -> void #c_call;
}

wl_seat_add_listener :: (the_wl_seat: *wl_seat, listener: *wl_seat_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_seat, xx listener, data);
}

WL_SEAT_GET_POINTER: u32 : 0;
WL_SEAT_GET_KEYBOARD: u32 : 1;
WL_SEAT_GET_TOUCH: u32 : 2;
WL_SEAT_RELEASE: u32 : 3;

WL_SEAT_CAPABILITIES_SINCE_VERSION: u32 : 1;
WL_SEAT_NAME_SINCE_VERSION: u32 : 2;
WL_SEAT_GET_POINTER_SINCE_VERSION: u32 : 1;
WL_SEAT_GET_KEYBOARD_SINCE_VERSION: u32 : 1;
WL_SEAT_GET_TOUCH_SINCE_VERSION: u32 : 1;
WL_SEAT_RELEASE_SINCE_VERSION: u32 : 5;

wl_seat_set_user_data :: (the_wl_seat: *wl_seat, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_seat, user_data);
}

wl_seat_get_user_data :: (the_wl_seat: *wl_seat) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_seat);
}

wl_seat_get_version :: (the_wl_seat: *wl_seat) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_seat);
}

wl_seat_destroy :: (the_wl_seat: *wl_seat) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_seat);
}

wl_seat_get_pointer :: (the_wl_seat: *wl_seat) -> *wl_pointer #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_seat, WL_SEAT_GET_POINTER, *wl_pointer_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_seat), 0, null);
  return cast(*wl_pointer)id;
}

wl_seat_get_keyboard :: (the_wl_seat: *wl_seat) -> *wl_keyboard #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_seat, WL_SEAT_GET_KEYBOARD, *wl_keyboard_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_seat), 0, null);
  return cast(*wl_keyboard)id;
}

wl_seat_get_touch :: (the_wl_seat: *wl_seat) -> *wl_touch #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_seat, WL_SEAT_GET_TOUCH, *wl_touch_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_seat), 0, null);
  return cast(*wl_touch)id;
}

wl_seat_release :: (the_wl_seat: *wl_seat) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_seat, WL_SEAT_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_seat), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_pointer

wl_pointer_error_e :: enum u32 {
  WL_POINTER_ERROR_ROLE :: 0;
}

wl_pointer_button_state_e :: enum u32 {
  WL_POINTER_BUTTON_STATE_RELEASED :: 0;
  WL_POINTER_BUTTON_STATE_PRESSED :: 1;
}

wl_pointer_axis_e :: enum u32 {
  WL_POINTER_AXIS_VERTICAL_SCROLL :: 0;
  WL_POINTER_AXIS_HORIZONTAL_SCROLL :: 1;
}

wl_pointer_axis_source_e :: enum u32 {
  WL_POINTER_AXIS_SOURCE_WHEEL :: 0;
  WL_POINTER_AXIS_SOURCE_FINGER :: 1;
  WL_POINTER_AXIS_SOURCE_CONTINUOUS :: 2;
  WL_POINTER_AXIS_SOURCE_WHEEL_TILT :: 3;
}
WL_POINTER_AXIS_SOURCE_WHEEL_TILT_SINCE_VERSION: u32 : 6;

wl_pointer_axis_relative_direction_e :: enum u32 {
  WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL :: 0;
  WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED :: 1;
}

wl_pointer_listener :: struct {
  enter: #type (data: *void, the_wl_pointer: *wl_pointer, serial: u32, surface: *wl_surface, surface_x: wl_fixed_t, surface_y: wl_fixed_t) -> void #c_call;
  leave: #type (data: *void, the_wl_pointer: *wl_pointer, serial: u32, surface: *wl_surface) -> void #c_call;
  motion: #type (data: *void, the_wl_pointer: *wl_pointer, time: u32, surface_x: wl_fixed_t, surface_y: wl_fixed_t) -> void #c_call;
  button: #type (data: *void, the_wl_pointer: *wl_pointer, serial: u32, time: u32, button: u32, state: u32) -> void #c_call;
  axis: #type (data: *void, the_wl_pointer: *wl_pointer, time: u32, axis: u32, value: wl_fixed_t) -> void #c_call;
  frame: #type (data: *void, the_wl_pointer: *wl_pointer) -> void #c_call;
  axis_source: #type (data: *void, the_wl_pointer: *wl_pointer, axis_source: u32) -> void #c_call;
  axis_stop: #type (data: *void, the_wl_pointer: *wl_pointer, time: u32, axis: u32) -> void #c_call;
  axis_discrete: #type (data: *void, the_wl_pointer: *wl_pointer, axis: u32, discrete: s32) -> void #c_call;
  axis_value120: #type (data: *void, the_wl_pointer: *wl_pointer, axis: u32, value120: s32) -> void #c_call;
  axis_relative_direction: #type (data: *void, the_wl_pointer: *wl_pointer, axis: u32, direction: u32) -> void #c_call;
}

wl_pointer_add_listener :: (the_wl_pointer: *wl_pointer, listener: *wl_pointer_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_pointer, xx listener, data);
}

WL_POINTER_SET_CURSOR: u32 : 0;
WL_POINTER_RELEASE: u32 : 1;

WL_POINTER_ENTER_SINCE_VERSION: u32 : 1;
WL_POINTER_LEAVE_SINCE_VERSION: u32 : 1;
WL_POINTER_MOTION_SINCE_VERSION: u32 : 1;
WL_POINTER_BUTTON_SINCE_VERSION: u32 : 1;
WL_POINTER_AXIS_SINCE_VERSION: u32 : 1;
WL_POINTER_FRAME_SINCE_VERSION: u32 : 5;
WL_POINTER_AXIS_SOURCE_SINCE_VERSION: u32 : 5;
WL_POINTER_AXIS_STOP_SINCE_VERSION: u32 : 5;
WL_POINTER_AXIS_DISCRETE_SINCE_VERSION: u32 : 5;
WL_POINTER_AXIS_VALUE120_SINCE_VERSION: u32 : 8;
WL_POINTER_AXIS_RELATIVE_DIRECTION_SINCE_VERSION: u32 : 9;
WL_POINTER_SET_CURSOR_SINCE_VERSION: u32 : 1;
WL_POINTER_RELEASE_SINCE_VERSION: u32 : 3;

wl_pointer_set_user_data :: (the_wl_pointer: *wl_pointer, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_pointer, user_data);
}

wl_pointer_get_user_data :: (the_wl_pointer: *wl_pointer) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_pointer);
}

wl_pointer_get_version :: (the_wl_pointer: *wl_pointer) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_pointer);
}

wl_pointer_destroy :: (the_wl_pointer: *wl_pointer) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_pointer);
}

wl_pointer_set_cursor :: (the_wl_pointer: *wl_pointer, serial: u32, surface: *wl_surface, hotspot_x: s32, hotspot_y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_pointer, WL_POINTER_SET_CURSOR, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_pointer), 0, serial, surface, hotspot_x, hotspot_y);
}

wl_pointer_release :: (the_wl_pointer: *wl_pointer) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_pointer, WL_POINTER_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_pointer), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_keyboard

wl_keyboard_keymap_format_e :: enum u32 {
  WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP :: 0;
  WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1 :: 1;
}

wl_keyboard_key_state_e :: enum u32 {
  WL_KEYBOARD_KEY_STATE_RELEASED :: 0;
  WL_KEYBOARD_KEY_STATE_PRESSED :: 1;
}

wl_keyboard_listener :: struct {
  keymap: #type (data: *void, the_wl_keyboard: *wl_keyboard, format: u32, fd: s32, size: u32) -> void #c_call;
  enter: #type (data: *void, the_wl_keyboard: *wl_keyboard, serial: u32, surface: *wl_surface, keys: *wl_array) -> void #c_call;
  leave: #type (data: *void, the_wl_keyboard: *wl_keyboard, serial: u32, surface: *wl_surface) -> void #c_call;
  key: #type (data: *void, the_wl_keyboard: *wl_keyboard, serial: u32, time: u32, key: u32, state: u32) -> void #c_call;
  modifiers: #type (data: *void, the_wl_keyboard: *wl_keyboard, serial: u32, mods_depressed: u32, mods_latched: u32, mods_locked: u32, group: u32) -> void #c_call;
  repeat_info: #type (data: *void, the_wl_keyboard: *wl_keyboard, rate: s32, delay: s32) -> void #c_call;
}

wl_keyboard_add_listener :: (the_wl_keyboard: *wl_keyboard, listener: *wl_keyboard_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_keyboard, xx listener, data);
}

WL_KEYBOARD_RELEASE: u32 : 0;

WL_KEYBOARD_KEYMAP_SINCE_VERSION: u32 : 1;
WL_KEYBOARD_ENTER_SINCE_VERSION: u32 : 1;
WL_KEYBOARD_LEAVE_SINCE_VERSION: u32 : 1;
WL_KEYBOARD_KEY_SINCE_VERSION: u32 : 1;
WL_KEYBOARD_MODIFIERS_SINCE_VERSION: u32 : 1;
WL_KEYBOARD_REPEAT_INFO_SINCE_VERSION: u32 : 4;
WL_KEYBOARD_RELEASE_SINCE_VERSION: u32 : 3;

wl_keyboard_set_user_data :: (the_wl_keyboard: *wl_keyboard, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_keyboard, user_data);
}

wl_keyboard_get_user_data :: (the_wl_keyboard: *wl_keyboard) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_keyboard);
}

wl_keyboard_get_version :: (the_wl_keyboard: *wl_keyboard) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_keyboard);
}

wl_keyboard_destroy :: (the_wl_keyboard: *wl_keyboard) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_keyboard);
}

wl_keyboard_release :: (the_wl_keyboard: *wl_keyboard) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_keyboard, WL_KEYBOARD_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_keyboard), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_touch


wl_touch_listener :: struct {
  down: #type (data: *void, the_wl_touch: *wl_touch, serial: u32, time: u32, surface: *wl_surface, id: s32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;
  up: #type (data: *void, the_wl_touch: *wl_touch, serial: u32, time: u32, id: s32) -> void #c_call;
  motion: #type (data: *void, the_wl_touch: *wl_touch, time: u32, id: s32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;
  frame: #type (data: *void, the_wl_touch: *wl_touch) -> void #c_call;
  cancel: #type (data: *void, the_wl_touch: *wl_touch) -> void #c_call;
  shape: #type (data: *void, the_wl_touch: *wl_touch, id: s32, major: wl_fixed_t, minor: wl_fixed_t) -> void #c_call;
  orientation: #type (data: *void, the_wl_touch: *wl_touch, id: s32, orientation: wl_fixed_t) -> void #c_call;
}

wl_touch_add_listener :: (the_wl_touch: *wl_touch, listener: *wl_touch_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_touch, xx listener, data);
}

WL_TOUCH_RELEASE: u32 : 0;

WL_TOUCH_DOWN_SINCE_VERSION: u32 : 1;
WL_TOUCH_UP_SINCE_VERSION: u32 : 1;
WL_TOUCH_MOTION_SINCE_VERSION: u32 : 1;
WL_TOUCH_FRAME_SINCE_VERSION: u32 : 1;
WL_TOUCH_CANCEL_SINCE_VERSION: u32 : 1;
WL_TOUCH_SHAPE_SINCE_VERSION: u32 : 6;
WL_TOUCH_ORIENTATION_SINCE_VERSION: u32 : 6;
WL_TOUCH_RELEASE_SINCE_VERSION: u32 : 3;

wl_touch_set_user_data :: (the_wl_touch: *wl_touch, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_touch, user_data);
}

wl_touch_get_user_data :: (the_wl_touch: *wl_touch) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_touch);
}

wl_touch_get_version :: (the_wl_touch: *wl_touch) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_touch);
}

wl_touch_destroy :: (the_wl_touch: *wl_touch) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_touch);
}

wl_touch_release :: (the_wl_touch: *wl_touch) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_touch, WL_TOUCH_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_touch), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_output

wl_output_subpixel_e :: enum u32 {
  WL_OUTPUT_SUBPIXEL_UNKNOWN :: 0;
  WL_OUTPUT_SUBPIXEL_NONE :: 1;
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB :: 2;
  WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR :: 3;
  WL_OUTPUT_SUBPIXEL_VERTICAL_RGB :: 4;
  WL_OUTPUT_SUBPIXEL_VERTICAL_BGR :: 5;
}

wl_output_transform_e :: enum u32 {
  WL_OUTPUT_TRANSFORM_NORMAL :: 0;
  WL_OUTPUT_TRANSFORM_90 :: 1;
  WL_OUTPUT_TRANSFORM_180 :: 2;
  WL_OUTPUT_TRANSFORM_270 :: 3;
  WL_OUTPUT_TRANSFORM_FLIPPED :: 4;
  WL_OUTPUT_TRANSFORM_FLIPPED_90 :: 5;
  WL_OUTPUT_TRANSFORM_FLIPPED_180 :: 6;
  WL_OUTPUT_TRANSFORM_FLIPPED_270 :: 7;
}

wl_output_mode_e :: enum u32 {
  WL_OUTPUT_MODE_CURRENT :: 1;
  WL_OUTPUT_MODE_PREFERRED :: 2;
}

wl_output_listener :: struct {
  geometry: #type (data: *void, the_wl_output: *wl_output, x: s32, y: s32, physical_width: s32, physical_height: s32, subpixel: s32, make: *u8, model: *u8, transform: s32) -> void #c_call;
  mode: #type (data: *void, the_wl_output: *wl_output, flags: u32, width: s32, height: s32, refresh: s32) -> void #c_call;
  done: #type (data: *void, the_wl_output: *wl_output) -> void #c_call;
  scale: #type (data: *void, the_wl_output: *wl_output, factor: s32) -> void #c_call;
  name: #type (data: *void, the_wl_output: *wl_output, name: *u8) -> void #c_call;
  description: #type (data: *void, the_wl_output: *wl_output, description: *u8) -> void #c_call;
}

wl_output_add_listener :: (the_wl_output: *wl_output, listener: *wl_output_listener, data: *void) -> s32 #c_call {
  return wl_proxy_add_listener(cast(*wl_proxy)the_wl_output, xx listener, data);
}

WL_OUTPUT_RELEASE: u32 : 0;

WL_OUTPUT_GEOMETRY_SINCE_VERSION: u32 : 1;
WL_OUTPUT_MODE_SINCE_VERSION: u32 : 1;
WL_OUTPUT_DONE_SINCE_VERSION: u32 : 2;
WL_OUTPUT_SCALE_SINCE_VERSION: u32 : 2;
WL_OUTPUT_NAME_SINCE_VERSION: u32 : 4;
WL_OUTPUT_DESCRIPTION_SINCE_VERSION: u32 : 4;
WL_OUTPUT_RELEASE_SINCE_VERSION: u32 : 3;

wl_output_set_user_data :: (the_wl_output: *wl_output, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_output, user_data);
}

wl_output_get_user_data :: (the_wl_output: *wl_output) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_output);
}

wl_output_get_version :: (the_wl_output: *wl_output) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_output);
}

wl_output_destroy :: (the_wl_output: *wl_output) -> void #c_call {
  wl_proxy_destroy(cast(*wl_proxy)the_wl_output);
}

wl_output_release :: (the_wl_output: *wl_output) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_output, WL_OUTPUT_RELEASE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_output), WL_MARSHAL_FLAG_DESTROY);
}

// Interface wl_region



WL_REGION_DESTROY: u32 : 0;
WL_REGION_ADD: u32 : 1;
WL_REGION_SUBTRACT: u32 : 2;

WL_REGION_DESTROY_SINCE_VERSION: u32 : 1;
WL_REGION_ADD_SINCE_VERSION: u32 : 1;
WL_REGION_SUBTRACT_SINCE_VERSION: u32 : 1;

wl_region_set_user_data :: (the_wl_region: *wl_region, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_region, user_data);
}

wl_region_get_user_data :: (the_wl_region: *wl_region) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_region);
}

wl_region_get_version :: (the_wl_region: *wl_region) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_region);
}

wl_region_destroy :: (the_wl_region: *wl_region) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_region, WL_REGION_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_region), WL_MARSHAL_FLAG_DESTROY);
}

wl_region_add :: (the_wl_region: *wl_region, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_region, WL_REGION_ADD, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_region), 0, x, y, width, height);
}

wl_region_subtract :: (the_wl_region: *wl_region, x: s32, y: s32, width: s32, height: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_region, WL_REGION_SUBTRACT, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_region), 0, x, y, width, height);
}

// Interface wl_subcompositor

wl_subcompositor_error_e :: enum u32 {
  WL_SUBCOMPOSITOR_ERROR_BAD_SURFACE :: 0;
  WL_SUBCOMPOSITOR_ERROR_BAD_PARENT :: 1;
}


WL_SUBCOMPOSITOR_DESTROY: u32 : 0;
WL_SUBCOMPOSITOR_GET_SUBSURFACE: u32 : 1;

WL_SUBCOMPOSITOR_DESTROY_SINCE_VERSION: u32 : 1;
WL_SUBCOMPOSITOR_GET_SUBSURFACE_SINCE_VERSION: u32 : 1;

wl_subcompositor_set_user_data :: (the_wl_subcompositor: *wl_subcompositor, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_subcompositor, user_data);
}

wl_subcompositor_get_user_data :: (the_wl_subcompositor: *wl_subcompositor) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_subcompositor);
}

wl_subcompositor_get_version :: (the_wl_subcompositor: *wl_subcompositor) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_subcompositor);
}

wl_subcompositor_destroy :: (the_wl_subcompositor: *wl_subcompositor) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subcompositor, WL_SUBCOMPOSITOR_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subcompositor), WL_MARSHAL_FLAG_DESTROY);
}

wl_subcompositor_get_subsurface :: (the_wl_subcompositor: *wl_subcompositor, surface: *wl_surface, parent: *wl_surface) -> *wl_subsurface #c_call {
  id: *wl_proxy;
  id = wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subcompositor, WL_SUBCOMPOSITOR_GET_SUBSURFACE, *wl_subsurface_interface_instance, wl_proxy_get_version(cast(*wl_proxy)the_wl_subcompositor), 0, null, surface, parent);
  return cast(*wl_subsurface)id;
}

// Interface wl_subsurface

wl_subsurface_error_e :: enum u32 {
  WL_SUBSURFACE_ERROR_BAD_SURFACE :: 0;
}


WL_SUBSURFACE_DESTROY: u32 : 0;
WL_SUBSURFACE_SET_POSITION: u32 : 1;
WL_SUBSURFACE_PLACE_ABOVE: u32 : 2;
WL_SUBSURFACE_PLACE_BELOW: u32 : 3;
WL_SUBSURFACE_SET_SYNC: u32 : 4;
WL_SUBSURFACE_SET_DESYNC: u32 : 5;

WL_SUBSURFACE_DESTROY_SINCE_VERSION: u32 : 1;
WL_SUBSURFACE_SET_POSITION_SINCE_VERSION: u32 : 1;
WL_SUBSURFACE_PLACE_ABOVE_SINCE_VERSION: u32 : 1;
WL_SUBSURFACE_PLACE_BELOW_SINCE_VERSION: u32 : 1;
WL_SUBSURFACE_SET_SYNC_SINCE_VERSION: u32 : 1;
WL_SUBSURFACE_SET_DESYNC_SINCE_VERSION: u32 : 1;

wl_subsurface_set_user_data :: (the_wl_subsurface: *wl_subsurface, user_data: *void) -> void #c_call {
  wl_proxy_set_user_data(cast(*wl_proxy)the_wl_subsurface, user_data);
}

wl_subsurface_get_user_data :: (the_wl_subsurface: *wl_subsurface) -> *void #c_call {
  return wl_proxy_get_user_data(cast(*wl_proxy)the_wl_subsurface);
}

wl_subsurface_get_version :: (the_wl_subsurface: *wl_subsurface) -> u32 #c_call {
  return wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface);
}

wl_subsurface_destroy :: (the_wl_subsurface: *wl_subsurface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_DESTROY, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), WL_MARSHAL_FLAG_DESTROY);
}

wl_subsurface_set_position :: (the_wl_subsurface: *wl_subsurface, x: s32, y: s32) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_SET_POSITION, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), 0, x, y);
}

wl_subsurface_place_above :: (the_wl_subsurface: *wl_subsurface, sibling: *wl_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_PLACE_ABOVE, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), 0, sibling);
}

wl_subsurface_place_below :: (the_wl_subsurface: *wl_subsurface, sibling: *wl_surface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_PLACE_BELOW, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), 0, sibling);
}

wl_subsurface_set_sync :: (the_wl_subsurface: *wl_subsurface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_SET_SYNC, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), 0);
}

wl_subsurface_set_desync :: (the_wl_subsurface: *wl_subsurface) -> void #c_call {
  wl_proxy_marshal_flags(cast(*wl_proxy)the_wl_subsurface, WL_SUBSURFACE_SET_DESYNC, null, wl_proxy_get_version(cast(*wl_proxy)the_wl_subsurface), 0);
}

wayland_types: [95] *wl_interface;
wl_display_requests := wl_message.[
  {"sync", "n", wayland_types.data + 8},
  {"get_registry", "n", wayland_types.data + 9},
];

wl_display_events := wl_message.[
  {"error", "ous", wayland_types.data + 0},
  {"delete_id", "u", wayland_types.data + 0},
];

wl_display_interface_instance := wl_interface.{
  "wl_display", 1,
  2, wl_display_requests.data,
  2, wl_display_events.data,
};

wl_registry_requests := wl_message.[
  {"bind", "usun", wayland_types.data + 0},
];

wl_registry_events := wl_message.[
  {"global", "usu", wayland_types.data + 0},
  {"global_remove", "u", wayland_types.data + 0},
];

wl_registry_interface_instance := wl_interface.{
  "wl_registry", 1,
  1, wl_registry_requests.data,
  2, wl_registry_events.data,
};

wl_callback_events := wl_message.[
  {"done", "u", wayland_types.data + 0},
];

wl_callback_interface_instance := wl_interface.{
  "wl_callback", 1,
  0, null,
  1, wl_callback_events.data,
};

wl_compositor_requests := wl_message.[
  {"create_surface", "n", wayland_types.data + 10},
  {"create_region", "n", wayland_types.data + 11},
];

wl_compositor_interface_instance := wl_interface.{
  "wl_compositor", 6,
  2, wl_compositor_requests.data,
  0, null,
};

wl_shm_pool_requests := wl_message.[
  {"create_buffer", "niiiiu", wayland_types.data + 12},
  {"destroy", "", wayland_types.data + 0},
  {"resize", "i", wayland_types.data + 0},
];

wl_shm_pool_interface_instance := wl_interface.{
  "wl_shm_pool", 1,
  3, wl_shm_pool_requests.data,
  0, null,
};

wl_shm_requests := wl_message.[
  {"create_pool", "nhi", wayland_types.data + 18},
];

wl_shm_events := wl_message.[
  {"format", "u", wayland_types.data + 0},
];

wl_shm_interface_instance := wl_interface.{
  "wl_shm", 1,
  1, wl_shm_requests.data,
  1, wl_shm_events.data,
};

wl_buffer_requests := wl_message.[
  {"destroy", "", wayland_types.data + 0},
];

wl_buffer_events := wl_message.[
  {"release", "", wayland_types.data + 0},
];

wl_buffer_interface_instance := wl_interface.{
  "wl_buffer", 1,
  1, wl_buffer_requests.data,
  1, wl_buffer_events.data,
};

wl_data_offer_requests := wl_message.[
  {"accept", "u?s", wayland_types.data + 0},
  {"receive", "sh", wayland_types.data + 0},
  {"destroy", "", wayland_types.data + 0},
  {"finish", "3", wayland_types.data + 0},
  {"set_actions", "3uu", wayland_types.data + 0},
];

wl_data_offer_events := wl_message.[
  {"offer", "s", wayland_types.data + 0},
  {"source_actions", "3u", wayland_types.data + 0},
  {"action", "3u", wayland_types.data + 0},
];

wl_data_offer_interface_instance := wl_interface.{
  "wl_data_offer", 3,
  5, wl_data_offer_requests.data,
  3, wl_data_offer_events.data,
};

wl_data_source_requests := wl_message.[
  {"offer", "s", wayland_types.data + 0},
  {"destroy", "", wayland_types.data + 0},
  {"set_actions", "3u", wayland_types.data + 0},
];

wl_data_source_events := wl_message.[
  {"target", "?s", wayland_types.data + 0},
  {"send", "sh", wayland_types.data + 0},
  {"cancelled", "", wayland_types.data + 0},
  {"dnd_drop_performed", "3", wayland_types.data + 0},
  {"dnd_finished", "3", wayland_types.data + 0},
  {"action", "3u", wayland_types.data + 0},
];

wl_data_source_interface_instance := wl_interface.{
  "wl_data_source", 3,
  3, wl_data_source_requests.data,
  6, wl_data_source_events.data,
};

wl_data_device_requests := wl_message.[
  {"start_drag", "?oo?ou", wayland_types.data + 21},
  {"set_selection", "?ou", wayland_types.data + 25},
  {"release", "2", wayland_types.data + 0},
];

wl_data_device_events := wl_message.[
  {"data_offer", "n", wayland_types.data + 27},
  {"enter", "uoff?o", wayland_types.data + 28},
  {"leave", "", wayland_types.data + 0},
  {"motion", "uff", wayland_types.data + 0},
  {"drop", "", wayland_types.data + 0},
  {"selection", "?o", wayland_types.data + 33},
];

wl_data_device_interface_instance := wl_interface.{
  "wl_data_device", 3,
  3, wl_data_device_requests.data,
  6, wl_data_device_events.data,
};

wl_data_device_manager_requests := wl_message.[
  {"create_data_source", "n", wayland_types.data + 34},
  {"get_data_device", "no", wayland_types.data + 35},
];

wl_data_device_manager_interface_instance := wl_interface.{
  "wl_data_device_manager", 3,
  2, wl_data_device_manager_requests.data,
  0, null,
};

wl_shell_requests := wl_message.[
  {"get_shell_surface", "no", wayland_types.data + 37},
];

wl_shell_interface_instance := wl_interface.{
  "wl_shell", 1,
  1, wl_shell_requests.data,
  0, null,
};

wl_shell_surface_requests := wl_message.[
  {"pong", "u", wayland_types.data + 0},
  {"move", "ou", wayland_types.data + 39},
  {"resize", "ouu", wayland_types.data + 41},
  {"set_toplevel", "", wayland_types.data + 0},
  {"set_transient", "oiiu", wayland_types.data + 44},
  {"set_fullscreen", "uu?o", wayland_types.data + 48},
  {"set_popup", "ouoiiu", wayland_types.data + 51},
  {"set_maximized", "?o", wayland_types.data + 57},
  {"set_title", "s", wayland_types.data + 0},
  {"set_class", "s", wayland_types.data + 0},
];

wl_shell_surface_events := wl_message.[
  {"ping", "u", wayland_types.data + 0},
  {"configure", "uii", wayland_types.data + 0},
  {"popup_done", "", wayland_types.data + 0},
];

wl_shell_surface_interface_instance := wl_interface.{
  "wl_shell_surface", 1,
  10, wl_shell_surface_requests.data,
  3, wl_shell_surface_events.data,
};

wl_surface_requests := wl_message.[
  {"destroy", "", wayland_types.data + 0},
  {"attach", "?oii", wayland_types.data + 58},
  {"damage", "iiii", wayland_types.data + 0},
  {"frame", "n", wayland_types.data + 61},
  {"set_opaque_region", "?o", wayland_types.data + 62},
  {"set_input_region", "?o", wayland_types.data + 63},
  {"commit", "", wayland_types.data + 0},
  {"set_buffer_transform", "2i", wayland_types.data + 0},
  {"set_buffer_scale", "3i", wayland_types.data + 0},
  {"damage_buffer", "4iiii", wayland_types.data + 0},
  {"offset", "5ii", wayland_types.data + 0},
];

wl_surface_events := wl_message.[
  {"enter", "o", wayland_types.data + 64},
  {"leave", "o", wayland_types.data + 65},
  {"preferred_buffer_scale", "6i", wayland_types.data + 0},
  {"preferred_buffer_transform", "6u", wayland_types.data + 0},
];

wl_surface_interface_instance := wl_interface.{
  "wl_surface", 6,
  11, wl_surface_requests.data,
  4, wl_surface_events.data,
};

wl_seat_requests := wl_message.[
  {"get_pointer", "n", wayland_types.data + 66},
  {"get_keyboard", "n", wayland_types.data + 67},
  {"get_touch", "n", wayland_types.data + 68},
  {"release", "5", wayland_types.data + 0},
];

wl_seat_events := wl_message.[
  {"capabilities", "u", wayland_types.data + 0},
  {"name", "2s", wayland_types.data + 0},
];

wl_seat_interface_instance := wl_interface.{
  "wl_seat", 9,
  4, wl_seat_requests.data,
  2, wl_seat_events.data,
};

wl_pointer_requests := wl_message.[
  {"set_cursor", "u?oii", wayland_types.data + 69},
  {"release", "3", wayland_types.data + 0},
];

wl_pointer_events := wl_message.[
  {"enter", "uoff", wayland_types.data + 73},
  {"leave", "uo", wayland_types.data + 77},
  {"motion", "uff", wayland_types.data + 0},
  {"button", "uuuu", wayland_types.data + 0},
  {"axis", "uuf", wayland_types.data + 0},
  {"frame", "5", wayland_types.data + 0},
  {"axis_source", "5u", wayland_types.data + 0},
  {"axis_stop", "5uu", wayland_types.data + 0},
  {"axis_discrete", "5ui", wayland_types.data + 0},
  {"axis_value120", "8ui", wayland_types.data + 0},
  {"axis_relative_direction", "9uu", wayland_types.data + 0},
];

wl_pointer_interface_instance := wl_interface.{
  "wl_pointer", 9,
  2, wl_pointer_requests.data,
  11, wl_pointer_events.data,
};

wl_keyboard_requests := wl_message.[
  {"release", "3", wayland_types.data + 0},
];

wl_keyboard_events := wl_message.[
  {"keymap", "uhu", wayland_types.data + 0},
  {"enter", "uoa", wayland_types.data + 79},
  {"leave", "uo", wayland_types.data + 82},
  {"key", "uuuu", wayland_types.data + 0},
  {"modifiers", "uuuuu", wayland_types.data + 0},
  {"repeat_info", "4ii", wayland_types.data + 0},
];

wl_keyboard_interface_instance := wl_interface.{
  "wl_keyboard", 9,
  1, wl_keyboard_requests.data,
  6, wl_keyboard_events.data,
};

wl_touch_requests := wl_message.[
  {"release", "3", wayland_types.data + 0},
];

wl_touch_events := wl_message.[
  {"down", "uuoiff", wayland_types.data + 84},
  {"up", "uui", wayland_types.data + 0},
  {"motion", "uiff", wayland_types.data + 0},
  {"frame", "", wayland_types.data + 0},
  {"cancel", "", wayland_types.data + 0},
  {"shape", "6iff", wayland_types.data + 0},
  {"orientation", "6if", wayland_types.data + 0},
];

wl_touch_interface_instance := wl_interface.{
  "wl_touch", 9,
  1, wl_touch_requests.data,
  7, wl_touch_events.data,
};

wl_output_requests := wl_message.[
  {"release", "3", wayland_types.data + 0},
];

wl_output_events := wl_message.[
  {"geometry", "iiiiissi", wayland_types.data + 0},
  {"mode", "uiii", wayland_types.data + 0},
  {"done", "2", wayland_types.data + 0},
  {"scale", "2i", wayland_types.data + 0},
  {"name", "4s", wayland_types.data + 0},
  {"description", "4s", wayland_types.data + 0},
];

wl_output_interface_instance := wl_interface.{
  "wl_output", 4,
  1, wl_output_requests.data,
  6, wl_output_events.data,
};

wl_region_requests := wl_message.[
  {"destroy", "", wayland_types.data + 0},
  {"add", "iiii", wayland_types.data + 0},
  {"subtract", "iiii", wayland_types.data + 0},
];

wl_region_interface_instance := wl_interface.{
  "wl_region", 1,
  3, wl_region_requests.data,
  0, null,
};

wl_subcompositor_requests := wl_message.[
  {"destroy", "", wayland_types.data + 0},
  {"get_subsurface", "noo", wayland_types.data + 90},
];

wl_subcompositor_interface_instance := wl_interface.{
  "wl_subcompositor", 1,
  2, wl_subcompositor_requests.data,
  0, null,
};

wl_subsurface_requests := wl_message.[
  {"destroy", "", wayland_types.data + 0},
  {"set_position", "ii", wayland_types.data + 0},
  {"place_above", "o", wayland_types.data + 93},
  {"place_below", "o", wayland_types.data + 94},
  {"set_sync", "", wayland_types.data + 0},
  {"set_desync", "", wayland_types.data + 0},
];

wl_subsurface_interface_instance := wl_interface.{
  "wl_subsurface", 1,
  6, wl_subsurface_requests.data,
  0, null,
};

// Users of these bindings must call this function before attempting to use any
// other code provided by the bindings. This initializes fundamental Wayland
// protocol types that we are not able to initialize at compile time in Jai at
// this time.
init_wayland_protocol_bindings :: () {
  xdg_shell_types[0] = null;
  xdg_shell_types[1] = null;
  xdg_shell_types[2] = null;
  xdg_shell_types[3] = null;
  xdg_shell_types[4] = *xdg_positioner_interface_instance;
  xdg_shell_types[5] = *xdg_surface_interface_instance;
  xdg_shell_types[6] = *wl_surface_interface_instance;
  xdg_shell_types[7] = *xdg_toplevel_interface_instance;
  xdg_shell_types[8] = *xdg_popup_interface_instance;
  xdg_shell_types[9] = *xdg_surface_interface_instance;
  xdg_shell_types[10] = *xdg_positioner_interface_instance;
  xdg_shell_types[11] = *xdg_toplevel_interface_instance;
  xdg_shell_types[12] = *wl_seat_interface_instance;
  xdg_shell_types[13] = null;
  xdg_shell_types[14] = null;
  xdg_shell_types[15] = null;
  xdg_shell_types[16] = *wl_seat_interface_instance;
  xdg_shell_types[17] = null;
  xdg_shell_types[18] = *wl_seat_interface_instance;
  xdg_shell_types[19] = null;
  xdg_shell_types[20] = null;
  xdg_shell_types[21] = *wl_output_interface_instance;
  xdg_shell_types[22] = *wl_seat_interface_instance;
  xdg_shell_types[23] = null;
  xdg_shell_types[24] = *xdg_positioner_interface_instance;
  xdg_shell_types[25] = null;

  xdg_decoration_unstable_v1_types[0] = null;
  xdg_decoration_unstable_v1_types[1] = *zxdg_toplevel_decoration_v1_interface_instance;
  xdg_decoration_unstable_v1_types[2] = *xdg_toplevel_interface_instance;

  wayland_types[0] = null;
  wayland_types[1] = null;
  wayland_types[2] = null;
  wayland_types[3] = null;
  wayland_types[4] = null;
  wayland_types[5] = null;
  wayland_types[6] = null;
  wayland_types[7] = null;
  wayland_types[8] = *wl_callback_interface_instance;
  wayland_types[9] = *wl_registry_interface_instance;
  wayland_types[10] = *wl_surface_interface_instance;
  wayland_types[11] = *wl_region_interface_instance;
  wayland_types[12] = *wl_buffer_interface_instance;
  wayland_types[13] = null;
  wayland_types[14] = null;
  wayland_types[15] = null;
  wayland_types[16] = null;
  wayland_types[17] = null;
  wayland_types[18] = *wl_shm_pool_interface_instance;
  wayland_types[19] = null;
  wayland_types[20] = null;
  wayland_types[21] = *wl_data_source_interface_instance;
  wayland_types[22] = *wl_surface_interface_instance;
  wayland_types[23] = *wl_surface_interface_instance;
  wayland_types[24] = null;
  wayland_types[25] = *wl_data_source_interface_instance;
  wayland_types[26] = null;
  wayland_types[27] = *wl_data_offer_interface_instance;
  wayland_types[28] = null;
  wayland_types[29] = *wl_surface_interface_instance;
  wayland_types[30] = null;
  wayland_types[31] = null;
  wayland_types[32] = *wl_data_offer_interface_instance;
  wayland_types[33] = *wl_data_offer_interface_instance;
  wayland_types[34] = *wl_data_source_interface_instance;
  wayland_types[35] = *wl_data_device_interface_instance;
  wayland_types[36] = *wl_seat_interface_instance;
  wayland_types[37] = *wl_shell_surface_interface_instance;
  wayland_types[38] = *wl_surface_interface_instance;
  wayland_types[39] = *wl_seat_interface_instance;
  wayland_types[40] = null;
  wayland_types[41] = *wl_seat_interface_instance;
  wayland_types[42] = null;
  wayland_types[43] = null;
  wayland_types[44] = *wl_surface_interface_instance;
  wayland_types[45] = null;
  wayland_types[46] = null;
  wayland_types[47] = null;
  wayland_types[48] = null;
  wayland_types[49] = null;
  wayland_types[50] = *wl_output_interface_instance;
  wayland_types[51] = *wl_seat_interface_instance;
  wayland_types[52] = null;
  wayland_types[53] = *wl_surface_interface_instance;
  wayland_types[54] = null;
  wayland_types[55] = null;
  wayland_types[56] = null;
  wayland_types[57] = *wl_output_interface_instance;
  wayland_types[58] = *wl_buffer_interface_instance;
  wayland_types[59] = null;
  wayland_types[60] = null;
  wayland_types[61] = *wl_callback_interface_instance;
  wayland_types[62] = *wl_region_interface_instance;
  wayland_types[63] = *wl_region_interface_instance;
  wayland_types[64] = *wl_output_interface_instance;
  wayland_types[65] = *wl_output_interface_instance;
  wayland_types[66] = *wl_pointer_interface_instance;
  wayland_types[67] = *wl_keyboard_interface_instance;
  wayland_types[68] = *wl_touch_interface_instance;
  wayland_types[69] = null;
  wayland_types[70] = *wl_surface_interface_instance;
  wayland_types[71] = null;
  wayland_types[72] = null;
  wayland_types[73] = null;
  wayland_types[74] = *wl_surface_interface_instance;
  wayland_types[75] = null;
  wayland_types[76] = null;
  wayland_types[77] = null;
  wayland_types[78] = *wl_surface_interface_instance;
  wayland_types[79] = null;
  wayland_types[80] = *wl_surface_interface_instance;
  wayland_types[81] = null;
  wayland_types[82] = null;
  wayland_types[83] = *wl_surface_interface_instance;
  wayland_types[84] = null;
  wayland_types[85] = null;
  wayland_types[86] = *wl_surface_interface_instance;
  wayland_types[87] = null;
  wayland_types[88] = null;
  wayland_types[89] = null;
  wayland_types[90] = *wl_subsurface_interface_instance;
  wayland_types[91] = *wl_surface_interface_instance;
  wayland_types[92] = *wl_surface_interface_instance;
  wayland_types[93] = *wl_surface_interface_instance;
  wayland_types[94] = *wl_surface_interface_instance;

}
