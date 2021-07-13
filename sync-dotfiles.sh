#!/bin/bash

DIR=$(dirname $(readlink -f $0))
ISODATE=$(date --iso)

rsync -P --delete-after $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc,.alacritty.yml} $DIR
rsync -P --delete-after $HOME/.ncmpcpp/config $DIR/.ncmpcpp/
rsync -P --delete-after $HOME/.config/picom.conf $DIR/config/
rsync -P --delete-after $HOME/.config/mpd/mpd.conf $DIR/.config/mpd/
rsync -aP --delete-after $HOME/.bin $DIR
rsync -aP --delete-after $HOME/.config/fontconfig $DIR/.config/
rsync -aP --delete-after $HOME/.config/sway $DIR/.config/
rsync -aP --delete-after $HOME/.config/waybar $DIR/.config/
rsync -aP --delete-after $HOME/.config/wlogout $DIR/.config/
rsync -aP --delete-after $HOME/.config/kanshi $DIR/.config/

git -C $DIR add .
git -C $DIR commit -m "$ISODATE Update"
git -C $DIR push --progress
