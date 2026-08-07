# hypr-config

Lua-based [Hyprland](https://hyprland.org) configuration with a **scrolling layout**.

## Overview

This config uses Hyprland's Lua configuration API — everything is written in
Lua and loaded from a single `hyprland.lua` entry point. The window layout is
a **column-based scrolling layout** (`layout = "scrolling"`), so windows are
organized into scrolling columns rather than a static grid.

## Features

- **Scrolling layout** — columns with configurable widths
  (`column_width`, `explicit_column_widths`), focus follows the visible window
- **Modular structure** — one Lua file per concern, loaded with `require`
- **Vim-style keybindings** — `SUPER + H/J/K/L` for focus, `SHIFT` for moving windows
- **Animations** — custom bezier curves and spring-based animations
- **Caelestia shell** — started automatically, paired with
  [caelestia-dots/shell](https://github.com/caelestia-dots/shell)
- **Korean input** — [kime](https://github.com/Riey/kime) launched at startup
- **Clipboard history** — `cliphist` daemon via `wl-paste --watch`
- **Media keys** — volume, brightness, and playback controls via `wpctl` /
  `brightnessctl` / `playerctl`
- **LSP support** — dev shell with `lua-language-server` and Hyprland Lua stubs

## Layout

```
.
├── hyprland.lua       # entry point: loads all modules
├── env.lua            # environment variables (XDG_*, BROWSER, EDITOR)
├── monitors.lua       # monitor definitions
├── config.lua         # general, decoration, input, scrolling layout, ...
├── animation.lua      # bezier curves, springs, animation leaves
├── gesture.lua        # touchpad gestures
├── binds.lua          # keybindings
├── rules.lua          # window rules (e.g. XWayland drag fix)
├── autostart.lua      # run on `hyprland.start`
├── .luarc.json        # LSP config for the `hl` global + Hyprland stubs
├── flake.nix          # dev shell (lua-language-server)
└── .envrc             # direnv: `use flake`
```

## Keybindings

`SUPER` is the main modifier.

| Keys | Action |
|---|---|
| `SUPER + Enter`, `SUPER + T` | Launch `kitty` |
| `SUPER + W` | Open browser |
| `SUPER + E` | Open file manager |
| `SUPER + Q` | Close window |
| `SUPER + H/J/K/L` (or arrows) | Focus window in direction |
| `SUPER + SHIFT + H/J/K/L` | Move window in direction |
| `SUPER + SHIFT + Scroll` | Focus previous/next window (scrolling layout) |
| `SUPER + Scroll` | Switch workspace |
| `SUPER + CTRL + H/L` | Focus monitor left/right |
| `SUPER + CTRL + J/K` | Focus previous/next workspace |
| `SUPER + CTRL + SHIFT + H/L` | Move window to monitor |
| `SUPER + CTRL + SHIFT + J/K` | Move window to workspace |
| `SUPER + R`, `SUPER + D` | Column resize layouts |
| `SUPER + drag (left)` | Move window |
| `SUPER + drag (right)` | Resize window |
| `XF86AudioRaiseVolume` / `LowerVolume` / `Mute` / `MicMute` | Audio control (`wpctl`) |
| `XF86MonBrightnessUp` / `Down` | Brightness (`brightnessctl`) |
| `XF86AudioNext` / `Prev` / `Play` / `Pause` | Media control (`playerctl`) |

## Installation

### Via nixos-config (recommended)

This repository is included as a flake input in
[`yaeju1205/nixos-config`](https://github.com/yaeju1205/nixos-config)
(`flake = false`) and linked to `~/.config/hypr` through `xdg.configFile`.

### Standalone

```bash
git clone https://github.com/yaeju1205/hypr-config ~/.config/hypr
```

Then restart Hyprland so it picks up `hyprland.lua`.

## Development

```bash
nix develop   # or `direnv allow` — provides lua-language-server
```

The included `.luarc.json` points the language server at Hyprland's Lua stubs
(`~/.nix-profile/share/hypr/stubs`) and declares the `hl` global, so you get
completions and diagnostics while editing.

## Requirements

- Hyprland with **Lua configuration support** (the `hl.*` API)
- `kitty`, `xdg-open`, `wpctl`, `brightnessctl`, `playerctl` — see the
  `nixos-config` package lists
