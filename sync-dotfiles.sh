#!/bin/bash

DIR=$(dirname $(readlink -f $0))
ISODATE=$(date --iso)

rsync -Pr --delete-after $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc,.alacritty.yml} $DIR
rsync -Pr --delete-after $HOME/.ncmpcpp/config $DIR/.ncmpcpp/
rsync -Pr --delete-after $HOME/.config/picom.conf $DIR/config/
rsync -Pr --delete-after $HOME/.config/mpd/mpd.conf $DIR/.config/mpd/
rsync -aPr --delete-after $HOME/.bin $DIR
rsync -aPr --delete-after $HOME/.config/fontconfig $DIR/.config/
rsync -aPr --delete-after $HOME/.config/sway $DIR/.config/
rsync -aPr --delete-after $HOME/.config/waybar $DIR/.config/
rsync -aPr --delete-after $HOME/.config/wlogout $DIR/.config/
rsync -aPr --delete-after $HOME/.config/kanshi $DIR/.config/
rsync -aPr --delete-after $HOME/.config/rofi $DIR/.config/

git -C $DIR add .
git -C $DIR commit -m "$ISODATE Update"
git -C $DIR push --progress
