//
// This file was auto-generated using the following command:
//
// jai generate.jai
//
libwayland_client   :: #library,system "libwayland-client.so.0";
libxdg_shell_client :: #library "./xdg_shell_client";



WAYLAND_VERSION_MAJOR :: 1;
WAYLAND_VERSION_MINOR :: 22;
WAYLAND_VERSION_MICRO :: 0;
WAYLAND_VERSION :: "1.22.0";

WL_MARSHAL_FLAG_DESTROY :: 1 << 0;

WL_DISPLAY_SYNC :: 0;
WL_DISPLAY_GET_REGISTRY :: 1;

WL_DISPLAY_ERROR_SINCE_VERSION :: 1;

WL_DISPLAY_DELETE_ID_SINCE_VERSION :: 1;

WL_DISPLAY_SYNC_SINCE_VERSION :: 1;

WL_DISPLAY_GET_REGISTRY_SINCE_VERSION :: 1;

WL_REGISTRY_BIND :: 0;

WL_REGISTRY_GLOBAL_SINCE_VERSION :: 1;

WL_REGISTRY_GLOBAL_REMOVE_SINCE_VERSION :: 1;

WL_REGISTRY_BIND_SINCE_VERSION :: 1;

WL_CALLBACK_DONE_SINCE_VERSION :: 1;

WL_COMPOSITOR_CREATE_SURFACE :: 0;
WL_COMPOSITOR_CREATE_REGION :: 1;

WL_COMPOSITOR_CREATE_SURFACE_SINCE_VERSION :: 1;

WL_COMPOSITOR_CREATE_REGION_SINCE_VERSION :: 1;

WL_SHM_POOL_CREATE_BUFFER :: 0;
WL_SHM_POOL_DESTROY :: 1;
WL_SHM_POOL_RESIZE :: 2;

WL_SHM_POOL_CREATE_BUFFER_SINCE_VERSION :: 1;

WL_SHM_POOL_DESTROY_SINCE_VERSION :: 1;

WL_SHM_POOL_RESIZE_SINCE_VERSION :: 1;

WL_SHM_CREATE_POOL :: 0;

WL_SHM_FORMAT_SINCE_VERSION :: 1;

WL_SHM_CREATE_POOL_SINCE_VERSION :: 1;

WL_BUFFER_DESTROY :: 0;

WL_BUFFER_RELEASE_SINCE_VERSION :: 1;

WL_BUFFER_DESTROY_SINCE_VERSION :: 1;

WL_DATA_OFFER_ACCEPT :: 0;
WL_DATA_OFFER_RECEIVE :: 1;
WL_DATA_OFFER_DESTROY :: 2;
WL_DATA_OFFER_FINISH :: 3;
WL_DATA_OFFER_SET_ACTIONS :: 4;

WL_DATA_OFFER_OFFER_SINCE_VERSION :: 1;

WL_DATA_OFFER_SOURCE_ACTIONS_SINCE_VERSION :: 3;

WL_DATA_OFFER_ACTION_SINCE_VERSION :: 3;

WL_DATA_OFFER_ACCEPT_SINCE_VERSION :: 1;

WL_DATA_OFFER_RECEIVE_SINCE_VERSION :: 1;

WL_DATA_OFFER_DESTROY_SINCE_VERSION :: 1;

WL_DATA_OFFER_FINISH_SINCE_VERSION :: 3;

WL_DATA_OFFER_SET_ACTIONS_SINCE_VERSION :: 3;

WL_DATA_SOURCE_OFFER :: 0;
WL_DATA_SOURCE_DESTROY :: 1;
WL_DATA_SOURCE_SET_ACTIONS :: 2;

WL_DATA_SOURCE_TARGET_SINCE_VERSION :: 1;

WL_DATA_SOURCE_SEND_SINCE_VERSION :: 1;

WL_DATA_SOURCE_CANCELLED_SINCE_VERSION :: 1;

WL_DATA_SOURCE_DND_DROP_PERFORMED_SINCE_VERSION :: 3;

WL_DATA_SOURCE_DND_FINISHED_SINCE_VERSION :: 3;

WL_DATA_SOURCE_ACTION_SINCE_VERSION :: 3;

WL_DATA_SOURCE_OFFER_SINCE_VERSION :: 1;

WL_DATA_SOURCE_DESTROY_SINCE_VERSION :: 1;

WL_DATA_SOURCE_SET_ACTIONS_SINCE_VERSION :: 3;

WL_DATA_DEVICE_START_DRAG :: 0;
WL_DATA_DEVICE_SET_SELECTION :: 1;
WL_DATA_DEVICE_RELEASE :: 2;

WL_DATA_DEVICE_DATA_OFFER_SINCE_VERSION :: 1;

WL_DATA_DEVICE_ENTER_SINCE_VERSION :: 1;

WL_DATA_DEVICE_LEAVE_SINCE_VERSION :: 1;

WL_DATA_DEVICE_MOTION_SINCE_VERSION :: 1;

WL_DATA_DEVICE_DROP_SINCE_VERSION :: 1;

WL_DATA_DEVICE_SELECTION_SINCE_VERSION :: 1;

WL_DATA_DEVICE_START_DRAG_SINCE_VERSION :: 1;

WL_DATA_DEVICE_SET_SELECTION_SINCE_VERSION :: 1;

WL_DATA_DEVICE_RELEASE_SINCE_VERSION :: 2;

WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE :: 0;
WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE :: 1;

WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE_SINCE_VERSION :: 1;

WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE_SINCE_VERSION :: 1;

WL_SHELL_GET_SHELL_SURFACE :: 0;

WL_SHELL_GET_SHELL_SURFACE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_PONG :: 0;
WL_SHELL_SURFACE_MOVE :: 1;
WL_SHELL_SURFACE_RESIZE :: 2;
WL_SHELL_SURFACE_SET_TOPLEVEL :: 3;
WL_SHELL_SURFACE_SET_TRANSIENT :: 4;
WL_SHELL_SURFACE_SET_FULLSCREEN :: 5;
WL_SHELL_SURFACE_SET_POPUP :: 6;
WL_SHELL_SURFACE_SET_MAXIMIZED :: 7;
WL_SHELL_SURFACE_SET_TITLE :: 8;
WL_SHELL_SURFACE_SET_CLASS :: 9;

WL_SHELL_SURFACE_PING_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_CONFIGURE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_POPUP_DONE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_PONG_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_MOVE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_RESIZE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_TOPLEVEL_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_TRANSIENT_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_FULLSCREEN_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_POPUP_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_MAXIMIZED_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_TITLE_SINCE_VERSION :: 1;

WL_SHELL_SURFACE_SET_CLASS_SINCE_VERSION :: 1;

WL_SURFACE_DESTROY :: 0;
WL_SURFACE_ATTACH :: 1;
WL_SURFACE_DAMAGE :: 2;
WL_SURFACE_FRAME :: 3;
WL_SURFACE_SET_OPAQUE_REGION :: 4;
WL_SURFACE_SET_INPUT_REGION :: 5;
WL_SURFACE_COMMIT :: 6;
WL_SURFACE_SET_BUFFER_TRANSFORM :: 7;
WL_SURFACE_SET_BUFFER_SCALE :: 8;
WL_SURFACE_DAMAGE_BUFFER :: 9;
WL_SURFACE_OFFSET :: 10;

WL_SURFACE_ENTER_SINCE_VERSION :: 1;

WL_SURFACE_LEAVE_SINCE_VERSION :: 1;

WL_SURFACE_PREFERRED_BUFFER_SCALE_SINCE_VERSION :: 6;

WL_SURFACE_PREFERRED_BUFFER_TRANSFORM_SINCE_VERSION :: 6;

WL_SURFACE_DESTROY_SINCE_VERSION :: 1;

WL_SURFACE_ATTACH_SINCE_VERSION :: 1;

WL_SURFACE_DAMAGE_SINCE_VERSION :: 1;

WL_SURFACE_FRAME_SINCE_VERSION :: 1;

WL_SURFACE_SET_OPAQUE_REGION_SINCE_VERSION :: 1;

WL_SURFACE_SET_INPUT_REGION_SINCE_VERSION :: 1;

WL_SURFACE_COMMIT_SINCE_VERSION :: 1;

WL_SURFACE_SET_BUFFER_TRANSFORM_SINCE_VERSION :: 2;

WL_SURFACE_SET_BUFFER_SCALE_SINCE_VERSION :: 3;

WL_SURFACE_DAMAGE_BUFFER_SINCE_VERSION :: 4;

WL_SURFACE_OFFSET_SINCE_VERSION :: 5;

WL_SEAT_GET_POINTER :: 0;
WL_SEAT_GET_KEYBOARD :: 1;
WL_SEAT_GET_TOUCH :: 2;
WL_SEAT_RELEASE :: 3;

WL_SEAT_CAPABILITIES_SINCE_VERSION :: 1;

WL_SEAT_NAME_SINCE_VERSION :: 2;

WL_SEAT_GET_POINTER_SINCE_VERSION :: 1;

WL_SEAT_GET_KEYBOARD_SINCE_VERSION :: 1;

WL_SEAT_GET_TOUCH_SINCE_VERSION :: 1;

WL_SEAT_RELEASE_SINCE_VERSION :: 5;

WL_POINTER_AXIS_SOURCE_WHEEL_TILT_SINCE_VERSION :: 6;

WL_POINTER_SET_CURSOR :: 0;
WL_POINTER_RELEASE :: 1;

WL_POINTER_ENTER_SINCE_VERSION :: 1;

WL_POINTER_LEAVE_SINCE_VERSION :: 1;

WL_POINTER_MOTION_SINCE_VERSION :: 1;

WL_POINTER_BUTTON_SINCE_VERSION :: 1;

WL_POINTER_AXIS_SINCE_VERSION :: 1;

WL_POINTER_FRAME_SINCE_VERSION :: 5;

WL_POINTER_AXIS_SOURCE_SINCE_VERSION :: 5;

WL_POINTER_AXIS_STOP_SINCE_VERSION :: 5;

WL_POINTER_AXIS_DISCRETE_SINCE_VERSION :: 5;

WL_POINTER_AXIS_VALUE120_SINCE_VERSION :: 8;

WL_POINTER_AXIS_RELATIVE_DIRECTION_SINCE_VERSION :: 9;

WL_POINTER_SET_CURSOR_SINCE_VERSION :: 1;

WL_POINTER_RELEASE_SINCE_VERSION :: 3;

WL_KEYBOARD_RELEASE :: 0;

WL_KEYBOARD_KEYMAP_SINCE_VERSION :: 1;

WL_KEYBOARD_ENTER_SINCE_VERSION :: 1;

WL_KEYBOARD_LEAVE_SINCE_VERSION :: 1;

WL_KEYBOARD_KEY_SINCE_VERSION :: 1;

WL_KEYBOARD_MODIFIERS_SINCE_VERSION :: 1;

WL_KEYBOARD_REPEAT_INFO_SINCE_VERSION :: 4;

WL_KEYBOARD_RELEASE_SINCE_VERSION :: 3;

WL_TOUCH_RELEASE :: 0;

WL_TOUCH_DOWN_SINCE_VERSION :: 1;

WL_TOUCH_UP_SINCE_VERSION :: 1;

WL_TOUCH_MOTION_SINCE_VERSION :: 1;

WL_TOUCH_FRAME_SINCE_VERSION :: 1;

WL_TOUCH_CANCEL_SINCE_VERSION :: 1;

WL_TOUCH_SHAPE_SINCE_VERSION :: 6;

WL_TOUCH_ORIENTATION_SINCE_VERSION :: 6;

WL_TOUCH_RELEASE_SINCE_VERSION :: 3;

WL_OUTPUT_RELEASE :: 0;

WL_OUTPUT_GEOMETRY_SINCE_VERSION :: 1;

WL_OUTPUT_MODE_SINCE_VERSION :: 1;

WL_OUTPUT_DONE_SINCE_VERSION :: 2;

WL_OUTPUT_SCALE_SINCE_VERSION :: 2;

WL_OUTPUT_NAME_SINCE_VERSION :: 4;

WL_OUTPUT_DESCRIPTION_SINCE_VERSION :: 4;

WL_OUTPUT_RELEASE_SINCE_VERSION :: 3;

WL_REGION_DESTROY :: 0;
WL_REGION_ADD :: 1;
WL_REGION_SUBTRACT :: 2;

WL_REGION_DESTROY_SINCE_VERSION :: 1;

WL_REGION_ADD_SINCE_VERSION :: 1;

WL_REGION_SUBTRACT_SINCE_VERSION :: 1;

WL_SUBCOMPOSITOR_DESTROY :: 0;
WL_SUBCOMPOSITOR_GET_SUBSURFACE :: 1;

WL_SUBCOMPOSITOR_DESTROY_SINCE_VERSION :: 1;

WL_SUBCOMPOSITOR_GET_SUBSURFACE_SINCE_VERSION :: 1;

