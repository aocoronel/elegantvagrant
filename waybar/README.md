# Waybar

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
- Display current workspace.
- Display all task or due task from `taskwarrior` or `org-mode`.
- Display downloaded and uploaded bytes.
- Display bluetooth, wifi, volume and brightness.
- Display weather. Requires [wttrbar](https://github.com/bjesus/wttrbar).

### Footages

<div align="center">
  <img src="https://git.disroot.org/aocoronel/images/raw/branch/main/elegantvagrant/2025-10-19-waybar.png">
</div>

## Installation

Just copying this directory to `~/.config/waybar` is almost enough. It's still required to run `make` inside the `scripts` directory to build some programs used to display relevant information.
