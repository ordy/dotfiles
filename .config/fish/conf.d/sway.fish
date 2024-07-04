# https://github.com/swaywm/sway/wiki#configuration
# If it is a login shell running from tty1 then start sway

if status is-login
    set TTY1 (tty)
    [ "$TTY1" = /dev/tty1 ] && exec sway &>~/.Wsession.errors
end
