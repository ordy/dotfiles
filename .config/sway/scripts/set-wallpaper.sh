#!/bin/sh

if [ -z $1]; then
  FILENAME=$(<"$HOME/.current-wallpaper")
else
  FILENAME=$(echo $1 | sed -e 's/\r//g')
  echo $FILENAME >$HOME/.current-wallpaper
fi

pkill swaybg
swaybg -o '*' -i $FILENAME -m fill &

exit 0
