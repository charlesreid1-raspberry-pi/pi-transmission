#!/bin/bash
#
# run this on the raspberry pi 
# to set up rsync from the client side.

# set path for rsyncing
CLIENT_NAME="${HOSTNAME}"
CLIENT_PATH="${HOME}/wifi/"
REMOTE_PATH="/wifi/" # reidmachine.party

# fix up rsyncd.conf before putting it in /etc/rsyncd.conf
sed "s'NAMENAME'${CLIENT_NAME}';s'PATHPATH'${CLIENT_PATH}'" rsync.conf > rsync.conf.new
#cat rsync.conf.new
cp rsync.conf.new /etc/rsync.conf

# clean up
rm rsync.conf.new
