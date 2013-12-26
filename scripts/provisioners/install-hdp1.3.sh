#!/bin/bash

# ====== INSTALL Ambari =======
cd /tmp
wget -nv http://s3.amazonaws.com/public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.2.5.17/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum -y install ambari-server ambari-agent

# ====== INSTALL HDP =======
#wget -nv http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP/centos6/1.x/updates/1.3.2.0/hdp.repo -O /etc/yum.repos.d/hdp.repo

#yum -y install mysqld mysql mysql-server mysql-connector-java

#yum -y install net-snmp net-snmp-utils

#yum -y install hadoop hadoop-libhdfs hadoop-native hadoop-pipes hadoop-sbin hadoop-lzo lzo lzo-devel hadoop-lzo-native hadoop-mapreduce hadoop-mapreduce-historyserver  

#yum -y install snappy snappy-devel htpasswd glibc glibc.i686

#yum -y install oozie zookeeper hbase nagios-3.2.3 nagios-plugins-1.4.9 webhcat-tar-hive sqoop  oozie-client extjs-2.2-1 hive hcatalog pig webhcat-tar-pig 
#yum -y install hue

#yum -y install hdp_mon_nagios_addons hdo_mon_dashboard fping python-rrdtool rrdtool-devel rrdtool ambari-log4j 

#yum -y install ganglia-gmetad gweb hdp_mon_ganglia_addons ganglia-gmond ganglia-gmond-modules-python hdp_mon_ganglia_addons

#no package hdp_mon_dashboard htpasswd hadoop-mapreduce or hadoop-mapreduce-historyserver nagios-3.2.3 mysqld
