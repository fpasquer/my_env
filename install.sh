#!/bin/sh

docker-machine rm -f myenv
docker-machine create -d virtualbox myenv
eval `docker-machine env myenv`
docker pull fpasquer/my_env
docker run -it fpasquer/my_env
