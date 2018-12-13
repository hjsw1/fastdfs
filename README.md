
# FastDFS 


## Prerequisites
docker 17.12.0+

## Description
Because the host networking driver only works on Linux hosts, so all commands below must be run on Linux
and ports 22122,23000 and 8888 must be free: 
* 22122 for tracker server
* 23000 for storage server
* 8888 for nginx server

Nginx and Storage on the same server.


## Run 

### Run tracker with host network mode
```
docker run  -d  --network=host  ypzhuang/tracker
```

### Run storage with host network mode , suppose the tracker host ip is 192.168.66.10
```
docker run  -d  --network=host  -e TRACKER_SERVER=192.168.66.10:22122 ypzhuang/storage
```

### Monitor fastdfs servers
```
docker run  --rm  -e TRACKER_SERVER=192.168.66.10:22122 ypzhuang/monitor
```


## Run in a host using docker compose,  suppose the  host ip is 192.168.66.10:
```
docker-compose -f docker-compose.yml up -d
```

## Run in a swarm cluster with only a manager,  suppose the  manager ip is 192.168.66.10:
```
docker stack deploy -c docker-cloud.yml fastdfs
```

## How to using the pictures that have uploaded to  fastdfs servers.

* Orinial image,suppose the store server is 192.168.66.10:
http://192.168.66.10:8888/group1/M00/00/00/wKhCClwRhl-AT_y8AAGt_FFM2T4145.jpg

* crop the original image to 30x30 thumbnail:
http://192.168.66.10:8888/group1/M00/00/00/wKhCClwRhl-AT_y8AAGt_FFM2T4145.jpg!30x30 

* resize the original image to 30x30 thumbnail :
http://192.168.66.10:8888/group1/M00/00/00/wKhCClwRhl-AT_y8AAGt_FFM2T4145_30x30.jpg!
