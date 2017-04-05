#!/bin/bash
# 
# This script uses rsync to synchronize <client>:~/wifi with <server>:/wifi
# using an stunnel connection. 
#
# CSV files are timestamped with hostname/time/date and will be unique.
#
# The trick to using stunnel is not making connection to the remote machine directly.
# Connect to a local port and let stunnel handle the remote connection. 
# 
# see http://www.netbits.us/docs/stunnel_rsync.html

ClientPath="/wifi/"

# destination on frohike is set in config file:
# /wifi
rsync -vv -a ${ClientPath} localhost::pi

