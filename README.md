# wayland-xkb-jai

Jai bindings for Wayland clients and xkb.

# Usage

Bindings provided with this repo were generated against:

- Wayland version 1.22.0-2.1build1
- libxkbcommon version 1.6.0-1build1

These bindings require `libwayland-client.so.0` and `libxkbcommon.so.0` to
exist in your system library search path. Usage assumes that you are actually
using Wayland and not X11.

Clone this repo into a `modules/Wayland` folder in your modules search path.
Then,

```jai
Wayland :: #import "Wayland";

// Call the following before using any other code from the bindings.
Wayland.init_wayland_protocol_bindings();
```

# Example

You can build and run an example that uses the generated bindings.

```
jai example.jai
./example
```

The example runs at ~60 fps, renders a small window with a light blue
background, and can be terminated by pressing the Escape key. Key strokes
captured by the window are printed to the terminal.

# Generation

If you don't already have it, install the xkb development library. On Ubuntu:

```
sudo apt install libxkbcommon-dev
```

Then, build the Jai wayland-scanner, and run the Jai bindings generator.

```
jai scanner.jai
jai generate.jai
```

To see which XML files the generator is using, inspect generate.jai.

The scanner and generator produce files that are `#load`'ed by module.jai.

# Troubleshooting

If `wl_display_connect` returns `null`, you may be running on X11. Check for
this via

```
echo $XDG_SESSION_TYPE
```

If this reports X11, you may be able to enable Wayland via configuration. On
Ubuntu:

```
sudo <editor> /etc/gdm3/custom.conf
```

and change `#WaylandEnable=false` to `WaylandEnable=true`.

Then:

```
sudo systemctl restart gdm3
```

and at the login screen, search for a UI element to use Ubuntu Wayland. Select
that and then log in.
