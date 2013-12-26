#!/bin/bash

# ====== INSTALL Ambari =======
cd /tmp
wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum -y install ambari-server ambari-agent

# ====== INSTALL HDP =======
wget -nv http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP-2.0.0.2/repos/centos6/hdp.repo  -O /etc/yum.repos.d/hdp.repo

yum -y install hadoop-libhdfs hadoop-native hadoop-pipes hadoop-sbin hadoop-lzo hadoop-lzo-native hadoop-mapreduce hadoop-mapreduce-historyserver nagios-3.2.3

