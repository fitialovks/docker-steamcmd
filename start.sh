#!/usr/bin/env bash

if [[ -z $TF_PORT ]]; then
	echo "TF_PORT is not set" >&2
	exit 1
fi

DIR=/home/tf2
cd $DIR/server
CMD="./srcds_run -port $TF_PORT -autoupdate -steam_dir $DIR -steamcmd_script $DIR/tf2.txt"
su tf2 -c "$CMD"
