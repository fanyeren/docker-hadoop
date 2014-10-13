#!/bin/bash

docker run -d --dns 127.0.0.1 -p 33001:22 -e NODE_TYPE=s -P --name slave1 -h dn1.xiahoufeng.com xiahoufeng/hadoop-dn
sleep 2
FIRST_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" slave1)

docker run -d --dns 127.0.0.1 -p 33002:22 -e NODE_TYPE=s -P --name slave2 -h dn2.xiahoufeng.com -e JOIN_IP=$FIRST_IP xiahoufeng/hadoop-dn
sleep 2
docker run -d --dns 127.0.0.1 -p 33003:22 -e NODE_TYPE=s -P --name slave3 -h dn3.xiahoufeng.com -e JOIN_IP=$FIRST_IP xiahoufeng/hadoop-dn
sleep 2
docker run -d --dns 127.0.0.1 -p 33004:22 -e NODE_TYPE=s -P --name slave4 -h dn4.xiahoufeng.com -e JOIN_IP=$FIRST_IP xiahoufeng/hadoop-dn
sleep 2
docker run -d --dns 127.0.0.1 -p 33005:22 -e NODE_TYPE=s -P --name slave5 -h dn5.xiahoufeng.com -e JOIN_IP=$FIRST_IP xiahoufeng/hadoop-dn
sleep 2
docker run -d --dns 127.0.0.1 -p 30001:22 -e NODE_TYPE=m -P --name master -h nn0.xiahoufeng.com -e JOIN_IP=$FIRST_IP xiahoufeng/hadoop-nn
