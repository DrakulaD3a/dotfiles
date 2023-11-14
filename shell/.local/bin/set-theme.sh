#!/bin/sh

options=" Tokyonight\n Kanagawa\n Adapta"

chosen=$(echo -e "$options" | wofi -d -i -p "Theme")

if [[ $chosen == " Adapta" ]]; then
    ~/.local/bin/light-gtk.sh
    swww img -t none ~/personal/pictures/wallpapers/light-wallpaper.jpg
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/light-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/light-wallpaper.jpg"
    ~/.local/bin/reload-waybar.sh
elif [[ $chosen == " Kanagawa" ]]; then
    ~/.local/bin/kanagawa.sh
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    ~/.local/bin/reload-waybar.sh
else 
    ~/.local/bin/gtk.sh
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    ~/.local/bin/reload-waybar.sh
fi
