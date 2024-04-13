if [ -n "$DESKTOP_SESSION" ];then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
fi

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
  source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

if [ -z "$XDG_CURRENT_DESKTOP" ]; then
	export XDG_CURRENT_DESKTOP=Hyprland
	export XDG_SESSION_DESKTOP=Hyprland
fi

if [[ -z $DISPLAY && $(tty) == /dev/tty1 && $XDG_SESSION_TYPE == tty ]]; then
	exec Hyprland
fi

# Created by `pipx` on 2023-06-07 10:44:46
export PATH="$PATH:/home/sano/.local/bin"
