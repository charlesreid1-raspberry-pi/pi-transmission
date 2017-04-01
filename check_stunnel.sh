#!/bin/bash
#
# Check if stunnel has a connection to the server
# We expect the connection to happen on port 443

while true; do

	if [[ "$(ps aux | grep [s]tunnel)" == "" ]]; then
		stunnel
		sleep 15
	fi
	# else: stunnel is running

	# Do rsync here
	./rsync_with_server.sh

	# wait 2 minutes, then do it again.
	sleep 120;

done
