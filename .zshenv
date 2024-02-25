export PATH="${PATH}:${HOME}/.bin:${HOME}/.cargo/bin"
export PATH="$PATH:/home/sano/.local/bin"

# XDG
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# XDG relocation
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_DATA_HOME"/zsh/history

# man page colors
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\e[1;35m'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;36m'

# EXA Colors
# user permissions
EXA_COLORS="ur=1;35:uw=1;34:ux=1;36:ue=1;36"
# group permissions
EXA_COLORS+=":gr=1;35:gw=1;34:gx=1;36"
# others
EXA_COLORS+=":tr=1;35:tw=1;34:tx=1;36:uu=1;36:gu=1;34"
export EXA_COLORS

LS_COLORS+=":ow=01;35"
export LS_COLORS

# pfetch
export PF_INFO="ascii title os kernel pkgs shell wm theme palette"

# variables
export QT_STYLE_OVERRIDE=kvantum
# export QT_QPA_PLATFORM=wayland
# export QT_QPA_PLATFORMTHEME=qt5ct
export MOZ_ENABLE_WAYLAND=1
export TERMINAL=kitty
export EDITOR=nvim
