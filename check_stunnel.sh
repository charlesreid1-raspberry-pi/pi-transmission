#!/bin/bash
#
# Check if stunnel is running. 
# If not, try to start it.
# In any case, try to rsync.
# Then take a nap.

while true; do

	if [[ "$(ps aux | grep [s]tunnel)" == "" ]]; then
		stunnel
		sleep 15
	fi
	# else: stunnel is running

	# Do rsync here
	./rsync_with_server.sh

	# wait 5 minutes, then do it again.
	sleep 300;

done
