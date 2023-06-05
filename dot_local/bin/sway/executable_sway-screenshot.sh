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
    fuzzel --dmenu --lines=10 --width=30
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
    fuzzel --dmenu --lines=10 --width=30 --layer=overlay
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
