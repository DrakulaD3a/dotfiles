#!/bin/sh

options="suspend\nhibernate\npoweroff\nreboot\nlock"
chosen=$(echo -e "$options" | wofi -d -i -p "Poweroff")

case "$chosen" in
    "lock") swaylock -i ~/personal/pictures/wallpapers/lock.png ;;
    "suspend" | "hibernate") systemctl $chosen && swaylock -i ~/personal/pictures/wallpapers/lock.png ;;
    *) systemctl $chosen ;;
esac

