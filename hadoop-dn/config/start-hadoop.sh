#!/bin/bash

sleep 4
if [ "$NODE_TYPE" = "m" ]; then
   su - work -c "$HADOOP_INSTALL/sbin/hadoop-daemon.sh start datanode"
fi

/etc/serf/start-serf-agent.sh
