# wayland-xkb-bindings-jai

This repository contains:

- wayland-scanner-jai, a Jai implementation of wayland-scanner which emits Jai
  code
- [Wayland](https://wayland.freedesktop.org/docs/html/) protocol bindings for Jai
- [XKB](https://www.x.org/XKB/) bindings for Jai

# Usage

## Bindings

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

## wayland-scanner-jai

If you want to use wayland-scanner-jai standalone, compile it (see _Generation_
below) and then run it to see its help text.

When generating Wayland protocol code and bindings, it is often convenient to
process multiple XML files at once so that all the protocol code you need is
emitted in the single output file. (See the example in _Testing_ below.) When
doing this, opaque type declarations will often be duplicated across protocol
definitions. In this case, pass the `--dont-emit-opaque-decls` command-line
argument and add the opaque type declarations yourself in supporting code.

Unlike in C, in Jai, there are some assignments to globally-scoped variables
in the Wayland protocol code that cannot be done at compile time. Therefore,
you must call `init_wayland_protocol_bindings()` (defined for you in the output
of this tool) in your code before using anything else from the generated code.

To build a Wayland application, you will also need to supplement this tool's
output with fundamental Wayland type definitions from at least the following
Wayland headers, for example located at `/usr/include` on Ubuntu 24.04.

- wayland-client-core.h
- wayland-util.h
- wayland-version.h

Such supporting code is included in the complete bindings produced via
generate.jai. Again, see _Generation_ for more.

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

First, compile `wayland-scanner-jai`:

```
jai wayland-scanner-jai.jai
```

If you don't already have it, install the xkb development library. On systems
with the apt package manager:

```
sudo apt install libxkbcommon-dev
```

Finally, generate the bindings. The generator expects Wayland XML protocol
definitions, Wayland headers, and xkb headers to exist in specific locations
on your system and Wayland and xkb libraries be discoverable on the library
search path. To see which XML files the generator is using, inspect
generate.jai.

```
jai generate.jai
```

# Testing

Compile and run `test.jai`. At this time, this tests the built-in XML parser
used to parse Wayland XML protocol definitions.

To exercise wayland-scanner-jai and generate protocol code for the fundamental
Wayland protocol, the xdg-shell protocol, and the xdg-decoration protocol, run
the following (for example, on Ubuntu 24):

```
jai wayland-scanner-jai.jai
./wayland-scanner-jai client --dont-emit-opaque-decls \
  /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
  /usr/share/wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml \
  /usr/share/wayland/wayland.xml
```
