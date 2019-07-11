#!/bin/bash

#echo "Building hadoop base image...."
#docker build -f Dockerfile.base -t tkanng/hadoop:base . 

echo "Building hadoop image..."
docker build -f Dockerfile -t tkanng/hadoop:2.7.7 . 

echo "Building hive image...."
docker build -f Dockerfile.hive -t tkanng/hive:3.1.1 . 




