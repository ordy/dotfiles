#!/bin/bash

rsync $HOME/{.zshrc,.bash_profile,.bashrc,.dir_colors,.pam_environment,.vimrc,.xbindkeysrc,.Xresources} .
rsync $HOME/.ncmpcpp/config ./.ncmpcpp/
rsync $HOME/.config/autostart/xbindkeys.desktop ./.config/autostart/
rsync $HOME/.config/mpd/mpd.conf ./.config/mpd/
rsync -a $HOME/.config/cantata ./.config/
rsync -a $HOME/.config/fontconfig ./.config/
