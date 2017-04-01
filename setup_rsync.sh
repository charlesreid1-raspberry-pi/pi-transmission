#!/bin/bash
#
# run this on the raspberry pi 
# to set up rsync from the client side.

echo "Backing up /etc/rsyncd.conf to /etc/rsyncd.conf.bak"
mv /etc/rsyncd.conf{,.bak}

echo "Installing rsyncd.conf to /etc/rsyncd.conf" 
cp rsyncd.conf /etc/rsyncd.conf

