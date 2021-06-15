#!/bin/bash

rsync $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc,.alacritty.yml} .
rsync $HOME/.ncmpcpp/config ./.ncmpcpp/
rsync $HOME/.config/picom.conf ./.config/
rsync $HOME/.config/mpd/mpd.conf ./.config/mpd/
rsync -a $HOME/.bin .
rsync -a $HOME/.config/fontconfig ./.config/
rsync -a $HOME/.config/sway ./.config/
rsync -a $HOME/.config/waybar ./.config/
rsync -a $HOME/.config/wlogout ./.config/
rsync -a $HOME/.config/kanshi ./.config/
