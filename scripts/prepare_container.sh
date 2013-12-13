#!/usr/bin/env bash

ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key 
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config 
echo 'root:hadoop' | chpasswd 
cd /tmp 
wget http://dev2.hortonworks.com.s3.amazonaws.com/stuff/openstack/provisioners.tar.gz 
tar xvf provisioners.tar.gz 
cd /tmp/provisioners 
chmod +x * 
./init.sh; ./install-hdp1.3.sh; ./disable-repos.sh; ./install-jdk.sh; ./cleanup.sh; ./nozeroconf.sh; 
cd ../; rm -rf /tmp/*;
cd /root 
wget http://dev2.hortonworks.com.s3.amazonaws.com/stuff/openstack/ssh.tar.gz
tar xvf ssh.tar.gz 
rm -f ssh.tar.gz 
chmod 600 .ssh/id_rsa;
