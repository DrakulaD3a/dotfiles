#!/bin/sh

options=" Tokyonight\n Kanagawa\n Adapta"

chosen=$(echo -e "$options" | wofi -d -i -p "Theme")

if [[ $chosen == " Adapta" ]]; then
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/light-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/light-wallpaper.jpg"
elif [[ $chosen == " Kanagawa" ]]; then
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
else 
    hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/personal/pictures/wallpapers/dark-wallpaper.jpg"
fi
