#!/bin/bash

# script in .bin sym linked to sync-dotfiles.sh
# BACKUP is the path to the script location
BACKUP=$(dirname $(readlink -f $0))
ISODATE=$(date --iso)

git -C $BACKUP add .
git -C $BACKUP commit -m "$ISODATE Update"
git -C $BACKUP push --progress
