#load "wayland_bindings_gen.jai";
#load "wayland_scanner_output.jai";
#load "xkb.jai";

libwayland_client   :: #library,system "libwayland-client.so.0";

// Opaque types, listed by hand.
wl_buffer                   :: struct {}
wl_callback                 :: struct {}
wl_compositor               :: struct {}
wl_data_device              :: struct {}
wl_data_device_manager      :: struct {}
wl_data_offer               :: struct {}
wl_data_source              :: struct {}
wl_keyboard                 :: struct {}
wl_output                   :: struct {}
wl_pointer                  :: struct {}
wl_region                   :: struct {}
wl_registry                 :: struct {}
wl_seat                     :: struct {}
wl_shell                    :: struct {}
wl_shell_surface            :: struct {}
wl_shm                      :: struct {}
wl_shm_pool                 :: struct {}
wl_subcompositor            :: struct {}
wl_surface                  :: struct {}
wl_touch                    :: struct {}
xdg_popup                   :: struct {}
xdg_positioner              :: struct {}
xdg_surface                 :: struct {}
xdg_toplevel                :: struct {}
xdg_wm_base                 :: struct {}
wl_subsurface               :: struct {}
zxdg_decoration_manager_v1  :: struct {}
zxdg_toplevel_decoration_v1 :: struct {}
