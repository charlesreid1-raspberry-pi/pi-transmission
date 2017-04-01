#!/bin/bash
#
# Check if stunnel is running. 
# If not, try to start it.
# In any case, try to rsync.
# Then take a nap.

while true; do

	echo "$(ps aux | grep [s]tunnel | grep -v check_stunnel)" 
	if [[ "$(ps aux | grep [s]tunnel | grep -v check_stunnel)" == "" ]]; then
		echo "Stunnel not running, trying to start it..."
		stunnel
		sleep 10
		if [[ "$(ps aux | grep [s]tunnel | grep -v check_stunnel)" == "" ]]; then
			echo "No die!"
		fi
	fi

	# If stunnel is not running, this will raise an error and keep going.
	# Do rsync here
	./rsync_with_server.sh

	# wait X seconds, then do it again.
	sleep 30;

done
