#!/bin/bash

options=(--archive --progress --delete-after --ignore-missing-args)

# script in .bin sym linked to sync-dotfiles.sh
# BACKUP is the path to the script location
BACKUP=$(dirname $(readlink -f $0))
ISODATE=$(date --iso)

# files
rsync "${options[@]}" \
$HOME/{\
	.zshrc,\
	.p10k.zsh,\
	.bash_profile,\
	.bashrc,\
	.dir_colors,\
	.vimrc,\
	.imwheelrc,\
	.alacritty.yml,\
	.bin\
} $BACKUP

# directories
rsync "${options[@]}" $HOME/.ncmpcpp/config $BACKUP/.ncmpcpp/
rsync "${options[@]}" $HOME/.config/mpd/mpd.conf $BACKUP/.config/mpd/

# config directory
rsync "${options[@]}" \
	$HOME/.config/fontconfig \
	$HOME/.config/sway \
	$HOME/.config/waybar \
	$HOME/.config/wlogout \
	$HOME/.config/kanshi \
	$HOME/.config/rofi \
	$HOME/.config/kitty \
	$HOME/.config/xbindkeys \
	$HOME/.config/X11 \
	$HOME/.config/picom.conf \
$BACKUP/.config/

git -C $BACKUP add .
git -C $BACKUP commit -m "$ISODATE Update"
git -C $BACKUP push --progress
