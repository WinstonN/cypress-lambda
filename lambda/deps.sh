#!/bin/bash

# echo 'attempting to remove cypress-lambda container...'
docker rm cypress-lambda

echo 'removing lib tar'
rm -rf ./lib.tar.gz
rm -rf ./lib64.tar.gz

echo 'running cypress-lambda container for a sec...'
docker run --name cypress-lambda cypress-lambda sleep 1

echo 'copying lib and archives into the lambda directory'
docker cp cypress-lambda:/app/lib.tar.gz .
docker cp cypress-lambda:/app/lib64.tar.gz .

echo 'and node modules and Xvfb...'
docker cp -L cypress-lambda:/app/node_modules .
docker cp -L cypress-lambda:/usr/bin/Xvfb .

# echo 'attempting to remove cypress-lambda container...'
# docker rm cypress-lambda

echo 'done'