WL_SUBSURFACE_DESTROY :: 0;
WL_SUBSURFACE_SET_POSITION :: 1;
WL_SUBSURFACE_PLACE_ABOVE :: 2;
WL_SUBSURFACE_PLACE_BELOW :: 3;
WL_SUBSURFACE_SET_SYNC :: 4;
WL_SUBSURFACE_SET_DESYNC :: 5;

WL_SUBSURFACE_DESTROY_SINCE_VERSION :: 1;

WL_SUBSURFACE_SET_POSITION_SINCE_VERSION :: 1;

WL_SUBSURFACE_PLACE_ABOVE_SINCE_VERSION :: 1;

WL_SUBSURFACE_PLACE_BELOW_SINCE_VERSION :: 1;

WL_SUBSURFACE_SET_SYNC_SINCE_VERSION :: 1;

WL_SUBSURFACE_SET_DESYNC_SINCE_VERSION :: 1;

XDG_WM_BASE_DESTROY :: 0;
XDG_WM_BASE_CREATE_POSITIONER :: 1;
XDG_WM_BASE_GET_XDG_SURFACE :: 2;
XDG_WM_BASE_PONG :: 3;

XDG_WM_BASE_PING_SINCE_VERSION :: 1;

XDG_WM_BASE_DESTROY_SINCE_VERSION :: 1;

XDG_WM_BASE_CREATE_POSITIONER_SINCE_VERSION :: 1;

XDG_WM_BASE_GET_XDG_SURFACE_SINCE_VERSION :: 1;

XDG_WM_BASE_PONG_SINCE_VERSION :: 1;

XDG_POSITIONER_DESTROY :: 0;
XDG_POSITIONER_SET_SIZE :: 1;
XDG_POSITIONER_SET_ANCHOR_RECT :: 2;
XDG_POSITIONER_SET_ANCHOR :: 3;
XDG_POSITIONER_SET_GRAVITY :: 4;
XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT :: 5;
XDG_POSITIONER_SET_OFFSET :: 6;
XDG_POSITIONER_SET_REACTIVE :: 7;
XDG_POSITIONER_SET_PARENT_SIZE :: 8;
XDG_POSITIONER_SET_PARENT_CONFIGURE :: 9;

XDG_POSITIONER_DESTROY_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_SIZE_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_ANCHOR_RECT_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_ANCHOR_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_GRAVITY_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_CONSTRAINT_ADJUSTMENT_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_OFFSET_SINCE_VERSION :: 1;

XDG_POSITIONER_SET_REACTIVE_SINCE_VERSION :: 3;

XDG_POSITIONER_SET_PARENT_SIZE_SINCE_VERSION :: 3;

XDG_POSITIONER_SET_PARENT_CONFIGURE_SINCE_VERSION :: 3;

XDG_SURFACE_DESTROY :: 0;
XDG_SURFACE_GET_TOPLEVEL :: 1;
XDG_SURFACE_GET_POPUP :: 2;
XDG_SURFACE_SET_WINDOW_GEOMETRY :: 3;
XDG_SURFACE_ACK_CONFIGURE :: 4;

XDG_SURFACE_CONFIGURE_SINCE_VERSION :: 1;

XDG_SURFACE_DESTROY_SINCE_VERSION :: 1;

XDG_SURFACE_GET_TOPLEVEL_SINCE_VERSION :: 1;

XDG_SURFACE_GET_POPUP_SINCE_VERSION :: 1;

XDG_SURFACE_SET_WINDOW_GEOMETRY_SINCE_VERSION :: 1;

XDG_SURFACE_ACK_CONFIGURE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_STATE_TILED_LEFT_SINCE_VERSION :: 2;

XDG_TOPLEVEL_STATE_TILED_RIGHT_SINCE_VERSION :: 2;

XDG_TOPLEVEL_STATE_TILED_TOP_SINCE_VERSION :: 2;

XDG_TOPLEVEL_STATE_TILED_BOTTOM_SINCE_VERSION :: 2;

XDG_TOPLEVEL_STATE_SUSPENDED_SINCE_VERSION :: 6;

XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT_SINCE_VERSION :: 7;

XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT_SINCE_VERSION :: 7;

XDG_TOPLEVEL_STATE_CONSTRAINED_TOP_SINCE_VERSION :: 7;

XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM_SINCE_VERSION :: 7;

XDG_TOPLEVEL_DESTROY :: 0;
XDG_TOPLEVEL_SET_PARENT :: 1;
XDG_TOPLEVEL_SET_TITLE :: 2;
XDG_TOPLEVEL_SET_APP_ID :: 3;
XDG_TOPLEVEL_SHOW_WINDOW_MENU :: 4;
XDG_TOPLEVEL_MOVE :: 5;
XDG_TOPLEVEL_RESIZE :: 6;
XDG_TOPLEVEL_SET_MAX_SIZE :: 7;
XDG_TOPLEVEL_SET_MIN_SIZE :: 8;
XDG_TOPLEVEL_SET_MAXIMIZED :: 9;
XDG_TOPLEVEL_UNSET_MAXIMIZED :: 10;
XDG_TOPLEVEL_SET_FULLSCREEN :: 11;
XDG_TOPLEVEL_UNSET_FULLSCREEN :: 12;
XDG_TOPLEVEL_SET_MINIMIZED :: 13;

XDG_TOPLEVEL_CONFIGURE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_CLOSE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_CONFIGURE_BOUNDS_SINCE_VERSION :: 4;

XDG_TOPLEVEL_WM_CAPABILITIES_SINCE_VERSION :: 5;

XDG_TOPLEVEL_DESTROY_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_PARENT_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_TITLE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_APP_ID_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SHOW_WINDOW_MENU_SINCE_VERSION :: 1;

XDG_TOPLEVEL_MOVE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_RESIZE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_MAX_SIZE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_MIN_SIZE_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_MAXIMIZED_SINCE_VERSION :: 1;

XDG_TOPLEVEL_UNSET_MAXIMIZED_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_FULLSCREEN_SINCE_VERSION :: 1;

XDG_TOPLEVEL_UNSET_FULLSCREEN_SINCE_VERSION :: 1;

XDG_TOPLEVEL_SET_MINIMIZED_SINCE_VERSION :: 1;

XDG_POPUP_DESTROY :: 0;
XDG_POPUP_GRAB :: 1;
XDG_POPUP_REPOSITION :: 2;

XDG_POPUP_CONFIGURE_SINCE_VERSION :: 1;

XDG_POPUP_POPUP_DONE_SINCE_VERSION :: 1;

XDG_POPUP_REPOSITIONED_SINCE_VERSION :: 3;

XDG_POPUP_DESTROY_SINCE_VERSION :: 1;

XDG_POPUP_GRAB_SINCE_VERSION :: 1;

XDG_POPUP_REPOSITION_SINCE_VERSION :: 3;

ZXDG_DECORATION_MANAGER_V1_DESTROY :: 0;
ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION :: 1;

ZXDG_DECORATION_MANAGER_V1_DESTROY_SINCE_VERSION :: 1;

ZXDG_DECORATION_MANAGER_V1_GET_TOPLEVEL_DECORATION_SINCE_VERSION :: 1;

ZXDG_TOPLEVEL_DECORATION_V1_DESTROY :: 0;
ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE :: 1;
ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE :: 2;

ZXDG_TOPLEVEL_DECORATION_V1_CONFIGURE_SINCE_VERSION :: 1;

ZXDG_TOPLEVEL_DECORATION_V1_DESTROY_SINCE_VERSION :: 1;

ZXDG_TOPLEVEL_DECORATION_V1_SET_MODE_SINCE_VERSION :: 1;

ZXDG_TOPLEVEL_DECORATION_V1_UNSET_MODE_SINCE_VERSION :: 1;

wl_object :: struct {}

wl_message :: struct {
    name:      *u8;

    signature: *u8;

    types:     **wl_interface;
}

wl_interface :: struct {
    name:         *u8;

    version:      s32;

    method_count: s32;

    methods:      *wl_message;

    event_count:  s32;

    events:       *wl_message;
}

wl_list :: struct {
    prev: *wl_list;

    next: *wl_list;
}

wl_list_init :: (list: *wl_list) -> void #foreign libwayland_client;

wl_list_insert :: (list: *wl_list, elm: *wl_list) -> void #foreign libwayland_client;

wl_list_remove :: (elm: *wl_list) -> void #foreign libwayland_client;

wl_list_length :: (list: *wl_list) -> s32 #foreign libwayland_client;

wl_list_empty :: (list: *wl_list) -> s32 #foreign libwayland_client;

wl_list_insert_list :: (list: *wl_list, other: *wl_list) -> void #foreign libwayland_client;

wl_array :: struct {
    size:  u64;

    alloc: u64;

    data:  *void;
}

wl_array_init :: (array: *wl_array) -> void #foreign libwayland_client;

wl_array_release :: (array: *wl_array) -> void #foreign libwayland_client;

wl_array_add :: (array: *wl_array, size: u64) -> *void #foreign libwayland_client;

wl_array_copy :: (array: *wl_array, source: *wl_array) -> s32 #foreign libwayland_client;

wl_fixed_t :: s32;

wl_argument :: union {
    i: s32;
    u: u32;
    f: wl_fixed_t;
    s: *u8;
    o: *wl_object;
    n: u32;
    a: *wl_array;
    h: s32;
}

wl_dispatcher_func_t :: #type (user_data: *void, target: *void, opcode: u32, msg: *wl_message, args: *wl_argument) -> s32 #c_call;

wl_log_func_t :: *void /* function type contained C va_list argument */;

wl_iterator_result :: enum u32 {
    STOP     :: 0;

    CONTINUE :: 1;

    WL_ITERATOR_STOP     :: STOP;

    WL_ITERATOR_CONTINUE :: CONTINUE;
}

wl_proxy :: struct {}

wl_display :: struct {}

wl_event_queue :: struct {}

wl_event_queue_destroy :: (queue: *wl_event_queue) -> void #foreign libwayland_client;

wl_proxy_marshal_flags :: (proxy: *wl_proxy, opcode: u32, _interface: *wl_interface, version: u32, flags: u32, __args: ..Any) -> *wl_proxy #foreign libwayland_client;

wl_proxy_marshal_array_flags :: (proxy: *wl_proxy, opcode: u32, _interface: *wl_interface, version: u32, flags: u32, args: *wl_argument) -> *wl_proxy #foreign libwayland_client;

wl_proxy_marshal :: (p: *wl_proxy, opcode: u32, __args: ..Any) -> void #foreign libwayland_client;

wl_proxy_marshal_array :: (p: *wl_proxy, opcode: u32, args: *wl_argument) -> void #foreign libwayland_client;

wl_proxy_create :: (factory: *wl_proxy, _interface: *wl_interface) -> *wl_proxy #foreign libwayland_client;

wl_proxy_create_wrapper :: (proxy: *void) -> *void #foreign libwayland_client;

wl_proxy_wrapper_destroy :: (proxy_wrapper: *void) -> void #foreign libwayland_client;

wl_proxy_marshal_constructor :: (proxy: *wl_proxy, opcode: u32, _interface: *wl_interface, __args: ..Any) -> *wl_proxy #foreign libwayland_client;

wl_proxy_marshal_constructor_versioned :: (proxy: *wl_proxy, opcode: u32, _interface: *wl_interface, version: u32, __args: ..Any) -> *wl_proxy #foreign libwayland_client;

wl_proxy_marshal_array_constructor :: (proxy: *wl_proxy, opcode: u32, args: *wl_argument, _interface: *wl_interface) -> *wl_proxy #foreign libwayland_client;

wl_proxy_marshal_array_constructor_versioned :: (proxy: *wl_proxy, opcode: u32, args: *wl_argument, _interface: *wl_interface, version: u32) -> *wl_proxy #foreign libwayland_client;

wl_proxy_destroy :: (proxy: *wl_proxy) -> void #foreign libwayland_client;

