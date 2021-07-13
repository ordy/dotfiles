#!/bin/bash

rsync -v $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc,.alacritty.yml} .
rsync -v $HOME/.ncmpcpp/config ./.ncmpcpp/
rsync -v $HOME/.config/picom.conf ./.config/
rsync -v $HOME/.config/mpd/mpd.conf ./.config/mpd/
rsync -av $HOME/.bin .
rsync -av $HOME/.config/fontconfig ./.config/
rsync -av $HOME/.config/sway ./.config/
rsync -av $HOME/.config/waybar ./.config/
rsync -av $HOME/.config/wlogout ./.config/
rsync -av $HOME/.config/kanshi ./.config/
