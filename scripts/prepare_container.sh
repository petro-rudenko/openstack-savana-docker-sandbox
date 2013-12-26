#!/usr/bin/env bash
yum -y install openssh-server openssh-clients wget tar
ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key 
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key 
sed -ri 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
echo 'root:hadoop' | chpasswd 
cd /tmp/provisioners 
chmod +x * 
./init.sh; ./install-hdp1.3.sh; ./disable-repos.sh; ./install-jdk.sh; ./cleanup.sh; 
#cd ../; rm -rf /tmp/*;
chmod +x /opt/start.sh
