#!/bin/bash

Image=tkanng/hive:3.1.1
sudo docker run -itd -p 10000:8000 \
                --net=hadoop \
                --name hive \
                --hostname hive \
                $Image &> /dev/null
