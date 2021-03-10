#!/bin/bash

rsync $HOME/{.zshrc,.p10k.zsh,.bash_profile,.bashrc,.dir_colors,.vimrc,.xbindkeysrc,.Xresources,.imwheelrc} .
rsync $HOME/.ncmpcpp/config ./.ncmpcpp/
rsync $HOME/.config/picom.conf ./.config/
rsync $HOME/.config/autostart/xbindkeys.desktop ./.config/autostart/
rsync $HOME/.config/mpd/mpd.conf ./.config/mpd/
rsync -a $HOME/.config/cantata ./.config/
rsync -a $HOME/.config/fontconfig ./.config/
