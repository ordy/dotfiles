# https://github.com/swaywm/sway/wiki#configuration
# If it is a login shell running from tty1 then start sway

if status is-login
    set TTY1 (tty)
    if [ "$TTY1" = /dev/tty1 ]
        set -Ux XDG_DATA_DIRS $HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
        exec sway &>~/.Wsession.errors
    end
end
