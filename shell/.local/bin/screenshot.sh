#!/bin/sh

grim -g "$(slurp)" -t png $(xdg-user-dir PICTURES)/screenshots/$(date +%Y%m%d_%H%M%S).png
wl-copy < $(xdg-user-dir PICTURES)/screenshots/$(date +%Y%m%d_%H%M%S).png
