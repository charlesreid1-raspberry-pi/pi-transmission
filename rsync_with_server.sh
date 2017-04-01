#!/bin/bash
# 
# This script synchronizes ${HOME}/wifi with <remote>::/wifi
# over an encrypted stunnel connection.
#
# CSV files are timestamped with hostname/time/date and will be unique.
#
# The trick to using stunnel is, <remote>::/wifi is 127.0.0.1::/wifi 
# over port X (remote connection is handled by stunnel).
# 
# see http://www.netbits.us/docs/stunnel_rsync.html


# destination on frohike is set in config file:
# /wifi
rsync -vv -aR /path/to/data.file localhost::frohike

