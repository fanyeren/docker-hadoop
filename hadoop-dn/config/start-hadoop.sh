#!/bin/bash

sleep 4
if [ "$NODE_TYPE" = "s" ]; then
   su - work -c "$HADOOP_INSTALL/sbin/hadoop-daemon.sh start datanode"
fi

service ssh start
service rsyslog start

/etc/serf/start-serf-agent.sh
