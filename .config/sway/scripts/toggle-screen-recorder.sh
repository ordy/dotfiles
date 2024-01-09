#!/bin/bash
pid=$(pgrep wf-recorder)
status=$?

if [ $status != 0 ]; then
	wf-recorder -g "$(slurp)" -f $HOME/Videos/$(date +'recording_%Y-%m-%d-%H%M%S.mp4')
else
	pkill --signal SIGINT wf-recorder
fi
