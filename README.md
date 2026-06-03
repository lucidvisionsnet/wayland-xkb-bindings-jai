# wayland-xkb-jai

Jai bindings for Wayland clients and xkb.

**These bindings are incomplete at this time.** Many definitions in the Wayland
source are `static inline`, meaning their implementation in Jai must be done by
hand. Production and maintenance of these bindings could be improved by
re-implementing `wayland-scanner` for Jai.

Also, these bindings are not currently ergonomic. For example, you will likely
have to be verbose with enum values, specifying them in a fully-qualified
manner, and (auto-)casting them to underlying Wayland integer types.

Other projects provide Jai-native implementations of the Wayland protocol.

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
#import "Wayland";
```

# Example

You can build and run an example that uses the generated bindings.

```
jai example.jai
./example
```

The example runs at ~60 fps, renders a small window with a simple light blue
background, and can be terminated by pressing the Escape key.

# Generation

First, install the Wayland protocol dependencies and, then generate client
header and source files into the root of this project. On Ubuntu:

```
sudo apt install wayland-protocols
wayland-scanner \
  client-header \
  /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
  xdg-shell-client-protocol.h
wayland-scanner \
  public-code \
  /usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml \
  xdg-shell-client-protocol.c
wayland-scanner \
  public-code \
  /usr/share/wayland/wayland.xml \
  wayland-client-protocol.c
wayland-scanner \
  client-header \
  /usr/share/wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml \
  xdg-decoration-unstable-v1-client-protocol.h
wayland-scanner \
  public-code \
  /usr/share/wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml \
  xdg-decoration-unstable-v1-client-protocol.c
```

We use `public-code` instead of `private-code` in the generator because
otherwise some symbols are marked hidden inside the C translation unit, not
exposed for external use in a supporting library our bindings generator
produces.

Next, install the xkb dependency. On Ubuntu:

```
sudo apt install libxkbcommon-dev
```

Finally, run the generator:

```
jai generate.jai
```

This generates wayland.jai and xkb.jai and overwrites the files of the same
name in this project's root. module.jai contains all the code that needed to
be hand-written. module.jai is not mutated by the code generator.

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
