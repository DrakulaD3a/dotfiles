#!/bin/sh

options=" dark\n light"

chosen=$(echo -e "$options" | wofi -d -i -p "Theme")

if [[ $chosen == " light" ]]; then
    ~/.local/bin/light-gtk.sh
    swww img -t none ~/personal/pictures/wallpapers/light-wallpaper.jpg
    ~/.local/bin/reload-waybar.sh
else 
    ~/.local/bin/gtk.sh
    swww img -t none ~/personal/pictures/wallpapers/dark-wallpaper.jpg
    ~/.local/bin/reload-waybar.sh
fi
