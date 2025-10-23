# dotfiles

This repo contains my personal dotfiles and configuration files for various tools and applications. The main theme is [cattpuccin macchiato](https://catppuccin.com/palette/).

## Prerequisites

- A Linux system (the instructions below are for Arch Linux, but can be adapted for other distributions).
- `hyprland` window manager installed.

## Installation (Arch)

First clone the repository locally and cd into it.

Install the necessary packages:

```bash
 yay -S hypridle hyprlock hyprpaper kitty rofi waybar hyprshot swaync stow ttf-cascadia-code-nerd
```

Create symlinks for the dotfiles:

```bash
stow -t "$HOME" hyprland kitty rofi waybar backgrounds
```

## Sddm Theme

First install dependencies:

```bash
pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
```
