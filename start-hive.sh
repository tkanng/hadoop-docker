#!/bin/bash

Image=tkanng/hive:2.3.5

# sudo docker rm -f hive &> /dev/null
# 将8000端口映射到10000端口，IDEA连接宿主机IP:10000端口即可
sudo docker run -itd -p 10000:8000 \
                --net=hadoop \
                --name hive \
                --hostname hive \
                $Image &> /dev/null


echo "Initialize schema: "
echo "cd \$HIVE_HOME && bin/schematool -dbType derby -initSchema"
echo "Debug hive: "
echo "cd \$HIVE_HOME && bin/hive  --debug:port=8000  -hiveconf hive.root.logger=DEBUG,console"

echo "Entering hive container......"
sudo docker exec -it hive bash
