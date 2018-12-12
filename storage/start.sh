#!/bin/bash
set -e
env

if [ -n "$TRACKER_SERVER" ] ; then 
	sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/storage.conf
        sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/mod_fastdfs.conf	
fi

echo "Starting Storge..."
/etc/init.d/fdfs_storaged start

PID_STORAGED=/home/dfs/data/fdfs_storaged.pid

TIMES=50
while [ ! -f "$PID_STORAGED" -a $TIMES -gt 0 ]
do
	echo "Waiting for the storage"
    sleep 1s
	TIMES=`expr $TIMES - 1`
done

more /home/dfs/logs/storaged.log
/usr/local/nginx/sbin/nginx -g "daemon off;"

exec "$@"
