# Waybar: Elegant Vagrant

## Credits

This `waybar` configuration hasn't been done from scratch. The original work was done by Jesse Mirabel (@sejjy) at [sejjy/mechabar](https://github.com/sejjy/mechabar). Thank him for this awesome design.

## Changes

I've made many changes to the original theme, by tweaking the colors and rearranging many modules to different positions and by adding other custom modules not present in the original `mechabar`.

All the changes includes:

- Move distro, idle, clock and date modules to the top left, in this order.
- Remove `rofi` script to manage power, and made the distro haver-able, displaying the power buttons.
- Added a custom shell script to replace the original `media-player.py`.
- Added Pomodoro timer to the center.
- Added keyboard layout and submaps for Hyprland.
- Removed workspaces module, replaced with a client counter.
- Added task module to display `taskwarrior` or `org-mode` tasks.
- Added network module (upload and download speeds).
- Added [wttrbar](https://github.com/bjesus/wttrbar) module
- Tweaked the position of Bluetooth, WiFi, backlight and volume modules to the top right.

## Profiles

- **Default Mechabar:** Use `default-mechabar.jsonc`
  - Contains no workspaces, has pomodoro centered, and a client module to count open windows
- **Legacy Mechabar:** Use `legacy-mechabar.jsonc`
  - Contains workspaces, no client module and the pomodoro isn't centered

### Footages

<div align="center">
  <img src="https://git.disroot.org/aocoronel/images/raw/branch/main/elegantvagrant/2025-04-21-waybar-legacy.webp">
  <p>Waybar Legacy Profile</p>
  <img src="https://git.disroot.org/aocoronel/images/raw/branch/main/elegantvagrant/2025-04-21-waybar-default.webp">
  <p>Waybar Default Profile</p>
</div>

> [!NOTE]
> These images were taken from a NixOS system, thus the `arch-update` module isn't visible.

## Modules

| Module                      | Content                                               | Author |
| --------------------------- | ----------------------------------------------------- | ------ |
| `arch-linux.jsonc`          | Arch Linux Logo                                       | Me     |
| `arch-update.jsonc`         | Arch Linux Updates (pacman, flatpak and AUR)          | sejjy  |
| `backlight.jsonc`           | Screen brightness meter                               | sejjy  |
| `battery.jsonc`             | Battery meter                                         | sejjy  |
| `bluetooth.jsonc`           | Bluetooth button and actions                          | sejjy  |
| `clock.jsonc`               | Current Time                                          | sejjy  |
| `cpu.jsonc`                 | CPU usage                                             | sejjy  |
| `cpuinfo.jsonc`             | Temperature meter                                     | sejjy  |
| `desktop.jsonc`             | Replace laptop module, with only WiFi module enabled  | Me     |
| `hyprland-language.jsonc`   | Display current keyboard (Hyprland only)              | Me     |
| `hyprland-submap.jsonc`     | Display Hyprland Submaps                              | Me     |
| `hyprland-workspaces.jsonc` | Display workspaces (Hyprland only)                    | Me     |
| `idle.jsonc`                | Button to toggle idle                                 | sejjy  |
| `keyboard.jsonc`            | Groups Hyprland Language and Submaps                  | Me     |
| `laptop.jsonc`              | Groups Laptop Modules: backlight, battery...          | Me     |
| `media.jsonc`               | Display current playing media                         | Me     |
| `memory.jsonc`              | Memory usage                                          | sejjy  |
| `network.jsonc`             | Network speeds                                        | Me     |
| `nixos.jsonc`               | NixOS Logo                                            | Me     |
| `pomodoro.jsonc`            | Pomodoro counter                                      | Me     |
| `power.jsonc`               | Groups all power commands (poweroff, reboot...)       | Me     |
| `pulseaudio.jsonc`          | Volume meter                                          | sejjy  |
| `tasks.jsonc`               | Taskwarrior or Org-mode tasks                         | Me     |
| `tray.jsonc`                | All applications that supports tray                   | Me     |
| `weather.jsonc`             | Wttrbar module to display weather from wttr.in        | Me     |
| `wifi.jsonc`                | Button to manage WiFi networks                        | sejjy  |
| `workspace-client.jsonc`    | Counts how many windows are open and their workspaces | Me     |

## Installation

Just copying this directory to `~/.config/waybar` is almost enough. It's still required to run `make` inside the `scripts` directory to build some programs used to display relevant information.

## Plans

Although this theme is quit comprehensive in visuals and features, yet solid, I do still plan to make radical changes to the looks and rewrite all scripts used in this theme.
