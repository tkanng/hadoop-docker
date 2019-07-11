#!/bin/bash



echo "stop hadoop containers..."

docker rm -f $(docker ps -a --format '{{.Names}}' | grep hadoop-)

echo "stop hive container....."
docker rm -f hive

