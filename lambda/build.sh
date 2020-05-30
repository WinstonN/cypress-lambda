#!/bin/bash

# echo 'cleaning up system'
# yes | docker system prune -a
# yes | docker system prune --volumes

echo 'building docker image'
docker build --build-arg CACHE_BUST=$(date +%Y%m%d-%H%M%S) . -t cypress-lambda 

echo 'remove dangling docker'
docker image ls | grep none | awk '{ print $3 }' | xargs docker rmi --force

echo 'building deps'
./deps.sh

# echo 'restart docker'
# killall Docker && open /Applications/Docker.app

echo 'running the lambda function'
docker run --rm -v "$PWD":/var/task:ro -v "$PWD"/layer:/opt:ro,delegated lambci/lambda:nodejs10.x index.handler



