#!/bin/sh

time=$(date +%H)

if [[ $time -lt 17 && $time -ge 8 ]]; then
    ~/.local/bin/light-gtk.sh
    swww img -t none ~/personal/pictures/wallpapers/light-wallpaper.jpg
    ~/.local/bin/reload-waybar.sh
    echo "light"
else 
    ~/.local/bin/gtk.sh
    swww img -t none ~/personal/pictures/wallpapers/dark-wallpaper.jpg
    ~/.local/bin/reload-waybar.sh
    echo "dark"
fi
