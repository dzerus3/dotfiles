#!/bin/bash
# See also https://github.com/jluttine/rofi-power-menu/blob/master/rofi-power-menu

options=(
    "✱  Lock"
    "⍈  Logout"
    "⏾  Suspend"
    "⏻  Shutdown"
    "↻  Reboot"
    "⨯  Cancel"
)

selection=$(
    printf '%s\n' "${options[@]}" | \
    fuzzel --dmenu --lines=6 --width=13
)

# Note: User needs permission in /etc/doas.conf
case "$selection" in
    "✱  Lock")     swaylock --daemonize -i $HOME/pics/screensavers/screensaver.jpg ;;
    "⍈  Logout")   swaymsg exit ;;
    "⏾  Suspend")  swaylock --daemonize -i $HOME/pics/screensavers/screensaver.jpg && doas -n s2ram          ;;
    "⏻  Shutdown") doas -n shutdown -h now ;;
    "↻  Reboot")   doas -n shutdown -r now ;;
esac
