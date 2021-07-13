#!/bin/bash

DIR=$(dirname $(readlink -f $0))
ISODATE=$(date --iso)

rsync -P $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc,.alacritty.yml} $DIR
rsync -P $HOME/.ncmpcpp/config $DIR/.ncmpcpp/
rsync -P $HOME/.config/picom.conf $DIR/config/
rsync -P $HOME/.config/mpd/mpd.conf $DIR/.config/mpd/
rsync -aP $HOME/.bin $DIR
rsync -aP $HOME/.config/fontconfig $DIR/.config/
rsync -aP $HOME/.config/sway $DIR/.config/
rsync -aP $HOME/.config/waybar $DIR/.config/
rsync -aP $HOME/.config/wlogout $DIR/.config/
rsync -aP $HOME/.config/kanshi $DIR/.config/

git -C $DIR add .
git -C $DIR commit -m "$ISODATE Update" 
