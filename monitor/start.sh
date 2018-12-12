#!/bin/bash
set -e
env

if [ -n "$TRACKER_SERVER" ] ; then 
	sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/storage.conf
fi

/usr/bin/fdfs_monitor /etc/fdfs/storage.conf

exec "$@"
