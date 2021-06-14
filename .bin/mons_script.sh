#!/bin/sh

case ${MONS_NUMBER} in
    1)
        mons -o
				feh --no-fehbg --bg-fill $(head -n 2 .config/nitrogen/bg-saved.cfg | tail -n 1 | cut -c 6-)
        ;;
    2)
        mons -e left
				feh --no-fehbg --bg-fill $(head -n 2 .config/nitrogen/bg-saved.cfg | tail -n 1 | cut -c 6-)
        ;;
    *)
        # Handle it manually
        ;;
esac
