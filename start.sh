#!/bin/bash
set -e
env

TRACKER_SERVER=`ifconfig |grep 'inet'|awk {'print $2'}|grep 172`:22122
export TRACKER_SERVER
echo $TRACKER_SERVER

if [ -n "$TRACKER_SERVER" ] ; then 
	sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/storage.conf
	sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/client.conf
	sed -i "s|tracker_server=.*$|tracker_server=${TRACKER_SERVER}|g" /etc/fdfs/mod_fastdfs.conf 
fi


echo "Starting Tracker..."
/etc/init.d/fdfs_trackerd start

echo "Starting Storge..."
/etc/init.d/fdfs_storaged start

echo "Starting Nginx..."
/usr/local/nginx/sbin/nginx

PID_TRACKERD=/home/dfs/data/fdfs_trackerd.pid
PID_STORAGED=/home/dfs/data/fdfs_storaged.pid

TIMES=50
while [ ! -f "$PID_TRACKERD" -a $TIMES -gt 0 ]
do
	echo "Waiting for the tracker"
    sleep 1s
	TIMES=`expr $TIMES - 1`
done

TIMES=50
# while [ ! -f "$PID_STORAGED" -a $TIMES -gt 0 ]
# do
# 	echo "Waiting for the storage"
#     sleep 1s
# 	TIMES=`expr $TIMES - 1`
# done

tail -f /home/dfs/logs/trackerd.log /home/dfs/logs/storaged.log

exec "$@"