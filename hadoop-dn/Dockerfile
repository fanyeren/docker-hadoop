FROM xiahoufeng/hadoop-base

MAINTAINER xiahou feng

RUN apt-get install -y iputils-ping daemontools

ENV HADOOP_INSTALL /home/work/hadoop

RUN mkdir $HADOOP_INSTALL/logs
RUN mkdir -p /home/work/hdfs/datanode 

ADD config/hdfs-site.xml $HADOOP_INSTALL/etc/hadoop/hdfs-site.xml 
ADD config/core-site.xml $HADOOP_INSTALL/etc/hadoop/core-site.xml 
ADD config/mapred-site.xml $HADOOP_INSTALL/etc/hadoop/mapred-site.xml 
ADD config/yarn-site.xml $HADOOP_INSTALL/etc/hadoop/yarn-site.xml 

ADD config/start-hadoop.sh $HADOOP_INSTALL/bin/start-hadoop.sh
RUN chmod 755 $HADOOP_INSTALL/bin/start-hadoop.sh

RUN chown -R work:hadoop $HADOOP_INSTALL/logs
RUN chown -R work:hadoop /home/work

# SSH and SERF ports
EXPOSE 22 7373 7946 

# HDFS ports
EXPOSE 9000 50010 50020 50070 50075 50090 50475

# YARN ports
EXPOSE 8030 8031 8032 8033 8040 8042 8060 8088 50060

ENTRYPOINT ["/bin/bash", "/home/work/hadoop/bin/start-hadoop.sh"]
