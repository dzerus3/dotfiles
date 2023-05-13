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
    fuzzel --dmenu --lines=5 --width=13
)

# Note: User needs permission in /etc/doas.conf
case "$selection" in
    "⍈  Logout")   swaymsg exit         ;;
    "⏻  Shutdown") doas -n shutdown -h now ;;
    "⏼  Reboot")   doas -n shutdown -r now ;;
    "⏾  Suspend")  swaylock --daemonize -i /usr/share/backgrounds/screensaver.jpg && doas -n s2ram          ;;
esac

