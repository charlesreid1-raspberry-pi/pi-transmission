# pi-transmission

Scripts for transmission of data from Raspberry Pi to external server.
This checks if stunnel is running, and if so, attempts to run rsync 
to remotely sync the data generated with a remote server.

## setup rsync confing script

(SERVER ONLY)

This script gets the rsync configuration file in this repo 
set up on the rsync (and stunnel) server.

The config file specifies the name of the rsync target (pi) 
and what to do with traffic that is marked for pi.

```
./setup_rsync.sh
```

## check stunnel

(THIS SCRIPT CALLS rsync with server SCRIPT BELOW)

This script will check if stunnel is running, and try to start it if it is not.
It will then try to rsync the wifi data directory with the remote server, 
by calling the rsync with server script (below).
Then it will take a nap and try again.

## rsync with server

(THIS SCRIPT CALLED BY check stunnel SCRIPT ABOVE)

Once we have rsync all set up, and stunnel is operating,
we can route rsync traffic through localhost by just specifying
localhost as the rsync target:

```
rsync -vv -aR ${ClientPath} localhost::pi
```

