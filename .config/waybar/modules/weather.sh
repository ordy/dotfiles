#!/bin/bash

# Set up caching to avoid tons of reqs to wttr
cachedir=~/.cache/rbn
cachefile=${0##*/}

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
  data=($(curl -s https://en.wttr.in\?format\="%t;+%f;+%w;+%C;+%h;+%m;+%p;+%l" 2>&1))
  echo $data > $cachedir/$cachefile
fi

IFS=';' read -r -a wdata <<< $(cat $cachedir/$cachefile)

# Restore IFSClear
IFS=$SAVEIFS

echo -e "{\"text\":\"${wdata[0]}\",\"class\":\"weather\",\"alt\":\"${wdata[7]}\",\"tooltip\":\"${wdata[3]}${wdata[0]}\\\n Feels like: ${wdata[1]}\\\n Wind: ${wdata[2]}\\\n Humidity: ${wdata[4]}\\\n Precipitation: ${wdata[6]}\"}"
