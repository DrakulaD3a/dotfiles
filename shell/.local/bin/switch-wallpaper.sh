#!/bin/sh

wal -q -i ~/personal/pictures/wallpapers/wallpaper.jpg

source "$HOME/.cache/wal/colors.sh"

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/colors-waybar.css

swww img ~/personal/pictures/wallpapers/wallpaper.jpg
~/.local/bin/reload-waybar.sh
