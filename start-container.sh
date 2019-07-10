#!/bin/bash
# create hadoop network, docker network create --driver=bridge hadoop

# the default node number is 3
N=${1:-3}

Image=tkanng/hadoop:2.7.7

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                $Image &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                $Image &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
