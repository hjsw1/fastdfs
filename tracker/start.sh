#!/bin/bash
set -e
env
echo "Starting Tracker..."
/etc/init.d/fdfs_trackerd start

PID_TRACKERD=/home/dfs/data/fdfs_trackerd.pid

TIMES=50
while [ ! -f "$PID_TRACKERD" -a $TIMES -gt 0 ]
do
	echo "Waiting for the tracker"
    sleep 1s
	TIMES=`expr $TIMES - 1`
done

tail -f /home/dfs/logs/trackerd.log

exec "$@"
