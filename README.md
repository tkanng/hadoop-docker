
## 利用Docker启动Hadoop集群与Hive并调试

### 一、 使用说明
1. 启动Hadoop集群：
```
./start-all.sh
```
如下图：
![](./images/hadoop.gif)
2. 启动Hive:
```
./start-hive.sh
```
3. 停止Hadoop集群与Hive:
```
./stop-all.sh
```


### 二、调试Hive
1. 初始化Hive并打开调试模式
```
docker exec -it hive bash

cd $HIVE_HOME && bin/schematool -dbType derby -initSchema

# 指定8000端口作为调试端口(**容器内端口**)，默认将8000端口映射到宿主机的10000端口。
cd $HIVE_HOME && bin/hive  --debug:port=8000  -hiveconf hive.root.logger=DEBUG,console

```
如下图:
![](./images/start-hive.png)

2. IDEA远程调试Hive
默认情况下，Hive容器的8000端口映射到了宿主机的10000端口（可以在`start-hive.sh`中修改）。IDEA进行远程调试时，指定号宿主机IP:10000端口即可。\
IDEA调试配置图：
![](./images/IDEA.png)
IDEA调试示意图：
![](./images/IDEA-debug.png)


### 三、编译其他版本
编译其他版本的Hadoop和Hive，只需修改`Dockerfile`与`Dockerfile.hive`，或者在编译时指定`--build-arg`参数即可，如：

```
docker build -f Dockerfile --build-arg HADOOP_VERSION=2.9.5 -t tkanng/hadoop:2.9.5 . 
```
