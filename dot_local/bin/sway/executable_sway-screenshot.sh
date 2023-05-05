#!/bin/bash
# Simple screenshot script, dependencies: grim, wofi, imv, jq, slurp
# Choose directory to save screenshots and viewer
# Modified version of https://github.com/de-arl/slurpshot

SHOTPATH=$(xdg-user-dir PICTURES)/screenshots
VIEWER=/usr/bin/imv

WINDOWS=`swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.visible and .pid) | "\(.app_id) \(.rect.x),\(.rect.y) \(.rect.width)x\(.rect.height)"'`
FOCUSED=`swaymsg -t get_tree | jq '.. | (.nodes? // empty)[] | select(.focused and .pid) | .rect | "\(.x),\(.y) \(.width)x\(.height)"'`

OPTIONS=(
    "Fullscreen"
    "Selection"
    "Focus"
    "$WINDOWS"
)

CHOICE=$(
    printf '%s\n' "${OPTIONS[@]}" | \
    fuzzel --dmenu --lines=10 --width=30 \
           --horizontal-pad=12 --vertical-pad=10 \
           --inner-pad=8 \
           --text-color=c5c8c6ff --selection-text-color=c5c8c6ff \
           --background=222426f2 --selection-color=373b41f2 \
           --font="CodeNewRoman NF:size=9,Anonymous Pro:size=9"
)

FILENAME="${SHOTPATH}/ps_$(date +'%Y-%m-%d-%H%M%S.png')"
GRID=\"$(echo $CHOICE | awk ' {print $2,$3} ')

# Name printed when viewing screenshot, adjust if you edit FILENAME
FILENAME_SHORT=${FILENAME: -32}

# If nothing was chosen, don't continue
if [ -z "$CHOICE" ]
then
    exit 0
elif [ "$CHOICE" = Fullscreen ]
then
    grim "$FILENAME"
elif [ "$CHOICE" = Selection ]
then
    grim -g "$(slurp)" "$FILENAME"
elif [ "$CHOICE" = Focus ]
then
    grim -g "$(eval echo $FOCUSED)" "$FILENAME"
else
    grim -g "$(eval echo $GRID)" "$FILENAME"
fi


RESULTS=(
    "View"
    "Save"
    "Copy"
    "Discard"
)

WAHL=$(
    printf '%s\n' "${RESULTS[@]}" | \
    wofi --dmenu --cache-file /dev/null \
         --height 225 --width 300 --prompt "What do you want to do?"
)


if [ "$WAHL" = View ]
then	
	$VIEWER $FILENAME &
elif [ "$WAHL" = Copy ]
then
    wl-copy < $FILENAME
elif [ "$WAHL" = Discard ]
then
	rm $FILENAME
else
	true
fi
exit 0
