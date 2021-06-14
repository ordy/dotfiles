#!/bin/bash

location='Brussels,BE'

# Set up caching to avoid tons of reqs to wttr
cachedir=~/.cache/rbn
cachefile=${0##*/}-$location

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
    data=($(curl -s https://en.wttr.in/$location\?0qnT 2>&1))
    echo ${data[0]} | cut -f1 -d, > $cachedir/$cachefile
    echo ${data[1]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
    echo ${data[2]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
fi

weather=($(cat $cachedir/$cachefile))

# Restore IFSClear
IFS=$SAVEIFS

temperature=$(echo ${weather[2]} | sed -E 's/([[:digit:]])+\.\./\1 to /g')
#temperature=$(echo ${weather[2]} | sed 's/[^0-9]//g')

echo -e "{\"text\":\"$temperature\", \"class\": \"weather\", \"alt\":\""${weather[0]} ${weather[1]##*,} "\", \"tooltip\":\""${weather[0]}: $temperature ${weather[1]}"\"}"