wl_proxy_add_listener :: (proxy: *wl_proxy, implementation: *#type () -> void #c_call, data: *void) -> s32 #foreign libwayland_client;

wl_proxy_get_listener :: (proxy: *wl_proxy) -> *void #foreign libwayland_client;

wl_proxy_add_dispatcher :: (proxy: *wl_proxy, dispatcher_func: wl_dispatcher_func_t, dispatcher_data: *void, data: *void) -> s32 #foreign libwayland_client;

wl_proxy_set_user_data :: (proxy: *wl_proxy, user_data: *void) -> void #foreign libwayland_client;

wl_proxy_get_user_data :: (proxy: *wl_proxy) -> *void #foreign libwayland_client;

wl_proxy_get_version :: (proxy: *wl_proxy) -> u32 #foreign libwayland_client;

wl_proxy_get_id :: (proxy: *wl_proxy) -> u32 #foreign libwayland_client;

wl_proxy_set_tag :: (proxy: *wl_proxy, tag: **u8) -> void #foreign libwayland_client;

wl_proxy_get_tag :: (proxy: *wl_proxy) -> **u8 #foreign libwayland_client;

wl_proxy_get_class :: (proxy: *wl_proxy) -> *u8 #foreign libwayland_client;

wl_proxy_set_queue :: (proxy: *wl_proxy, queue: *wl_event_queue) -> void #foreign libwayland_client;

wl_display_connect :: (name: *u8) -> *wl_display #foreign libwayland_client;

wl_display_connect_to_fd :: (fd: s32) -> *wl_display #foreign libwayland_client;

wl_display_disconnect :: (display: *wl_display) -> void #foreign libwayland_client;

wl_display_get_fd :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_dispatch :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_dispatch_queue :: (display: *wl_display, queue: *wl_event_queue) -> s32 #foreign libwayland_client;

wl_display_dispatch_queue_pending :: (display: *wl_display, queue: *wl_event_queue) -> s32 #foreign libwayland_client;

wl_display_dispatch_pending :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_get_error :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_get_protocol_error :: (display: *wl_display, _interface: **wl_interface, id: *u32) -> u32 #foreign libwayland_client;

wl_display_flush :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_roundtrip_queue :: (display: *wl_display, queue: *wl_event_queue) -> s32 #foreign libwayland_client;

wl_display_roundtrip :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_create_queue :: (display: *wl_display) -> *wl_event_queue #foreign libwayland_client;

wl_display_prepare_read_queue :: (display: *wl_display, queue: *wl_event_queue) -> s32 #foreign libwayland_client;

wl_display_prepare_read :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_display_cancel_read :: (display: *wl_display) -> void #foreign libwayland_client;

wl_display_read_events :: (display: *wl_display) -> s32 #foreign libwayland_client;

wl_log_set_handler_client :: (handler: wl_log_func_t) -> void #foreign libwayland_client;

wl_buffer :: struct {}
wl_callback :: struct {}
wl_compositor :: struct {}
wl_data_device :: struct {}
wl_data_device_manager :: struct {}
wl_data_offer :: struct {}
wl_data_source :: struct {}

wl_keyboard :: struct {}
/**
* @page page_xdg_shell The xdg_shell protocol
* @section page_ifaces_xdg_shell Interfaces
* - @subpage page_iface_xdg_wm_base - create desktop-style surfaces
* - @subpage page_iface_xdg_positioner - child surface positioner
* - @subpage page_iface_xdg_surface - desktop user interface surface base interface
* - @subpage page_iface_xdg_toplevel - toplevel surface
* - @subpage page_iface_xdg_popup - short-lived, popup surfaces for menus
* @section page_copyright_xdg_shell Copyright
* <pre>
*
* Copyright © 2008-2013 Kristian Høgsberg
* Copyright © 2013      Rafael Antognolli
* Copyright © 2013      Jasper St. Pierre
* Copyright © 2010-2013 Intel Corporation
* Copyright © 2015-2017 Samsung Electronics Co., Ltd
* Copyright © 2015-2017 Red Hat Inc.
*
* Permission is hereby granted, free of charge, to any person obtaining a
* copy of this software and associated documentation files (the "Software"),
* to deal in the Software without restriction, including without limitation
* the rights to use, copy, modify, merge, publish, distribute, sublicense,
* and/or sell copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice (including the next
* paragraph) shall be included in all copies or substantial portions of the
* Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
* DEALINGS IN THE SOFTWARE.
* </pre>
*/
wl_output :: struct {}
wl_pointer :: struct {}
wl_region :: struct {}
wl_registry :: struct {}
wl_seat :: struct {}
wl_shell :: struct {}
wl_shell_surface :: struct {}
wl_shm :: struct {}
wl_shm_pool :: struct {}
wl_subcompositor :: struct {}
wl_subsurface :: struct {}
wl_surface :: struct {}
wl_touch :: struct {}

wl_display_interface: wl_interface #elsewhere libwayland_client;

wl_registry_interface: wl_interface #elsewhere libwayland_client;

wl_callback_interface: wl_interface #elsewhere libwayland_client;

wl_compositor_interface: wl_interface #elsewhere libwayland_client;

wl_shm_pool_interface: wl_interface #elsewhere libwayland_client;

wl_shm_interface: wl_interface #elsewhere libwayland_client;

wl_buffer_interface: wl_interface #elsewhere libwayland_client;

wl_data_offer_interface: wl_interface #elsewhere libwayland_client;

wl_data_source_interface: wl_interface #elsewhere libwayland_client;

wl_data_device_interface: wl_interface #elsewhere libwayland_client;

wl_data_device_manager_interface: wl_interface #elsewhere libwayland_client;

wl_shell_interface: wl_interface #elsewhere libwayland_client;

wl_shell_surface_interface: wl_interface #elsewhere libwayland_client;

wl_surface_interface: wl_interface #elsewhere libwayland_client;

wl_seat_interface: wl_interface #elsewhere libwayland_client;

wl_pointer_interface: wl_interface #elsewhere libwayland_client;

wl_keyboard_interface: wl_interface #elsewhere libwayland_client;

wl_touch_interface: wl_interface #elsewhere libwayland_client;

wl_output_interface: wl_interface #elsewhere libwayland_client;

wl_region_interface: wl_interface #elsewhere libwayland_client;

wl_subcompositor_interface: wl_interface #elsewhere libwayland_client;

wl_subsurface_interface: wl_interface #elsewhere libwayland_client;

wl_display_error :: enum u32 {
    INVALID_OBJECT :: 0;

    INVALID_METHOD :: 1;

    NO_MEMORY      :: 2;

    IMPLEMENTATION :: 3;

    WL_DISPLAY_ERROR_INVALID_OBJECT :: INVALID_OBJECT;

    WL_DISPLAY_ERROR_INVALID_METHOD :: INVALID_METHOD;

    WL_DISPLAY_ERROR_NO_MEMORY      :: NO_MEMORY;

    WL_DISPLAY_ERROR_IMPLEMENTATION :: IMPLEMENTATION;
}

wl_display_listener :: struct {
    error:     #type (data: *void, wl_display_: *wl_display, object_id: *void, code: u32, message: *u8) -> void #c_call;

    delete_id: #type (data: *void, wl_display_: *wl_display, id: u32) -> void #c_call;
}

wl_registry_listener :: struct {
    global:        #type (data: *void, wl_registry_: *wl_registry, name: u32, _interface: *u8, version: u32) -> void #c_call;

    global_remove: #type (data: *void, wl_registry_: *wl_registry, name: u32) -> void #c_call;
}

wl_callback_listener :: struct {
    done: #type (data: *void, wl_callback_: *wl_callback, callback_data: u32) -> void #c_call;
}

wl_shm_error :: enum u32 {
    FORMAT :: 0;

    STRIDE :: 1;

    FD     :: 2;

    WL_SHM_ERROR_INVALID_FORMAT :: FORMAT;

    WL_SHM_ERROR_INVALID_STRIDE :: STRIDE;

    WL_SHM_ERROR_INVALID_FD     :: FD;
}

wl_shm_format :: enum u32 {
    ARGB8888             :: 0;

    XRGB8888             :: 1;

    C8                   :: 538982467;

    RGB332               :: 943867730;

    BGR233               :: 944916290;

    XRGB4444             :: 842093144;

    XBGR4444             :: 842089048;

    RGBX4444             :: 842094674;

    BGRX4444             :: 842094658;

    ARGB4444             :: 842093121;

    ABGR4444             :: 842089025;

    RGBA4444             :: 842088786;

    BGRA4444             :: 842088770;

    XRGB1555             :: 892424792;

    XBGR1555             :: 892420696;

    RGBX5551             :: 892426322;

    BGRX5551             :: 892426306;

    ARGB1555             :: 892424769;

    ABGR1555             :: 892420673;

    RGBA5551             :: 892420434;

    BGRA5551             :: 892420418;

    RGB565               :: 909199186;

    BGR565               :: 909199170;

    RGB888               :: 875710290;

    BGR888               :: 875710274;

    XBGR8888             :: 875709016;

    RGBX8888             :: 875714642;

    BGRX8888             :: 875714626;

    ABGR8888             :: 875708993;

    RGBA8888             :: 875708754;

    BGRA8888             :: 875708738;

    XRGB2101010          :: 808669784;

    XBGR2101010          :: 808665688;

    RGBX1010102          :: 808671314;

    BGRX1010102          :: 808671298;

    ARGB2101010          :: 808669761;

    ABGR2101010          :: 808665665;

    RGBA1010102          :: 808665426;

    BGRA1010102          :: 808665410;

    YUYV                 :: 1448695129;

    YVYU                 :: 1431918169;

    UYVY                 :: 1498831189;

    VYUY                 :: 1498765654;

    AYUV                 :: 1448433985;

    NV12                 :: 842094158;

    NV21                 :: 825382478;

    NV16                 :: 909203022;

    NV61                 :: 825644622;

    YUV410               :: 961959257;

    YVU410               :: 961893977;

    YUV411               :: 825316697;

    YVU411               :: 825316953;

    YUV420               :: 842093913;

    YVU420               :: 842094169;

    YUV422               :: 909202777;

    YVU422               :: 909203033;

    YUV444               :: 875713881;

    YVU444               :: 875714137;

    R8                   :: 538982482;

    R16                  :: 540422482;

    RG88                 :: 943212370;

    GR88                 :: 943215175;

    RG1616               :: 842221394;

    GR1616               :: 842224199;

    XRGB16161616F        :: 1211388504;

    XBGR16161616F        :: 1211384408;

    ARGB16161616F        :: 1211388481;

    ABGR16161616F        :: 1211384385;

    XYUV8888             :: 1448434008;

    VUY888               :: 875713878;

    VUY101010            :: 808670550;

    Y210                 :: 808530521;

    Y212                 :: 842084953;

    Y216                 :: 909193817;

    Y410                 :: 808531033;

    Y412                 :: 842085465;

    Y416                 :: 909194329;

    XVYU2101010          :: 808670808;

    XVYU12_16161616      :: 909334104;

    XVYU16161616         :: 942954072;

    Y0L0                 :: 810299481;

    X0L0                 :: 810299480;

    Y0L2                 :: 843853913;

    X0L2                 :: 843853912;
    YUV420_8BIT          :: 942691673;
    YUV420_10BIT         :: 808539481;
    XRGB8888_A8          :: 943805016;
    XBGR8888_A8          :: 943800920;
    RGBX8888_A8          :: 943806546;
    BGRX8888_A8          :: 943806530;
    RGB888_A8            :: 943798354;
    BGR888_A8            :: 943798338;
    RGB565_A8            :: 943797586;
    BGR565_A8            :: 943797570;

    NV24                 :: 875714126;

    NV42                 :: 842290766;

    P210                 :: 808530512;

    P010                 :: 808530000;

    P012                 :: 842084432;

    P016                 :: 909193296;

    AXBXGXRX106106106106 :: 808534593;

    NV15                 :: 892425806;
    Q410                 :: 808531025;
    Q401                 :: 825242705;

    XRGB16161616         :: 942953048;

    XBGR16161616         :: 942948952;

    ARGB16161616         :: 942953025;

    ABGR16161616         :: 942948929;

    WL_SHM_FORMAT_ARGB8888             :: ARGB8888;

    WL_SHM_FORMAT_XRGB8888             :: XRGB8888;

    WL_SHM_FORMAT_C8                   :: C8;

    WL_SHM_FORMAT_RGB332               :: RGB332;

    WL_SHM_FORMAT_BGR233               :: BGR233;

    WL_SHM_FORMAT_XRGB4444             :: XRGB4444;

    WL_SHM_FORMAT_XBGR4444             :: XBGR4444;

    WL_SHM_FORMAT_RGBX4444             :: RGBX4444;

    WL_SHM_FORMAT_BGRX4444             :: BGRX4444;

    WL_SHM_FORMAT_ARGB4444             :: ARGB4444;

    WL_SHM_FORMAT_ABGR4444             :: ABGR4444;

    WL_SHM_FORMAT_RGBA4444             :: RGBA4444;

    WL_SHM_FORMAT_BGRA4444             :: BGRA4444;

    WL_SHM_FORMAT_XRGB1555             :: XRGB1555;

    WL_SHM_FORMAT_XBGR1555             :: XBGR1555;

    WL_SHM_FORMAT_RGBX5551             :: RGBX5551;

    WL_SHM_FORMAT_BGRX5551             :: BGRX5551;

    WL_SHM_FORMAT_ARGB1555             :: ARGB1555;

    WL_SHM_FORMAT_ABGR1555             :: ABGR1555;

    WL_SHM_FORMAT_RGBA5551             :: RGBA5551;

    WL_SHM_FORMAT_BGRA5551             :: BGRA5551;

    WL_SHM_FORMAT_RGB565               :: RGB565;

    WL_SHM_FORMAT_BGR565               :: BGR565;

    WL_SHM_FORMAT_RGB888               :: RGB888;

    WL_SHM_FORMAT_BGR888               :: BGR888;

    WL_SHM_FORMAT_XBGR8888             :: XBGR8888;

    WL_SHM_FORMAT_RGBX8888             :: RGBX8888;

    WL_SHM_FORMAT_BGRX8888             :: BGRX8888;

    WL_SHM_FORMAT_ABGR8888             :: ABGR8888;

    WL_SHM_FORMAT_RGBA8888             :: RGBA8888;

    WL_SHM_FORMAT_BGRA8888             :: BGRA8888;

    WL_SHM_FORMAT_XRGB2101010          :: XRGB2101010;

    WL_SHM_FORMAT_XBGR2101010          :: XBGR2101010;

    WL_SHM_FORMAT_RGBX1010102          :: RGBX1010102;

    WL_SHM_FORMAT_BGRX1010102          :: BGRX1010102;

    WL_SHM_FORMAT_ARGB2101010          :: ARGB2101010;

    WL_SHM_FORMAT_ABGR2101010          :: ABGR2101010;

    WL_SHM_FORMAT_RGBA1010102          :: RGBA1010102;

    WL_SHM_FORMAT_BGRA1010102          :: BGRA1010102;

    WL_SHM_FORMAT_YUYV                 :: YUYV;

    WL_SHM_FORMAT_YVYU                 :: YVYU;

    WL_SHM_FORMAT_UYVY                 :: UYVY;

    WL_SHM_FORMAT_VYUY                 :: VYUY;

    WL_SHM_FORMAT_AYUV                 :: AYUV;

    WL_SHM_FORMAT_NV12                 :: NV12;

    WL_SHM_FORMAT_NV21                 :: NV21;

    WL_SHM_FORMAT_NV16                 :: NV16;

    WL_SHM_FORMAT_NV61                 :: NV61;

    WL_SHM_FORMAT_YUV410               :: YUV410;

    WL_SHM_FORMAT_YVU410               :: YVU410;

    WL_SHM_FORMAT_YUV411               :: YUV411;

    WL_SHM_FORMAT_YVU411               :: YVU411;

    WL_SHM_FORMAT_YUV420               :: YUV420;

    WL_SHM_FORMAT_YVU420               :: YVU420;

    WL_SHM_FORMAT_YUV422               :: YUV422;

    WL_SHM_FORMAT_YVU422               :: YVU422;

    WL_SHM_FORMAT_YUV444               :: YUV444;

    WL_SHM_FORMAT_YVU444               :: YVU444;

    WL_SHM_FORMAT_R8                   :: R8;

    WL_SHM_FORMAT_R16                  :: R16;

    WL_SHM_FORMAT_RG88                 :: RG88;

    WL_SHM_FORMAT_GR88                 :: GR88;

    WL_SHM_FORMAT_RG1616               :: RG1616;

    WL_SHM_FORMAT_GR1616               :: GR1616;

    WL_SHM_FORMAT_XRGB16161616F        :: XRGB16161616F;

    WL_SHM_FORMAT_XBGR16161616F        :: XBGR16161616F;

    WL_SHM_FORMAT_ARGB16161616F        :: ARGB16161616F;

    WL_SHM_FORMAT_ABGR16161616F        :: ABGR16161616F;

    WL_SHM_FORMAT_XYUV8888             :: XYUV8888;

    WL_SHM_FORMAT_VUY888               :: VUY888;

    WL_SHM_FORMAT_VUY101010            :: VUY101010;

    WL_SHM_FORMAT_Y210                 :: Y210;

    WL_SHM_FORMAT_Y212                 :: Y212;

    WL_SHM_FORMAT_Y216                 :: Y216;

    WL_SHM_FORMAT_Y410                 :: Y410;

    WL_SHM_FORMAT_Y412                 :: Y412;

    WL_SHM_FORMAT_Y416                 :: Y416;

    WL_SHM_FORMAT_XVYU2101010          :: XVYU2101010;

    WL_SHM_FORMAT_XVYU12_16161616      :: XVYU12_16161616;

    WL_SHM_FORMAT_XVYU16161616         :: XVYU16161616;

    WL_SHM_FORMAT_Y0L0                 :: Y0L0;

    WL_SHM_FORMAT_X0L0                 :: X0L0;

    WL_SHM_FORMAT_Y0L2                 :: Y0L2;

    WL_SHM_FORMAT_X0L2                 :: X0L2;
    WL_SHM_FORMAT_YUV420_8BIT          :: YUV420_8BIT;
    WL_SHM_FORMAT_YUV420_10BIT         :: YUV420_10BIT;
    WL_SHM_FORMAT_XRGB8888_A8          :: XRGB8888_A8;
    WL_SHM_FORMAT_XBGR8888_A8          :: XBGR8888_A8;
    WL_SHM_FORMAT_RGBX8888_A8          :: RGBX8888_A8;
    WL_SHM_FORMAT_BGRX8888_A8          :: BGRX8888_A8;
    WL_SHM_FORMAT_RGB888_A8            :: RGB888_A8;
    WL_SHM_FORMAT_BGR888_A8            :: BGR888_A8;
    WL_SHM_FORMAT_RGB565_A8            :: RGB565_A8;
    WL_SHM_FORMAT_BGR565_A8            :: BGR565_A8;

    WL_SHM_FORMAT_NV24                 :: NV24;

    WL_SHM_FORMAT_NV42                 :: NV42;

    WL_SHM_FORMAT_P210                 :: P210;

    WL_SHM_FORMAT_P010                 :: P010;

    WL_SHM_FORMAT_P012                 :: P012;

    WL_SHM_FORMAT_P016                 :: P016;

    WL_SHM_FORMAT_AXBXGXRX106106106106 :: AXBXGXRX106106106106;

    WL_SHM_FORMAT_NV15                 :: NV15;
    WL_SHM_FORMAT_Q410                 :: Q410;
    WL_SHM_FORMAT_Q401                 :: Q401;

    WL_SHM_FORMAT_XRGB16161616         :: XRGB16161616;

    WL_SHM_FORMAT_XBGR16161616         :: XBGR16161616;

    WL_SHM_FORMAT_ARGB16161616         :: ARGB16161616;

    WL_SHM_FORMAT_ABGR16161616         :: ABGR16161616;
}

wl_shm_listener :: struct {
    format: #type (data: *void, wl_shm_: *wl_shm, format: u32) -> void #c_call;
}

wl_buffer_listener :: struct {
    release: #type (data: *void, wl_buffer_: *wl_buffer) -> void #c_call;
}

wl_data_offer_error :: enum u32 {
    FINISH      :: 0;

    ACTION_MASK :: 1;

    ACTION      :: 2;

    OFFER       :: 3;

    WL_DATA_OFFER_ERROR_INVALID_FINISH      :: FINISH;

    WL_DATA_OFFER_ERROR_INVALID_ACTION_MASK :: ACTION_MASK;

    WL_DATA_OFFER_ERROR_INVALID_ACTION      :: ACTION;

    WL_DATA_OFFER_ERROR_INVALID_OFFER       :: OFFER;
}

wl_data_offer_listener :: struct {
    offer:          #type (data: *void, wl_data_offer_: *wl_data_offer, mime_type: *u8) -> void #c_call;

    source_actions: #type (data: *void, wl_data_offer_: *wl_data_offer, source_actions: u32) -> void #c_call;

    action:         #type (data: *void, wl_data_offer_: *wl_data_offer, dnd_action: u32) -> void #c_call;
}

wl_data_source_error :: enum u32 {
    ACTION_MASK :: 0;

    SOURCE      :: 1;

    WL_DATA_SOURCE_ERROR_INVALID_ACTION_MASK :: ACTION_MASK;

    WL_DATA_SOURCE_ERROR_INVALID_SOURCE      :: SOURCE;
}

wl_data_source_listener :: struct {
    target:             #type (data: *void, wl_data_source_: *wl_data_source, mime_type: *u8) -> void #c_call;

    send:               #type (data: *void, wl_data_source_: *wl_data_source, mime_type: *u8, fd: s32) -> void #c_call;

    cancelled:          #type (data: *void, wl_data_source_: *wl_data_source) -> void #c_call;

    dnd_drop_performed: #type (data: *void, wl_data_source_: *wl_data_source) -> void #c_call;

    dnd_finished:       #type (data: *void, wl_data_source_: *wl_data_source) -> void #c_call;

    action:             #type (data: *void, wl_data_source_: *wl_data_source, dnd_action: u32) -> void #c_call;
}

wl_data_device_error :: enum u32 {
    WL_DATA_DEVICE_ERROR_ROLE :: 0;
}

wl_data_device_listener :: struct {
    data_offer: #type (data: *void, wl_data_device_: *wl_data_device, id: *wl_data_offer) -> void #c_call;

    enter:      #type (data: *void, wl_data_device_: *wl_data_device, serial: u32, surface: *wl_surface, x: wl_fixed_t, y: wl_fixed_t, id: *wl_data_offer) -> void #c_call;

    leave:      #type (data: *void, wl_data_device_: *wl_data_device) -> void #c_call;

    motion:     #type (data: *void, wl_data_device_: *wl_data_device, time: u32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;

    drop:       #type (data: *void, wl_data_device_: *wl_data_device) -> void #c_call;

    selection:  #type (data: *void, wl_data_device_: *wl_data_device, id: *wl_data_offer) -> void #c_call;
}

wl_data_device_manager_dnd_action :: enum u32 {
    NONE :: 0;

    COPY :: 1;

    MOVE :: 2;

    ASK  :: 4;

    WL_DATA_DEVICE_MANAGER_DND_ACTION_NONE :: NONE;

    WL_DATA_DEVICE_MANAGER_DND_ACTION_COPY :: COPY;

    WL_DATA_DEVICE_MANAGER_DND_ACTION_MOVE :: MOVE;

    WL_DATA_DEVICE_MANAGER_DND_ACTION_ASK  :: ASK;
}

wl_shell_error :: enum u32 {
    WL_SHELL_ERROR_ROLE :: 0;
}

wl_shell_surface_resize :: enum u32 {
    NONE         :: 0;

    TOP          :: 1;

    BOTTOM       :: 2;

    LEFT         :: 4;

    TOP_LEFT     :: 5;

    BOTTOM_LEFT  :: 6;

    RIGHT        :: 8;

    TOP_RIGHT    :: 9;

    BOTTOM_RIGHT :: 10;

    WL_SHELL_SURFACE_RESIZE_NONE         :: NONE;

    WL_SHELL_SURFACE_RESIZE_TOP          :: TOP;

    WL_SHELL_SURFACE_RESIZE_BOTTOM       :: BOTTOM;

    WL_SHELL_SURFACE_RESIZE_LEFT         :: LEFT;

    WL_SHELL_SURFACE_RESIZE_TOP_LEFT     :: TOP_LEFT;

    WL_SHELL_SURFACE_RESIZE_BOTTOM_LEFT  :: BOTTOM_LEFT;

    WL_SHELL_SURFACE_RESIZE_RIGHT        :: RIGHT;

    WL_SHELL_SURFACE_RESIZE_TOP_RIGHT    :: TOP_RIGHT;

    WL_SHELL_SURFACE_RESIZE_BOTTOM_RIGHT :: BOTTOM_RIGHT;
}

wl_shell_surface_transient :: enum u32 {
    WL_SHELL_SURFACE_TRANSIENT_INACTIVE :: 1;
}

wl_shell_surface_fullscreen_method :: enum u32 {
    DEFAULT :: 0;

    SCALE   :: 1;

    DRIVER  :: 2;

    FILL    :: 3;

    WL_SHELL_SURFACE_FULLSCREEN_METHOD_DEFAULT :: DEFAULT;

    WL_SHELL_SURFACE_FULLSCREEN_METHOD_SCALE   :: SCALE;

    WL_SHELL_SURFACE_FULLSCREEN_METHOD_DRIVER  :: DRIVER;

    WL_SHELL_SURFACE_FULLSCREEN_METHOD_FILL    :: FILL;
}

wl_shell_surface_listener :: struct {
    ping:       #type (data: *void, wl_shell_surface_: *wl_shell_surface, serial: u32) -> void #c_call;

    configure:  #type (data: *void, wl_shell_surface_: *wl_shell_surface, edges: u32, width: s32, height: s32) -> void #c_call;

    popup_done: #type (data: *void, wl_shell_surface_: *wl_shell_surface) -> void #c_call;
}

wl_surface_error :: enum u32 {
    INVALID_SCALE       :: 0;

    INVALID_TRANSFORM   :: 1;

    INVALID_SIZE        :: 2;

    INVALID_OFFSET      :: 3;

    DEFUNCT_ROLE_OBJECT :: 4;

    WL_SURFACE_ERROR_INVALID_SCALE       :: INVALID_SCALE;

    WL_SURFACE_ERROR_INVALID_TRANSFORM   :: INVALID_TRANSFORM;

    WL_SURFACE_ERROR_INVALID_SIZE        :: INVALID_SIZE;

    WL_SURFACE_ERROR_INVALID_OFFSET      :: INVALID_OFFSET;

    WL_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT :: DEFUNCT_ROLE_OBJECT;
}

wl_surface_listener :: struct {
    enter:                      #type (data: *void, wl_surface_: *wl_surface, output: *wl_output) -> void #c_call;

    leave:                      #type (data: *void, wl_surface_: *wl_surface, output: *wl_output) -> void #c_call;

    preferred_buffer_scale:     #type (data: *void, wl_surface_: *wl_surface, factor: s32) -> void #c_call;

    preferred_buffer_transform: #type (data: *void, wl_surface_: *wl_surface, transform: u32) -> void #c_call;
}

wl_seat_capability :: enum u32 {
    POINTER  :: 1;

    KEYBOARD :: 2;

    TOUCH    :: 4;

    WL_SEAT_CAPABILITY_POINTER  :: POINTER;

    WL_SEAT_CAPABILITY_KEYBOARD :: KEYBOARD;

    WL_SEAT_CAPABILITY_TOUCH    :: TOUCH;
}

wl_seat_error :: enum u32 {
    WL_SEAT_ERROR_MISSING_CAPABILITY :: 0;
}

wl_seat_listener :: struct {
    capabilities: #type (data: *void, wl_seat_: *wl_seat, capabilities: u32) -> void #c_call;

    name:         #type (data: *void, wl_seat_: *wl_seat, name: *u8) -> void #c_call;
}

wl_pointer_error :: enum u32 {
    WL_POINTER_ERROR_ROLE :: 0;
}

wl_pointer_button_state :: enum u32 {
    RELEASED :: 0;

    PRESSED  :: 1;

    WL_POINTER_BUTTON_STATE_RELEASED :: RELEASED;

    WL_POINTER_BUTTON_STATE_PRESSED  :: PRESSED;
}

wl_pointer_axis :: enum u32 {
    VERTICAL_SCROLL   :: 0;

    HORIZONTAL_SCROLL :: 1;

    WL_POINTER_AXIS_VERTICAL_SCROLL   :: VERTICAL_SCROLL;

    WL_POINTER_AXIS_HORIZONTAL_SCROLL :: HORIZONTAL_SCROLL;
}

wl_pointer_axis_source :: enum u32 {
    WHEEL      :: 0;

    FINGER     :: 1;

    CONTINUOUS :: 2;

    WHEEL_TILT :: 3;

    WL_POINTER_AXIS_SOURCE_WHEEL      :: WHEEL;

    WL_POINTER_AXIS_SOURCE_FINGER     :: FINGER;

    WL_POINTER_AXIS_SOURCE_CONTINUOUS :: CONTINUOUS;

    WL_POINTER_AXIS_SOURCE_WHEEL_TILT :: WHEEL_TILT;
}

wl_pointer_axis_relative_direction :: enum u32 {
    IDENTICAL :: 0;

    INVERTED  :: 1;

    WL_POINTER_AXIS_RELATIVE_DIRECTION_IDENTICAL :: IDENTICAL;

    WL_POINTER_AXIS_RELATIVE_DIRECTION_INVERTED  :: INVERTED;
}

wl_pointer_listener :: struct {
    enter:                   #type (data: *void, wl_pointer_: *wl_pointer, serial: u32, surface: *wl_surface, surface_x: wl_fixed_t, surface_y: wl_fixed_t) -> void #c_call;

    leave:                   #type (data: *void, wl_pointer_: *wl_pointer, serial: u32, surface: *wl_surface) -> void #c_call;

    motion:                  #type (data: *void, wl_pointer_: *wl_pointer, time: u32, surface_x: wl_fixed_t, surface_y: wl_fixed_t) -> void #c_call;

    button:                  #type (data: *void, wl_pointer_: *wl_pointer, serial: u32, time: u32, button: u32, state: u32) -> void #c_call;

    axis:                    #type (data: *void, wl_pointer_: *wl_pointer, time: u32, axis: u32, value: wl_fixed_t) -> void #c_call;

    frame:                   #type (data: *void, wl_pointer_: *wl_pointer) -> void #c_call;

    axis_source:             #type (data: *void, wl_pointer_: *wl_pointer, axis_source: u32) -> void #c_call;

    axis_stop:               #type (data: *void, wl_pointer_: *wl_pointer, time: u32, axis: u32) -> void #c_call;

    axis_discrete:           #type (data: *void, wl_pointer_: *wl_pointer, axis: u32, discrete: s32) -> void #c_call;

    axis_value120:           #type (data: *void, wl_pointer_: *wl_pointer, axis: u32, value120: s32) -> void #c_call;

    axis_relative_direction: #type (data: *void, wl_pointer_: *wl_pointer, axis: u32, direction: u32) -> void #c_call;
}

wl_keyboard_keymap_format :: enum u32 {
    NO_KEYMAP :: 0;

    XKB_V1    :: 1;

    WL_KEYBOARD_KEYMAP_FORMAT_NO_KEYMAP :: NO_KEYMAP;

    WL_KEYBOARD_KEYMAP_FORMAT_XKB_V1    :: XKB_V1;
}

wl_keyboard_key_state :: enum u32 {
    RELEASED :: 0;

    PRESSED  :: 1;

    WL_KEYBOARD_KEY_STATE_RELEASED :: RELEASED;

    WL_KEYBOARD_KEY_STATE_PRESSED  :: PRESSED;
}

wl_keyboard_listener :: struct {
    keymap:      #type (data: *void, wl_keyboard_: *wl_keyboard, format: u32, fd: s32, size: u32) -> void #c_call;

    enter:       #type (data: *void, wl_keyboard_: *wl_keyboard, serial: u32, surface: *wl_surface, keys: *wl_array) -> void #c_call;

    leave:       #type (data: *void, wl_keyboard_: *wl_keyboard, serial: u32, surface: *wl_surface) -> void #c_call;

    key:         #type (data: *void, wl_keyboard_: *wl_keyboard, serial: u32, time: u32, key: u32, state: u32) -> void #c_call;

    modifiers:   #type (data: *void, wl_keyboard_: *wl_keyboard, serial: u32, mods_depressed: u32, mods_latched: u32, mods_locked: u32, group: u32) -> void #c_call;

    repeat_info: #type (data: *void, wl_keyboard_: *wl_keyboard, rate: s32, delay: s32) -> void #c_call;
}

wl_touch_listener :: struct {
    down:        #type (data: *void, wl_touch_: *wl_touch, serial: u32, time: u32, surface: *wl_surface, id: s32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;

    up:          #type (data: *void, wl_touch_: *wl_touch, serial: u32, time: u32, id: s32) -> void #c_call;

    motion:      #type (data: *void, wl_touch_: *wl_touch, time: u32, id: s32, x: wl_fixed_t, y: wl_fixed_t) -> void #c_call;

    frame:       #type (data: *void, wl_touch_: *wl_touch) -> void #c_call;

    cancel:      #type (data: *void, wl_touch_: *wl_touch) -> void #c_call;

    shape:       #type (data: *void, wl_touch_: *wl_touch, id: s32, major: wl_fixed_t, minor: wl_fixed_t) -> void #c_call;

    orientation: #type (data: *void, wl_touch_: *wl_touch, id: s32, orientation: wl_fixed_t) -> void #c_call;
}

wl_output_subpixel :: enum u32 {
    UNKNOWN        :: 0;

    NONE           :: 1;

    HORIZONTAL_RGB :: 2;

    HORIZONTAL_BGR :: 3;

    VERTICAL_RGB   :: 4;

    VERTICAL_BGR   :: 5;

    WL_OUTPUT_SUBPIXEL_UNKNOWN        :: UNKNOWN;

    WL_OUTPUT_SUBPIXEL_NONE           :: NONE;

    WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB :: HORIZONTAL_RGB;

    WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR :: HORIZONTAL_BGR;

    WL_OUTPUT_SUBPIXEL_VERTICAL_RGB   :: VERTICAL_RGB;

    WL_OUTPUT_SUBPIXEL_VERTICAL_BGR   :: VERTICAL_BGR;
}

wl_output_transform :: enum u32 {
    NORMAL      :: 0;

    _90         :: 1;

    _180        :: 2;

    _270        :: 3;

    FLIPPED     :: 4;

    FLIPPED_90  :: 5;

    FLIPPED_180 :: 6;

    FLIPPED_270 :: 7;

    WL_OUTPUT_TRANSFORM_NORMAL      :: NORMAL;

    WL_OUTPUT_TRANSFORM_90          :: _90;

    WL_OUTPUT_TRANSFORM_180         :: _180;

    WL_OUTPUT_TRANSFORM_270         :: _270;

    WL_OUTPUT_TRANSFORM_FLIPPED     :: FLIPPED;

    WL_OUTPUT_TRANSFORM_FLIPPED_90  :: FLIPPED_90;

    WL_OUTPUT_TRANSFORM_FLIPPED_180 :: FLIPPED_180;

    WL_OUTPUT_TRANSFORM_FLIPPED_270 :: FLIPPED_270;
}

wl_output_mode :: enum u32 {
    CURRENT   :: 1;

    PREFERRED :: 2;

    WL_OUTPUT_MODE_CURRENT   :: CURRENT;

    WL_OUTPUT_MODE_PREFERRED :: PREFERRED;
}

wl_output_listener :: struct {
    geometry:    #type (data: *void, wl_output_: *wl_output, x: s32, y: s32, physical_width: s32, physical_height: s32, subpixel: s32, make: *u8, model: *u8, transform: s32) -> void #c_call;

    mode:        #type (data: *void, wl_output_: *wl_output, flags: u32, width: s32, height: s32, refresh: s32) -> void #c_call;

    done:        #type (data: *void, wl_output_: *wl_output) -> void #c_call;

    scale:       #type (data: *void, wl_output_: *wl_output, factor: s32) -> void #c_call;

    name:        #type (data: *void, wl_output_: *wl_output, name: *u8) -> void #c_call;

    description: #type (data: *void, wl_output_: *wl_output, description: *u8) -> void #c_call;
}

wl_subcompositor_error :: enum u32 {
    SURFACE :: 0;

    PARENT  :: 1;

    WL_SUBCOMPOSITOR_ERROR_BAD_SURFACE :: SURFACE;

    WL_SUBCOMPOSITOR_ERROR_BAD_PARENT  :: PARENT;
}

wl_subsurface_error :: enum u32 {
    WL_SUBSURFACE_ERROR_BAD_SURFACE :: 0;
}

xdg_popup :: struct {}
xdg_positioner :: struct {}
xdg_surface :: struct {}
/**
* @page page_xdg_decoration_unstable_v1 The xdg_decoration_unstable_v1 protocol
* @section page_ifaces_xdg_decoration_unstable_v1 Interfaces
* - @subpage page_iface_zxdg_decoration_manager_v1 - window decoration manager
* - @subpage page_iface_zxdg_toplevel_decoration_v1 - decoration object for a toplevel surface
* @section page_copyright_xdg_decoration_unstable_v1 Copyright
* <pre>
*
* Copyright © 2018 Simon Ser
*
* Permission is hereby granted, free of charge, to any person obtaining a
* copy of this software and associated documentation files (the "Software"),
* to deal in the Software without restriction, including without limitation
* the rights to use, copy, modify, merge, publish, distribute, sublicense,
* and/or sell copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice (including the next
* paragraph) shall be included in all copies or substantial portions of the
* Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
* DEALINGS IN THE SOFTWARE.
* </pre>
*/
xdg_toplevel :: struct {}
xdg_wm_base :: struct {}

xdg_wm_base_error :: enum u32 {
    ROLE                  :: 0;

    DEFUNCT_SURFACES      :: 1;

    NOT_THE_TOPMOST_POPUP :: 2;

    INVALID_POPUP_PARENT  :: 3;

    INVALID_SURFACE_STATE :: 4;

    INVALID_POSITIONER    :: 5;

    UNRESPONSIVE          :: 6;

    XDG_WM_BASE_ERROR_ROLE                  :: ROLE;

    XDG_WM_BASE_ERROR_DEFUNCT_SURFACES      :: DEFUNCT_SURFACES;

    XDG_WM_BASE_ERROR_NOT_THE_TOPMOST_POPUP :: NOT_THE_TOPMOST_POPUP;

    XDG_WM_BASE_ERROR_INVALID_POPUP_PARENT  :: INVALID_POPUP_PARENT;

    XDG_WM_BASE_ERROR_INVALID_SURFACE_STATE :: INVALID_SURFACE_STATE;

    XDG_WM_BASE_ERROR_INVALID_POSITIONER    :: INVALID_POSITIONER;

    XDG_WM_BASE_ERROR_UNRESPONSIVE          :: UNRESPONSIVE;
}

/**
* @ingroup iface_xdg_wm_base
* @struct xdg_wm_base_listener
*/
xdg_wm_base_listener :: struct {
    /**
    * check if the client is alive
    *
    * The ping event asks the client if it's still alive. Pass the
    * serial specified in the event back to the compositor by sending
    * a "pong" request back with the specified serial. See
    * xdg_wm_base.pong.
    *
    * Compositors can use this to determine if the client is still
    * alive. It's unspecified what will happen if the client doesn't
    * respond to the ping request, or in what timeframe. Clients
    * should try to respond in a reasonable amount of time. The
    * “unresponsive” error is provided for compositors that wish
    * to disconnect unresponsive clients.
    *
    * A compositor is free to ping in any way it wants, but a client
    * must always respond to any xdg_wm_base object it created.
    * @param serial pass this to the pong request
    */
    ping: #type (data: *void, xdg_wm_base_: *xdg_wm_base, serial: u32) -> void #c_call;
}

xdg_positioner_error :: enum u32 {
    XDG_POSITIONER_ERROR_INVALID_INPUT :: 0;
}

xdg_positioner_anchor :: enum u32 {
    NONE         :: 0;
    TOP          :: 1;
    BOTTOM       :: 2;
    LEFT         :: 3;
    RIGHT        :: 4;
    TOP_LEFT     :: 5;
    BOTTOM_LEFT  :: 6;
    TOP_RIGHT    :: 7;
    BOTTOM_RIGHT :: 8;

    XDG_POSITIONER_ANCHOR_NONE         :: NONE;
    XDG_POSITIONER_ANCHOR_TOP          :: TOP;
    XDG_POSITIONER_ANCHOR_BOTTOM       :: BOTTOM;
    XDG_POSITIONER_ANCHOR_LEFT         :: LEFT;
    XDG_POSITIONER_ANCHOR_RIGHT        :: RIGHT;
    XDG_POSITIONER_ANCHOR_TOP_LEFT     :: TOP_LEFT;
    XDG_POSITIONER_ANCHOR_BOTTOM_LEFT  :: BOTTOM_LEFT;
    XDG_POSITIONER_ANCHOR_TOP_RIGHT    :: TOP_RIGHT;
    XDG_POSITIONER_ANCHOR_BOTTOM_RIGHT :: BOTTOM_RIGHT;
}

xdg_positioner_gravity :: enum u32 {
    NONE         :: 0;
    TOP          :: 1;
    BOTTOM       :: 2;
    LEFT         :: 3;
    RIGHT        :: 4;
    TOP_LEFT     :: 5;
    BOTTOM_LEFT  :: 6;
    TOP_RIGHT    :: 7;
    BOTTOM_RIGHT :: 8;

    XDG_POSITIONER_GRAVITY_NONE         :: NONE;
    XDG_POSITIONER_GRAVITY_TOP          :: TOP;
    XDG_POSITIONER_GRAVITY_BOTTOM       :: BOTTOM;
    XDG_POSITIONER_GRAVITY_LEFT         :: LEFT;
    XDG_POSITIONER_GRAVITY_RIGHT        :: RIGHT;
    XDG_POSITIONER_GRAVITY_TOP_LEFT     :: TOP_LEFT;
    XDG_POSITIONER_GRAVITY_BOTTOM_LEFT  :: BOTTOM_LEFT;
    XDG_POSITIONER_GRAVITY_TOP_RIGHT    :: TOP_RIGHT;
    XDG_POSITIONER_GRAVITY_BOTTOM_RIGHT :: BOTTOM_RIGHT;
}

/**
* @ingroup iface_xdg_positioner
* constraint adjustments
*
* The constraint adjustment value define ways the compositor will adjust
* the position of the surface, if the unadjusted position would result
* in the surface being partly constrained.
*
* Whether a surface is considered 'constrained' is left to the compositor
* to determine. For example, the surface may be partly outside the
* compositor's defined 'work area', thus necessitating the child surface's
* position be adjusted until it is entirely inside the work area.
*
* The adjustments can be combined, according to a defined precedence: 1)
* Flip, 2) Slide, 3) Resize.
*/
xdg_positioner_constraint_adjustment :: enum u32 {
    NONE     :: 0;

    SLIDE_X  :: 1;

    SLIDE_Y  :: 2;

    FLIP_X   :: 4;

    FLIP_Y   :: 8;

    RESIZE_X :: 16;

    RESIZE_Y :: 32;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_NONE     :: NONE;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_X  :: SLIDE_X;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_SLIDE_Y  :: SLIDE_Y;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_X   :: FLIP_X;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_FLIP_Y   :: FLIP_Y;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_X :: RESIZE_X;

    XDG_POSITIONER_CONSTRAINT_ADJUSTMENT_RESIZE_Y :: RESIZE_Y;
}

xdg_surface_error :: enum u32 {
    NOT_CONSTRUCTED     :: 1;

    ALREADY_CONSTRUCTED :: 2;

    UNCONFIGURED_BUFFER :: 3;

    INVALID_SERIAL      :: 4;

    INVALID_SIZE        :: 5;

    DEFUNCT_ROLE_OBJECT :: 6;

    XDG_SURFACE_ERROR_NOT_CONSTRUCTED     :: NOT_CONSTRUCTED;

    XDG_SURFACE_ERROR_ALREADY_CONSTRUCTED :: ALREADY_CONSTRUCTED;

    XDG_SURFACE_ERROR_UNCONFIGURED_BUFFER :: UNCONFIGURED_BUFFER;

    XDG_SURFACE_ERROR_INVALID_SERIAL      :: INVALID_SERIAL;

    XDG_SURFACE_ERROR_INVALID_SIZE        :: INVALID_SIZE;

    XDG_SURFACE_ERROR_DEFUNCT_ROLE_OBJECT :: DEFUNCT_ROLE_OBJECT;
}

/**
* @ingroup iface_xdg_surface
* @struct xdg_surface_listener
*/
xdg_surface_listener :: struct {
    /**
    * suggest a surface change
    *
    * The configure event marks the end of a configure sequence. A
    * configure sequence is a set of one or more events configuring
    * the state of the xdg_surface, including the final
    * xdg_surface.configure event.
    *
    * Where applicable, xdg_surface surface roles will during a
    * configure sequence extend this event as a latched state sent as
    * events before the xdg_surface.configure event. Such events
    * should be considered to make up a set of atomically applied
    * configuration states, where the xdg_surface.configure commits
    * the accumulated state.
    *
    * Clients should arrange their surface for the new states, and
    * then send an ack_configure request with the serial sent in this
    * configure event at some point before committing the new surface.
    *
    * If the client receives multiple configure events before it can
    * respond to one, it is free to discard all but the last event it
    * received.
    * @param serial serial of the configure event
    */
    configure: #type (data: *void, xdg_surface_: *xdg_surface, serial: u32) -> void #c_call;
}

xdg_toplevel_error :: enum u32 {
    RESIZE_EDGE :: 0;

    PARENT      :: 1;

    SIZE        :: 2;

    XDG_TOPLEVEL_ERROR_INVALID_RESIZE_EDGE :: RESIZE_EDGE;

    XDG_TOPLEVEL_ERROR_INVALID_PARENT      :: PARENT;

    XDG_TOPLEVEL_ERROR_INVALID_SIZE        :: SIZE;
}

/**
* @ingroup iface_xdg_toplevel
* edge values for resizing
*
* These values are used to indicate which edge of a surface
* is being dragged in a resize operation.
*/
xdg_toplevel_resize_edge :: enum u32 {
    NONE         :: 0;
    TOP          :: 1;
    BOTTOM       :: 2;
    LEFT         :: 4;
    TOP_LEFT     :: 5;
    BOTTOM_LEFT  :: 6;
    RIGHT        :: 8;
    TOP_RIGHT    :: 9;
    BOTTOM_RIGHT :: 10;

    XDG_TOPLEVEL_RESIZE_EDGE_NONE         :: NONE;
    XDG_TOPLEVEL_RESIZE_EDGE_TOP          :: TOP;
    XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM       :: BOTTOM;
    XDG_TOPLEVEL_RESIZE_EDGE_LEFT         :: LEFT;
    XDG_TOPLEVEL_RESIZE_EDGE_TOP_LEFT     :: TOP_LEFT;
    XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_LEFT  :: BOTTOM_LEFT;
    XDG_TOPLEVEL_RESIZE_EDGE_RIGHT        :: RIGHT;
    XDG_TOPLEVEL_RESIZE_EDGE_TOP_RIGHT    :: TOP_RIGHT;
    XDG_TOPLEVEL_RESIZE_EDGE_BOTTOM_RIGHT :: BOTTOM_RIGHT;
}

/**
* @ingroup iface_xdg_toplevel
* types of state on the surface
*
* The different state values used on the surface. This is designed for
* state values like maximized, fullscreen. It is paired with the
* configure event to ensure that both the client and the compositor
* setting the state can be synchronized.
*
* States set in this way are double-buffered, see wl_surface.commit.
*/
xdg_toplevel_state :: enum u32 {
    MAXIMIZED          :: 1;

    FULLSCREEN         :: 2;

    RESIZING           :: 3;

    ACTIVATED          :: 4;

    TILED_LEFT         :: 5;

    TILED_RIGHT        :: 6;

    TILED_TOP          :: 7;

    TILED_BOTTOM       :: 8;

    SUSPENDED          :: 9;

    CONSTRAINED_LEFT   :: 10;

    CONSTRAINED_RIGHT  :: 11;

    CONSTRAINED_TOP    :: 12;

    CONSTRAINED_BOTTOM :: 13;

    XDG_TOPLEVEL_STATE_MAXIMIZED          :: MAXIMIZED;

    XDG_TOPLEVEL_STATE_FULLSCREEN         :: FULLSCREEN;

    XDG_TOPLEVEL_STATE_RESIZING           :: RESIZING;

    XDG_TOPLEVEL_STATE_ACTIVATED          :: ACTIVATED;

    XDG_TOPLEVEL_STATE_TILED_LEFT         :: TILED_LEFT;

    XDG_TOPLEVEL_STATE_TILED_RIGHT        :: TILED_RIGHT;

    XDG_TOPLEVEL_STATE_TILED_TOP          :: TILED_TOP;

    XDG_TOPLEVEL_STATE_TILED_BOTTOM       :: TILED_BOTTOM;

    XDG_TOPLEVEL_STATE_SUSPENDED          :: SUSPENDED;

    XDG_TOPLEVEL_STATE_CONSTRAINED_LEFT   :: CONSTRAINED_LEFT;

    XDG_TOPLEVEL_STATE_CONSTRAINED_RIGHT  :: CONSTRAINED_RIGHT;

    XDG_TOPLEVEL_STATE_CONSTRAINED_TOP    :: CONSTRAINED_TOP;

    XDG_TOPLEVEL_STATE_CONSTRAINED_BOTTOM :: CONSTRAINED_BOTTOM;
}

xdg_toplevel_wm_capabilities :: enum u32 {
    WINDOW_MENU :: 1;

    MAXIMIZE    :: 2;

    FULLSCREEN  :: 3;

    MINIMIZE    :: 4;

    XDG_TOPLEVEL_WM_CAPABILITIES_WINDOW_MENU :: WINDOW_MENU;

    XDG_TOPLEVEL_WM_CAPABILITIES_MAXIMIZE    :: MAXIMIZE;

    XDG_TOPLEVEL_WM_CAPABILITIES_FULLSCREEN  :: FULLSCREEN;

    XDG_TOPLEVEL_WM_CAPABILITIES_MINIMIZE    :: MINIMIZE;
}

/**
* @ingroup iface_xdg_toplevel
* @struct xdg_toplevel_listener
*/
xdg_toplevel_listener :: struct {
    /**
    * suggest a surface change
    *
    * This configure event asks the client to resize its toplevel
    * surface or to change its state. The configured state should not
    * be applied immediately. See xdg_surface.configure for details.
    *
    * The width and height arguments specify a hint to the window
    * about how its surface should be resized in window geometry
    * coordinates. See set_window_geometry.
    *
    * If the width or height arguments are zero, it means the client
    * should decide its own window dimension. This may happen when the
    * compositor needs to configure the state of the surface but
    * doesn't have any information about any previous or expected
    * dimension.
    *
    * The states listed in the event specify how the width/height
    * arguments should be interpreted, and possibly how it should be
    * drawn.
    *
    * Clients must send an ack_configure in response to this event.
    * See xdg_surface.configure and xdg_surface.ack_configure for
    * details.
    */
    configure:        #type (data: *void, xdg_toplevel_: *xdg_toplevel, width: s32, height: s32, states: *wl_array) -> void #c_call;

    /**
    * surface wants to be closed
    *
    * The close event is sent by the compositor when the user wants
    * the surface to be closed. This should be equivalent to the user
    * clicking the close button in client-side decorations, if your
    * application has any.
    *
    * This is only a request that the user intends to close the
    * window. The client may choose to ignore this request, or show a
    * dialog to ask the user to save their data, etc.
    */
    close:            #type (data: *void, xdg_toplevel_: *xdg_toplevel) -> void #c_call;

    /**
    * recommended window geometry bounds
    *
    * The configure_bounds event may be sent prior to a
    * xdg_toplevel.configure event to communicate the bounds a window
    * geometry size is recommended to constrain to.
    *
    * The passed width and height are in surface coordinate space. If
    * width and height are 0, it means bounds is unknown and
    * equivalent to as if no configure_bounds event was ever sent for
    * this surface.
    *
    * The bounds can for example correspond to the size of a monitor
    * excluding any panels or other shell components, so that a
    * surface isn't created in a way that it cannot fit.
    *
    * The bounds may change at any point, and in such a case, a new
    * xdg_toplevel.configure_bounds will be sent, followed by
    * xdg_toplevel.configure and xdg_surface.configure.
    * @since 4
    */
    configure_bounds: #type (data: *void, xdg_toplevel_: *xdg_toplevel, width: s32, height: s32) -> void #c_call;

    /**
    * compositor capabilities
    *
    * This event advertises the capabilities supported by the
    * compositor. If a capability isn't supported, clients should hide
    * or disable the UI elements that expose this functionality. For
    * instance, if the compositor doesn't advertise support for
    * minimized toplevels, a button triggering the set_minimized
    * request should not be displayed.
    *
    * The compositor will ignore requests it doesn't support. For
    * instance, a compositor which doesn't advertise support for
    * minimized will ignore set_minimized requests.
    *
    * Compositors must send this event once before the first
    * xdg_surface.configure event. When the capabilities change,
    * compositors must send this event again and then send an
    * xdg_surface.configure event.
    *
    * The configured state should not be applied immediately. See
    * xdg_surface.configure for details.
    *
    * The capabilities are sent as an array of 32-bit unsigned
    * integers in native endianness.
    * @param capabilities array of 32-bit capabilities
    * @since 5
    */
    wm_capabilities:  #type (data: *void, xdg_toplevel_: *xdg_toplevel, capabilities: *wl_array) -> void #c_call;
}

xdg_popup_error :: enum u32 {
    XDG_POPUP_ERROR_INVALID_GRAB :: 0;
}

/**
* @ingroup iface_xdg_popup
* @struct xdg_popup_listener
*/
xdg_popup_listener :: struct {
    /**
    * configure the popup surface
    *
    * This event asks the popup surface to configure itself given
    * the configuration. The configured state should not be applied
    * immediately. See xdg_surface.configure for details.
    *
    * The x and y arguments represent the position the popup was
    * placed at given the xdg_positioner rule, relative to the upper
    * left corner of the window geometry of the parent surface.
    *
    * For version 2 or older, the configure event for an xdg_popup is
    * only ever sent once for the initial configuration. Starting with
    * version 3, it may be sent again if the popup is setup with an
    * xdg_positioner with set_reactive requested, or in response to
    * xdg_popup.reposition requests.
    * @param x x position relative to parent surface window geometry
    * @param y y position relative to parent surface window geometry
    * @param width window geometry width
    * @param height window geometry height
    */
    configure:    #type (data: *void, xdg_popup_: *xdg_popup, x: s32, y: s32, width: s32, height: s32) -> void #c_call;

    /**
    * popup interaction is done
    *
    * The popup_done event is sent out when a popup is dismissed by
    * the compositor. The client should destroy the xdg_popup object
    * at this point.
    */
    popup_done:   #type (data: *void, xdg_popup_: *xdg_popup) -> void #c_call;

    /**
    * signal the completion of a repositioned request
    *
    * The repositioned event is sent as part of a popup
    * configuration sequence, together with xdg_popup.configure and
    * lastly xdg_surface.configure to notify the completion of a
    * reposition request.
    *
    * The repositioned event is to notify about the completion of a
    * xdg_popup.reposition request. The token argument is the token
    * passed in the xdg_popup.reposition request.
    *
    * Immediately after this event is emitted, xdg_popup.configure and
    * xdg_surface.configure will be sent with the updated size and
    * position, as well as a new configure serial.
    *
    * The client should optionally update the content of the popup,
    * but must acknowledge the new popup configuration for the new
    * position to take effect. See xdg_surface.ack_configure for
    * details.
    * @param token reposition request token
    * @since 3
    */
    repositioned: #type (data: *void, xdg_popup_: *xdg_popup, token: u32) -> void #c_call;
}

zxdg_decoration_manager_v1 :: struct {}
zxdg_toplevel_decoration_v1 :: struct {}

zxdg_toplevel_decoration_v1_error :: enum u32 {
    UNCONFIGURED_BUFFER :: 0;

    ALREADY_CONSTRUCTED :: 1;

    ORPHANED            :: 2;

    INVALID_MODE        :: 3;

    ZXDG_TOPLEVEL_DECORATION_V1_ERROR_UNCONFIGURED_BUFFER :: UNCONFIGURED_BUFFER;

    ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ALREADY_CONSTRUCTED :: ALREADY_CONSTRUCTED;

    ZXDG_TOPLEVEL_DECORATION_V1_ERROR_ORPHANED            :: ORPHANED;

    ZXDG_TOPLEVEL_DECORATION_V1_ERROR_INVALID_MODE        :: INVALID_MODE;
}

/**
* @ingroup iface_zxdg_toplevel_decoration_v1
* window decoration modes
*
* These values describe window decoration modes.
*/
zxdg_toplevel_decoration_v1_mode :: enum u32 {
    CLIENT_SIDE :: 1;

    SERVER_SIDE :: 2;

    ZXDG_TOPLEVEL_DECORATION_V1_MODE_CLIENT_SIDE :: CLIENT_SIDE;

    ZXDG_TOPLEVEL_DECORATION_V1_MODE_SERVER_SIDE :: SERVER_SIDE;
}

/**
* @ingroup iface_zxdg_toplevel_decoration_v1
* @struct zxdg_toplevel_decoration_v1_listener
*/
zxdg_toplevel_decoration_v1_listener :: struct {
    /**
    * notify a decoration mode change
    *
    * The configure event configures the effective decoration mode.
    * The configured state should not be applied immediately. Clients
    * must send an ack_configure in response to this event. See
    * xdg_surface.configure and xdg_surface.ack_configure for details.
    *
    * A configure event can be sent at any time. The specified mode
    * must be obeyed by the client.
    * @param mode the decoration mode
    */
    configure: #type (data: *void, zxdg_toplevel_decoration_v1_: *zxdg_toplevel_decoration_v1, mode: u32) -> void #c_call;
}

#scope_file

#import "Basic"; // For assert


#run {
    {
        info := type_info(wl_message);
        for info.members {
            if it.name == {
                case "name";
                    assert(it.offset_in_bytes == 0, "wl_message.name has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_message.name has unexpected size % instead of 8", it.type.runtime_size);
                case "signature";
                    assert(it.offset_in_bytes == 8, "wl_message.signature has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_message.signature has unexpected size % instead of 8", it.type.runtime_size);
                case "types";
                    assert(it.offset_in_bytes == 16, "wl_message.types has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_message.types has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_message) == 24, "wl_message has size % instead of 24", size_of(wl_message));
    }

    {
        info := type_info(wl_interface);
        for info.members {
            if it.name == {
                case "name";
                    assert(it.offset_in_bytes == 0, "wl_interface.name has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_interface.name has unexpected size % instead of 8", it.type.runtime_size);
                case "version";
                    assert(it.offset_in_bytes == 8, "wl_interface.version has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_interface.version has unexpected size % instead of 4", it.type.runtime_size);
                case "method_count";
                    assert(it.offset_in_bytes == 12, "wl_interface.method_count has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_interface.method_count has unexpected size % instead of 4", it.type.runtime_size);
                case "methods";
                    assert(it.offset_in_bytes == 16, "wl_interface.methods has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_interface.methods has unexpected size % instead of 8", it.type.runtime_size);
                case "event_count";
                    assert(it.offset_in_bytes == 24, "wl_interface.event_count has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_interface.event_count has unexpected size % instead of 4", it.type.runtime_size);
                case "events";
                    assert(it.offset_in_bytes == 32, "wl_interface.events has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_interface.events has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_interface) == 40, "wl_interface has size % instead of 40", size_of(wl_interface));
    }

    {
        info := type_info(wl_list);
        for info.members {
            if it.name == {
                case "prev";
                    assert(it.offset_in_bytes == 0, "wl_list.prev has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_list.prev has unexpected size % instead of 8", it.type.runtime_size);
                case "next";
                    assert(it.offset_in_bytes == 8, "wl_list.next has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_list.next has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_list) == 16, "wl_list has size % instead of 16", size_of(wl_list));
    }

    {
        info := type_info(wl_array);
        for info.members {
            if it.name == {
                case "size";
                    assert(it.offset_in_bytes == 0, "wl_array.size has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_array.size has unexpected size % instead of 8", it.type.runtime_size);
                case "alloc";
                    assert(it.offset_in_bytes == 8, "wl_array.alloc has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_array.alloc has unexpected size % instead of 8", it.type.runtime_size);
                case "data";
                    assert(it.offset_in_bytes == 16, "wl_array.data has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_array.data has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_array) == 24, "wl_array has size % instead of 24", size_of(wl_array));
    }

    {
        info := type_info(wl_argument);
        for info.members {
            if it.name == {
                case "i";
                    assert(it.offset_in_bytes == 0, "wl_argument.i has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_argument.i has unexpected size % instead of 4", it.type.runtime_size);
                case "u";
                    assert(it.offset_in_bytes == 0, "wl_argument.u has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_argument.u has unexpected size % instead of 4", it.type.runtime_size);
                case "f";
                    assert(it.offset_in_bytes == 0, "wl_argument.f has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_argument.f has unexpected size % instead of 4", it.type.runtime_size);
                case "s";
                    assert(it.offset_in_bytes == 0, "wl_argument.s has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_argument.s has unexpected size % instead of 8", it.type.runtime_size);
                case "o";
                    assert(it.offset_in_bytes == 0, "wl_argument.o has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_argument.o has unexpected size % instead of 8", it.type.runtime_size);
                case "n";
                    assert(it.offset_in_bytes == 0, "wl_argument.n has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_argument.n has unexpected size % instead of 4", it.type.runtime_size);
                case "a";
                    assert(it.offset_in_bytes == 0, "wl_argument.a has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_argument.a has unexpected size % instead of 8", it.type.runtime_size);
                case "h";
                    assert(it.offset_in_bytes == 0, "wl_argument.h has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "wl_argument.h has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(wl_argument) == 8, "wl_argument has size % instead of 8", size_of(wl_argument));
    }

    {
        info := type_info(wl_display_listener);
        for info.members {
            if it.name == {
                case "error";
                    assert(it.offset_in_bytes == 0, "wl_display_listener.error has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_display_listener.error has unexpected size % instead of 8", it.type.runtime_size);
                case "delete_id";
                    assert(it.offset_in_bytes == 8, "wl_display_listener.delete_id has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_display_listener.delete_id has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_display_listener) == 16, "wl_display_listener has size % instead of 16", size_of(wl_display_listener));
    }

    {
        info := type_info(wl_registry_listener);
        for info.members {
            if it.name == {
                case "global";
                    assert(it.offset_in_bytes == 0, "wl_registry_listener.global has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_registry_listener.global has unexpected size % instead of 8", it.type.runtime_size);
                case "global_remove";
                    assert(it.offset_in_bytes == 8, "wl_registry_listener.global_remove has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_registry_listener.global_remove has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_registry_listener) == 16, "wl_registry_listener has size % instead of 16", size_of(wl_registry_listener));
    }

    {
        info := type_info(wl_callback_listener);
        for info.members {
            if it.name == {
                case "done";
                    assert(it.offset_in_bytes == 0, "wl_callback_listener.done has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_callback_listener.done has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_callback_listener) == 8, "wl_callback_listener has size % instead of 8", size_of(wl_callback_listener));
    }

    {
        info := type_info(wl_shm_listener);
        for info.members {
            if it.name == {
                case "format";
                    assert(it.offset_in_bytes == 0, "wl_shm_listener.format has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_shm_listener.format has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_shm_listener) == 8, "wl_shm_listener has size % instead of 8", size_of(wl_shm_listener));
    }

    {
        info := type_info(wl_buffer_listener);
        for info.members {
            if it.name == {
                case "release";
                    assert(it.offset_in_bytes == 0, "wl_buffer_listener.release has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_buffer_listener.release has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_buffer_listener) == 8, "wl_buffer_listener has size % instead of 8", size_of(wl_buffer_listener));
    }

    {
        info := type_info(wl_data_offer_listener);
        for info.members {
            if it.name == {
                case "offer";
                    assert(it.offset_in_bytes == 0, "wl_data_offer_listener.offer has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_offer_listener.offer has unexpected size % instead of 8", it.type.runtime_size);
                case "source_actions";
                    assert(it.offset_in_bytes == 8, "wl_data_offer_listener.source_actions has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_offer_listener.source_actions has unexpected size % instead of 8", it.type.runtime_size);
                case "action";
                    assert(it.offset_in_bytes == 16, "wl_data_offer_listener.action has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_offer_listener.action has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_data_offer_listener) == 24, "wl_data_offer_listener has size % instead of 24", size_of(wl_data_offer_listener));
    }

    {
        info := type_info(wl_data_source_listener);
        for info.members {
            if it.name == {
                case "target";
                    assert(it.offset_in_bytes == 0, "wl_data_source_listener.target has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.target has unexpected size % instead of 8", it.type.runtime_size);
                case "send";
                    assert(it.offset_in_bytes == 8, "wl_data_source_listener.send has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.send has unexpected size % instead of 8", it.type.runtime_size);
                case "cancelled";
                    assert(it.offset_in_bytes == 16, "wl_data_source_listener.cancelled has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.cancelled has unexpected size % instead of 8", it.type.runtime_size);
                case "dnd_drop_performed";
                    assert(it.offset_in_bytes == 24, "wl_data_source_listener.dnd_drop_performed has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.dnd_drop_performed has unexpected size % instead of 8", it.type.runtime_size);
                case "dnd_finished";
                    assert(it.offset_in_bytes == 32, "wl_data_source_listener.dnd_finished has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.dnd_finished has unexpected size % instead of 8", it.type.runtime_size);
                case "action";
                    assert(it.offset_in_bytes == 40, "wl_data_source_listener.action has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_source_listener.action has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_data_source_listener) == 48, "wl_data_source_listener has size % instead of 48", size_of(wl_data_source_listener));
    }

    {
        info := type_info(wl_data_device_listener);
        for info.members {
            if it.name == {
                case "data_offer";
                    assert(it.offset_in_bytes == 0, "wl_data_device_listener.data_offer has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.data_offer has unexpected size % instead of 8", it.type.runtime_size);
                case "enter";
                    assert(it.offset_in_bytes == 8, "wl_data_device_listener.enter has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.enter has unexpected size % instead of 8", it.type.runtime_size);
                case "leave";
                    assert(it.offset_in_bytes == 16, "wl_data_device_listener.leave has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.leave has unexpected size % instead of 8", it.type.runtime_size);
                case "motion";
                    assert(it.offset_in_bytes == 24, "wl_data_device_listener.motion has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.motion has unexpected size % instead of 8", it.type.runtime_size);
                case "drop";
                    assert(it.offset_in_bytes == 32, "wl_data_device_listener.drop has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.drop has unexpected size % instead of 8", it.type.runtime_size);
                case "selection";
                    assert(it.offset_in_bytes == 40, "wl_data_device_listener.selection has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_data_device_listener.selection has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_data_device_listener) == 48, "wl_data_device_listener has size % instead of 48", size_of(wl_data_device_listener));
    }

    {
        info := type_info(wl_shell_surface_listener);
        for info.members {
            if it.name == {
                case "ping";
                    assert(it.offset_in_bytes == 0, "wl_shell_surface_listener.ping has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_shell_surface_listener.ping has unexpected size % instead of 8", it.type.runtime_size);
                case "configure";
                    assert(it.offset_in_bytes == 8, "wl_shell_surface_listener.configure has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_shell_surface_listener.configure has unexpected size % instead of 8", it.type.runtime_size);
                case "popup_done";
                    assert(it.offset_in_bytes == 16, "wl_shell_surface_listener.popup_done has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_shell_surface_listener.popup_done has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_shell_surface_listener) == 24, "wl_shell_surface_listener has size % instead of 24", size_of(wl_shell_surface_listener));
    }

    {
        info := type_info(wl_surface_listener);
        for info.members {
            if it.name == {
                case "enter";
                    assert(it.offset_in_bytes == 0, "wl_surface_listener.enter has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_surface_listener.enter has unexpected size % instead of 8", it.type.runtime_size);
                case "leave";
                    assert(it.offset_in_bytes == 8, "wl_surface_listener.leave has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_surface_listener.leave has unexpected size % instead of 8", it.type.runtime_size);
                case "preferred_buffer_scale";
                    assert(it.offset_in_bytes == 16, "wl_surface_listener.preferred_buffer_scale has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_surface_listener.preferred_buffer_scale has unexpected size % instead of 8", it.type.runtime_size);
                case "preferred_buffer_transform";
                    assert(it.offset_in_bytes == 24, "wl_surface_listener.preferred_buffer_transform has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_surface_listener.preferred_buffer_transform has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_surface_listener) == 32, "wl_surface_listener has size % instead of 32", size_of(wl_surface_listener));
    }

    {
        info := type_info(wl_seat_listener);
        for info.members {
            if it.name == {
                case "capabilities";
                    assert(it.offset_in_bytes == 0, "wl_seat_listener.capabilities has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_seat_listener.capabilities has unexpected size % instead of 8", it.type.runtime_size);
                case "name";
                    assert(it.offset_in_bytes == 8, "wl_seat_listener.name has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_seat_listener.name has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_seat_listener) == 16, "wl_seat_listener has size % instead of 16", size_of(wl_seat_listener));
    }

    {
        info := type_info(wl_pointer_listener);
        for info.members {
            if it.name == {
                case "enter";
                    assert(it.offset_in_bytes == 0, "wl_pointer_listener.enter has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.enter has unexpected size % instead of 8", it.type.runtime_size);
                case "leave";
                    assert(it.offset_in_bytes == 8, "wl_pointer_listener.leave has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.leave has unexpected size % instead of 8", it.type.runtime_size);
                case "motion";
                    assert(it.offset_in_bytes == 16, "wl_pointer_listener.motion has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.motion has unexpected size % instead of 8", it.type.runtime_size);
                case "button";
                    assert(it.offset_in_bytes == 24, "wl_pointer_listener.button has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.button has unexpected size % instead of 8", it.type.runtime_size);
                case "axis";
                    assert(it.offset_in_bytes == 32, "wl_pointer_listener.axis has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis has unexpected size % instead of 8", it.type.runtime_size);
                case "frame";
                    assert(it.offset_in_bytes == 40, "wl_pointer_listener.frame has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.frame has unexpected size % instead of 8", it.type.runtime_size);
                case "axis_source";
                    assert(it.offset_in_bytes == 48, "wl_pointer_listener.axis_source has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis_source has unexpected size % instead of 8", it.type.runtime_size);
                case "axis_stop";
                    assert(it.offset_in_bytes == 56, "wl_pointer_listener.axis_stop has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis_stop has unexpected size % instead of 8", it.type.runtime_size);
                case "axis_discrete";
                    assert(it.offset_in_bytes == 64, "wl_pointer_listener.axis_discrete has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis_discrete has unexpected size % instead of 8", it.type.runtime_size);
                case "axis_value120";
                    assert(it.offset_in_bytes == 72, "wl_pointer_listener.axis_value120 has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis_value120 has unexpected size % instead of 8", it.type.runtime_size);
                case "axis_relative_direction";
                    assert(it.offset_in_bytes == 80, "wl_pointer_listener.axis_relative_direction has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_pointer_listener.axis_relative_direction has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_pointer_listener) == 88, "wl_pointer_listener has size % instead of 88", size_of(wl_pointer_listener));
    }

    {
        info := type_info(wl_keyboard_listener);
        for info.members {
            if it.name == {
                case "keymap";
                    assert(it.offset_in_bytes == 0, "wl_keyboard_listener.keymap has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.keymap has unexpected size % instead of 8", it.type.runtime_size);
                case "enter";
                    assert(it.offset_in_bytes == 8, "wl_keyboard_listener.enter has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.enter has unexpected size % instead of 8", it.type.runtime_size);
                case "leave";
                    assert(it.offset_in_bytes == 16, "wl_keyboard_listener.leave has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.leave has unexpected size % instead of 8", it.type.runtime_size);
                case "key";
                    assert(it.offset_in_bytes == 24, "wl_keyboard_listener.key has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.key has unexpected size % instead of 8", it.type.runtime_size);
                case "modifiers";
                    assert(it.offset_in_bytes == 32, "wl_keyboard_listener.modifiers has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.modifiers has unexpected size % instead of 8", it.type.runtime_size);
                case "repeat_info";
                    assert(it.offset_in_bytes == 40, "wl_keyboard_listener.repeat_info has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_keyboard_listener.repeat_info has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_keyboard_listener) == 48, "wl_keyboard_listener has size % instead of 48", size_of(wl_keyboard_listener));
    }

    {
        info := type_info(wl_touch_listener);
        for info.members {
            if it.name == {
                case "down";
                    assert(it.offset_in_bytes == 0, "wl_touch_listener.down has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.down has unexpected size % instead of 8", it.type.runtime_size);
                case "up";
                    assert(it.offset_in_bytes == 8, "wl_touch_listener.up has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.up has unexpected size % instead of 8", it.type.runtime_size);
                case "motion";
                    assert(it.offset_in_bytes == 16, "wl_touch_listener.motion has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.motion has unexpected size % instead of 8", it.type.runtime_size);
                case "frame";
                    assert(it.offset_in_bytes == 24, "wl_touch_listener.frame has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.frame has unexpected size % instead of 8", it.type.runtime_size);
                case "cancel";
                    assert(it.offset_in_bytes == 32, "wl_touch_listener.cancel has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.cancel has unexpected size % instead of 8", it.type.runtime_size);
                case "shape";
                    assert(it.offset_in_bytes == 40, "wl_touch_listener.shape has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.shape has unexpected size % instead of 8", it.type.runtime_size);
                case "orientation";
                    assert(it.offset_in_bytes == 48, "wl_touch_listener.orientation has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_touch_listener.orientation has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_touch_listener) == 56, "wl_touch_listener has size % instead of 56", size_of(wl_touch_listener));
    }

    {
        info := type_info(wl_output_listener);
        for info.members {
            if it.name == {
                case "geometry";
                    assert(it.offset_in_bytes == 0, "wl_output_listener.geometry has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.geometry has unexpected size % instead of 8", it.type.runtime_size);
                case "mode";
                    assert(it.offset_in_bytes == 8, "wl_output_listener.mode has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.mode has unexpected size % instead of 8", it.type.runtime_size);
                case "done";
                    assert(it.offset_in_bytes == 16, "wl_output_listener.done has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.done has unexpected size % instead of 8", it.type.runtime_size);
                case "scale";
                    assert(it.offset_in_bytes == 24, "wl_output_listener.scale has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.scale has unexpected size % instead of 8", it.type.runtime_size);
                case "name";
                    assert(it.offset_in_bytes == 32, "wl_output_listener.name has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.name has unexpected size % instead of 8", it.type.runtime_size);
                case "description";
                    assert(it.offset_in_bytes == 40, "wl_output_listener.description has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "wl_output_listener.description has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(wl_output_listener) == 48, "wl_output_listener has size % instead of 48", size_of(wl_output_listener));
    }

    {
        info := type_info(xdg_wm_base_listener);
        for info.members {
            if it.name == {
                case "ping";
                    assert(it.offset_in_bytes == 0, "xdg_wm_base_listener.ping has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_wm_base_listener.ping has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(xdg_wm_base_listener) == 8, "xdg_wm_base_listener has size % instead of 8", size_of(xdg_wm_base_listener));
    }

    {
        info := type_info(xdg_surface_listener);
        for info.members {
            if it.name == {
                case "configure";
                    assert(it.offset_in_bytes == 0, "xdg_surface_listener.configure has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_surface_listener.configure has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(xdg_surface_listener) == 8, "xdg_surface_listener has size % instead of 8", size_of(xdg_surface_listener));
    }

    {
        info := type_info(xdg_toplevel_listener);
        for info.members {
            if it.name == {
                case "configure";
                    assert(it.offset_in_bytes == 0, "xdg_toplevel_listener.configure has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_toplevel_listener.configure has unexpected size % instead of 8", it.type.runtime_size);
                case "close";
                    assert(it.offset_in_bytes == 8, "xdg_toplevel_listener.close has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_toplevel_listener.close has unexpected size % instead of 8", it.type.runtime_size);
                case "configure_bounds";
                    assert(it.offset_in_bytes == 16, "xdg_toplevel_listener.configure_bounds has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_toplevel_listener.configure_bounds has unexpected size % instead of 8", it.type.runtime_size);
                case "wm_capabilities";
                    assert(it.offset_in_bytes == 24, "xdg_toplevel_listener.wm_capabilities has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_toplevel_listener.wm_capabilities has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(xdg_toplevel_listener) == 32, "xdg_toplevel_listener has size % instead of 32", size_of(xdg_toplevel_listener));
    }

    {
        info := type_info(xdg_popup_listener);
        for info.members {
            if it.name == {
                case "configure";
                    assert(it.offset_in_bytes == 0, "xdg_popup_listener.configure has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_popup_listener.configure has unexpected size % instead of 8", it.type.runtime_size);
                case "popup_done";
                    assert(it.offset_in_bytes == 8, "xdg_popup_listener.popup_done has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_popup_listener.popup_done has unexpected size % instead of 8", it.type.runtime_size);
                case "repositioned";
                    assert(it.offset_in_bytes == 16, "xdg_popup_listener.repositioned has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "xdg_popup_listener.repositioned has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(xdg_popup_listener) == 24, "xdg_popup_listener has size % instead of 24", size_of(xdg_popup_listener));
    }

    {
        info := type_info(zxdg_toplevel_decoration_v1_listener);
        for info.members {
            if it.name == {
                case "configure";
                    assert(it.offset_in_bytes == 0, "zxdg_toplevel_decoration_v1_listener.configure has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "zxdg_toplevel_decoration_v1_listener.configure has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(zxdg_toplevel_decoration_v1_listener) == 8, "zxdg_toplevel_decoration_v1_listener has size % instead of 8", size_of(zxdg_toplevel_decoration_v1_listener));
    }
}

