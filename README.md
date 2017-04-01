# pi-transmission

Scripts for transmission of data from Raspberry Pi to external server.
This checks if stunnel is running, and if so, attempts to run rsync 
to remotely sync the data generated with a remote server.

Note this assumes the existence of a writable directory at /wifi:

```plain
mkdir /wifi
chown user:group /wifi
```

## Server: setup rsync confing script

(SERVER ONLY)

This script gets the rsync configuration file in this repo 
set up on the rsync (and stunnel) server.

The config file specifies the name of the rsync target (pi) 
and what to do with traffic that is marked for pi.

```
[remote] $ ./setup_rsync.sh
```

Now that the rsync configuration has been installed, you can 
start the rsync service:

```plain
[remote] $ sudo service rsync start
```

## Client: check stunnel forever loop

(CLIENT ONLY; this calls the rsync with server script below.)

This script will loop forever and perform the following action:
Check if stunnel is running. Try to start it if it is not.
Attempt to rsync the wifi data directory with the remote server
using the rsync with server script (below).

Take a nap for 5 minutes and try again. 

```plain
[client] $ ./check_stunnel.sh
```

If you just want to check if rsync is working, use the script below by itself.

## rsync with server

(CLIENT ONLY; this is called by the check stunnel script above)

Once we have rsync all set up, and stunnel is operating,
we can route rsync traffic through localhost by just specifying
localhost as the rsync target:

```
[client] $ rsync -vv -aR ${ClientPath} localhost::pi
```

That's basically all that this script does.

