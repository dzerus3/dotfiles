#!/bin/bash
# See also https://github.com/jluttine/rofi-power-menu/blob/master/rofi-power-menu

options=(
    "⍈  Logout"
    "⏻  Shutdown"
    "⏼  Reboot"
    "⏾  Suspend"
    "⨯  Cancel"
)

selection=$(
    printf '%s\n' "${options[@]}" | \
    fuzzel --dmenu --lines=5 --width=13 \
           --horizontal-pad=12 --vertical-pad=10 \
           --inner-pad=8 \
           --text-color=c5c8c6ff --selection-text-color=c5c8c6ff \
           --background=222426f2 --selection-color=373b41f2 \
           --font="CodeNewRoman NF:size=9,Anonymous Pro:size=9"
)

# Note: User needs permission in /etc/doas.conf
case "$selection" in
    "⍈  Logout")   swaymsg exit         ;;
    "⏻  Shutdown") doas -n shutdown -h now ;;
    "⏼  Reboot")   doas -n shutdown -r now ;;
    "⏾  Suspend")  doas -n s2ram           ;;
esac

