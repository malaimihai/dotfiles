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
stow -t "$HOME" hyprland kitty rofi waybar backgrounds swaync
```

## Sddm Theme

First install dependencies:

```bash
pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
```

Make sure that Caskaydia Nerd Font is available system wide.
It should be listed in `/usr/share/fonts`:

```bash
fc-list | grep "CaskaydiaCove Nerd Font"
```

Then copy the theme to the sddm themes directory:

```bash
sudo cp -r sddm/catppuccin-macchiato/ /usr/share/sddm/themes/
```

Finally, set the theme in the sddm configuration file `/etc/sddm.conf`:

```ini
[Theme]
Current=catppuccin-macchiato
```

Restart sddm to see the changes.

TESING README AND IF MY OLLAMA COMMIT IS GENRATED GOOD
