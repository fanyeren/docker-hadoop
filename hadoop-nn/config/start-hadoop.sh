#!/bin/bash

/usr/bin/svscan /etc/service/ &
sleep 4
if [ "$NODE_TYPE" = "m" ]; then
   su work -c "$HADOOP_INSTALL/sbin/start-dfs.sh"
   su work -c "$HADOOP_INSTALL/sbin/start-yarn.sh"
fi
#tail -f $HADOOP_INSTALL/logs/*
