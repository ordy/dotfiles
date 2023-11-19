#!/bin/sh

if [ -z "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"]; then
	FILENAME=$(<"$HOME/.current-wallpaper")
else
	FILENAME=$(echo $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS | sed -e 's/\r//g')
	echo $FILENAME >$HOME/.current-wallpaper
fi

pkill swaybg
swaybg -o '*' -i $FILENAME -m fill &

exit 0
