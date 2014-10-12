FROM xiahoufeng/serf
MAINTAINER xiahou feng

RUN addgroup hadoop
RUN useradd -d /home/work -m -s /bin/bash -G hadoop work
RUN mkdir -p /home/work/opdir

ADD jdk7.tar.gz /home/work/opdir

ADD apache-maven-3.2.3-bin.tar.gz /home/work/opdir/
RUN cd /home/work && ln -s opdir/apache-maven-3.2.3 maven

ENV JAVA_HOME /home/work/opdir/jdk/default
ENV PATH $PATH:$JAVA_HOME/bin:/home/work/maven/bin
ENV http_proxy http://m1-imci-dev00.m1:3128
ENV https_proxy https://m1-imci-dev00.m1:3128

# Update Ubuntu
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y llvm-gcc build-essential zlib1g-dev make cmake pkg-config libssl-dev automake autoconf 

RUN su work -c "ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ''"
RUN su work -c "cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys" 
ADD config/ssh_config ./ssh_config
RUN mv ./ssh_config /home/work/.ssh/config

RUN wget http://apache.mirror.anlx.net/hadoop/core/hadoop-2.3.0/hadoop-2.3.0-src.tar.gz 
RUN tar xvf hadoop-2.3.0-src.tar.gz  

ADD protobuf-2.5.0.tar.gz /home/work/opdir
RUN cd /home/work/opdir/protobuf-2.5.0 && ./configure
RUN cd /home/work/opdir/protobuf-2.5.0 && make
RUN cd /home/work/opdir/protobuf-2.5.0 && make check 
RUN cd /home/work/opdir/protobuf-2.5.0 && make install  
RUN cd /home/work/opdir/protobuf-2.5.0 && ldconfig  

#RUN apt-get install -y libprotobuf-dev protobuf-c-compiler protobuf-compiler

#RUN dpkg -L protobuf-compiler
RUN which protoc

ENV MAVEN_OPTS -Xms1024m -XX:MaxPermSize=256m -Xmx1024m
RUN mkdir /root/.m2
RUN mkdir /root/.ant
ADD config/m2_config /root/.m2/settings.xml
ADD config/m2_config /root/.ant/settings.xml
RUN cd hadoop-2.3.0-src && mvn package -Pdist,native -DskipTests -Dtar  

RUN  cd hadoop-2.3.0-src && tar xvf hadoop-dist/target/hadoop-2.3.0.tar.gz -C /usr/local/  
RUN ln -s /home/work/hadoop-2.3.0 /home/work/hadoop
RUN chown -R work:hadoop /home/work/hadoop-2.3.0

ADD config/bashrc /home/work/.bashrc

RUN rm -f /home/work/hadoop/etc/hadoop/hadoop-env.sh 
ADD config/hadoop-env.sh /home/work/hadoop/etc/hadoop/hadoop-env.sh 

EXPOSE 2222
