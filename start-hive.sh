#!/bin/bash

Image=tkanng/hive:3.1.1

# 容器8000端口暴露至宿主机10000端口
sudo docker run -itd \
                --net=hadoop \
                --name hive \
                --hostname hive \
                -p 10001:8000 \  
                $Image &> /dev/null