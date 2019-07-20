#!/bin/bash


echo "copy distributed shell jar to container."



echo "Running distributed shell."
cd /home && hadoop jar hadoop-yarn-applications-distributedshell*.jar org.apache.hadoop.yarn.applications.distributedshell.Client -jar hadoop-yarn-applications-distributedshell*.jar -shell_command '/bin/date && cat /etc/hosts' -num_containers 1



