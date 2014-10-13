#!/bin/bash

docker run -d -t --dns 127.0.0.1 -p 33001:22 -e NODE_TYPE=s -P --name slave1 -h dn1.xiahoufeng.com xiahoufeng/hadoop-dn
docker run -d -t --dns 127.0.0.1 -p 33302:22 -e NODE_TYPE=s -P --name slave2 -h dn2.xiahoufeng.com xiahoufeng/hadoop-dn
FIRST_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" slave1)
SECOND_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" slave2)
docker run -i -t --dns 127.0.0.1 -p 30001:22 -e NODE_TYPE=m -e JOIN_IP=$FIRST_IP,$SECOND_IP -P --name master -h nn0.xiahoufeng.com xiahoufeng/hadoop-nn

