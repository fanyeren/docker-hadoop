#!/bin/bash

sleep 4
if [ "$NODE_TYPE" = "m" ]; then
   su - work -c "$HADOOP_INSTALL/sbin/hadoop-daemon.sh start namenode"
   su - work -c "$HADOOP_INSTALL/sbin/hadoop-daemon.sh start datanode"
   #su work -c "$HADOOP_INSTALL/sbin/start-yarn.sh"
fi

service ssh start
service rsyslog start

/etc/serf/start-serf-agent.sh
