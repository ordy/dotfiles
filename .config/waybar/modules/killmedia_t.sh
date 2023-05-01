#!/bin/bash

kill -9 $(ps -ax | grep "[m]ediaplayer_t.py" | awk '{print $1}')
./mediaplayer_t.py 2>/dev/null
