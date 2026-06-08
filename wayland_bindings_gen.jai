//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



WAYLAND_VERSION_MAJOR :: 1;
WAYLAND_VERSION_MINOR :: 22;
WAYLAND_VERSION_MICRO :: 0;
WAYLAND_VERSION :: "1.22.0";

WL_MARSHAL_FLAG_DESTROY :: 1 << 0;

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
}

