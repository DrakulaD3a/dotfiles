#!/bin/sh

grim -g "$(slurp)" -t png $(xdg-user-dir PICTURES)/screenshots/$(date +%d%m%Y_%H%M%S).png
wl-copy < $(xdg-user-dir PICTURES)/screenshots/$(date +%d%m%Y_%H%M%S).png
