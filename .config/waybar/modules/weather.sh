#!/bin/bash

# Set up caching to avoid tons of reqs to wttr
cachedir=~/.cache/rbn
cachefile=${0##*/}
# Manually set location for wttr
wttrdir=~/.config/wttr

if [ ! -d $cachedir ]; then
	mkdir -p $cachedir
fi

if [ ! -f $cachedir/$cachefile ]; then
	touch $cachedir/$cachefile
fi

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line.
IFS=$'\n'

cacheage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))
if [ $cacheage -gt 1740 ] || [ ! -s $cachedir/$cachefile ]; then
	# Reading manually set location
	if [ -f $wttrdir/geoloc ]; then
		location=$(head -n 1 $wttrdir/geoloc)
	fi
	format="%t;+%f;+%w;+%C;+%h;+%m;+%p;+%l"
	data=($(curl -s "https://en.wttr.in/$location?format=$format" 2>&1))

	echo $data >$cachedir/$cachefile
fi

IFS=';' read -r -a wdata <<<$(cat $cachedir/$cachefile)

if [[ ${wdata[0]} == Sorry* ]]; then
	wdata[0]='--'
fi

# Restore IFSClear
IFS=$SAVEIFS

echo -e "{\"text\":\"${wdata[0]}\",\"class\":\"weather\",\"alt\":\"${wdata[7]}\",\"tooltip\":\"${wdata[3]}\\\n Feels like:   ${wdata[1]}\\\n Wind:    ${wdata[2]}\\\n Humidity:    ${wdata[4]}\\\n Rain:    ${wdata[6]}\"}"
