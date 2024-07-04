set -qU XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -qU XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
set -qU XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
set -qU XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share

set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg
set -Ux GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc

set -Ux QT_STYLE_OVERRIDE kvantun
set -Ux MOZ_ENABLE_WAYLAND 1

# Global variables
set -gx EDITOR nvim

set -g EXA_COLORS "ur=1;35:uw=1;34:ux=1;36:ue=1;36"
# group permissions
set -ga EXA_COLORS ":gr=1;35:gw=1;34:gx=1;36"
# others
set -gax EXA_COLORS ":tr=1;35:tw=1;34:tx=1;36:uu=1;36:gu=1;34"

# LS_COLORS+=":ow=01;32"
set -gax LS_COLORS ":ow=01;34:di=01;34"

# pfetch
set -gax PF_INFO "ascii title os kernel pkgs shell wm theme palette"
