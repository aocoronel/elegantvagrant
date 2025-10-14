# Waybar: Elegant Vagrant

## Credits

This `waybar` configuration hasn't been done from scratch. The original work was done by Jesse Mirabel (@sejjy) at [sejjy/mechabar](https://github.com/sejjy/mechabar). Thank him for this awesome design.

## Features

- Display distro. Hover to display options to reboot, shutdown...
- Display time. Click to change idle/presentation mode.
- Display date. Hover to show calendar.
- Display current playing music. Requires `playerctl`
- Display CPU temperature.
- Display Memory usage.
- Display CPU usage.
- Display pomodoro timer. Uses `pomodoro`, which is controlled by `pomodoro-control`.
- Display current keyboard and submap (Hyprland only).
- Display how many clients (windows) are open (Hyprland only).
- Display all task or due task from `taskwarrior` or `org-mode`.
- Display downloaded and uploaded bytes.
- Display bluetooth, wifi, volume and brightness.
- Display weather. Requires [wttrbar](https://github.com/bjesus/wttrbar).
- Display updates available (Arch Linux only).

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

## Installation

Just copying this directory to `~/.config/waybar` is almost enough. It's still required to run `make` inside the `scripts` directory to build some programs used to display relevant information.

## Plans

Although this theme is quit comprehensive in visuals and features, yet solid, I do still plan to make radical changes to the looks and rewrite all scripts used in this theme.
