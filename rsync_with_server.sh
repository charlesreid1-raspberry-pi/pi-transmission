#!/bin/bash

# Behavior of program:
# - aircrack batch creates csv files
# - csv files are stamped with hostname/date/time
# - rsync to upload/sync csv file directory w server
# - wifi data in specified location on remote server

client_wifi="${HOME}/wifi/"

