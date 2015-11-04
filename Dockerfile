FORM sequenceiq/ambari:2.1.2-v1
MAINTAINER Zqin

ENV EAGLE_DOWNLOAD_LINK http://10.65.246.34:8081/view/Eagle-Security/job/Eagle-SCM/ws/eagle-assembly/target/eagle-0.1.0-bin.tar.gz

RUN curl -sL $EAGLE_DOWNLOAD_LINK | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./eagle-0.1.0-bin eagle
ENV EAGLE_HOME=/usr/local/eagle

RUN yum install -y kafka zookeeper storm hbase tez hadoop snappy snappy-devel hadoop-libhdfs ambari-log4j hive hive-hcatalog hive-webhcat webhcat-tar-hive webhcat-tar-pig mysql-connector-java mysql-server

ADD serf /usr/local/serf

ADD install-cluster.sh /tmp/
ADD eagle-singlenode.json /tmp/
ADD eagle-multinode.json /tmp/
ADD wait-for-eagle.sh /tmp/
ADD deploy-eagle.sh /usr/local/eagle/deploy.sh

EXPOSE 9099
