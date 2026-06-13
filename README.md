# wayland-xkb-bindings-jai

Jai bindings for [Wayland](https://wayland.freedesktop.org/docs/html/)
protocols and [XKB](https://www.x.org/XKB/).

# Usage

Bindings provided with this repo were generated against:

- Wayland version 1.22.0-2.1build1
- libxkbcommon version 1.6.0-1build1

These bindings require `libwayland-client.so.0` and `libxkbcommon.so.0` to
exist in your system library search path. Usage assumes that you are actually
using Wayland and not X11.

Clone this repo into a folder in your modules path, say `Wayland`. Then,

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

The bindings-generation implementation requires the compiled
[wayland-scanner-jai](https://github.com/lucidvisionsnet/wayland-scanner-jai)
tool be discoverable on your PATH.

If you don't already have it, install the xkb development library. On Ubuntu:

```
sudo apt install libxkbcommon-dev
```

```
jai generate.jai
```

To see which XML files the generator is using, inspect generate.jai.
