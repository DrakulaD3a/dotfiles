#!/bin/bash

num=$((1 + $RANDOM % 4))
hyprctl hyprpaper wallpaper "eDP-1,~/personal/pictures/wallpapers/city${num}.png"
