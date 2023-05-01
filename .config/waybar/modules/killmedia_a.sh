#!/bin/bash

exec kill -9 $(ps -ax | grep "[m]ediaplayer_a.py" | awk '{print $1}')
exec ./mediaplayer_a.py 2>/dev/null
