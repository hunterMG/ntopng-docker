ntopng-docker
=============

Run ntopng with Docker.

## Install & Run
```shell
docker run --net=host -t vyg1/ntopng <ntopng arguments>
```
Then visit `http://<host-ip>:3000`. 

## Build image for the newest version of ntopng
```shell
docker build -t ntopng-new .
```

## reference:
https://github.com/frostasm/ntopng-docker  
http://packages.ntop.org/apt-stable/  
https://github.com/lucaderi/ntopng-docker  
