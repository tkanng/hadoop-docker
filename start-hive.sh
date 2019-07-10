#!/bin/bash

Image=tkanng/hive:3.1.1
sudo docker run -itd -p 10000:8000 \
                --net=hadoop \
                --name hive \
                --hostname hive \
                $Image &> /dev/null


echo "Initialize schema: "
echo "cd \$HIVE_HOME && bin/schematool -dbType derby -initSchema"
echo "Debug hive: "
echo "cd \$HIVE_HOME && bin/hive  --debug:port=8001  -hiveconf hive.root.logger=DEBUG,console"

echo "Entering hive container......"
sudo docker exec -it hive bash
