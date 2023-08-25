#!/bin/sh

option1="  lock"
option2=" logout"
option3=" suspend"
option4=" reboot"
option5=" power off"

options="$option1\n$option2\n$option3\n$option4\n$option5"

chosen=$(echo -e "$options" | wofi -d -i -p "Powermenu")

case "$chosen" in
    $option1)
        swaylock ;;
    $option2)
        hyprctl dispatch exit ;;
    $option3)
        systemctl suspend && swaylock -i ~/personal/pictures/wallpapers/lock.png ;;
    $option4)
        systemctl reboot ;;
    $option5)
        systemctl poweroff ;;
esac

