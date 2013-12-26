#!/bin/bash
yum install -y wget
yum install -y ntp
yum -y install bind-utils

cd /tmp
# ====== EPEL =======
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm

#install cloud-inint which is necessary for all images
yum install -y cloud-init

# change the cloud-init user to root
sed "s/ec2-user/root/" -i /etc/cloud/cloud.cfg
sed "s/disable_root: 1/disable_root: 0/" -i /etc/cloud/cloud.cfg
sed "/\s-\sset_hostname/d" -i /etc/cloud/cloud.cfg

# ====== COMMENT OUT Defaults requiretty in /etc/sudoers ========
sed '/^Defaults    requiretty*/ s/^/#/' /etc/sudoers > /tmp/sudoers
mv -f /tmp/sudoers /etc/sudoers

# add .ssh directory for all new users
mkdir -p /etc/skel/.ssh
chmod 700 /etc/skel/.ssh

# Create .ssh directory in case it does not already exist
if [ ! -d /root/.ssh ]; then
  mkdir -p /root/.ssh
  chmod 700 /root/.ssh
fi

# Turn off iptables
/etc/init.d/iptables save
/etc/init.d/iptables stop
chkconfig iptables off
chkconfig ip6tables off

# disable transparent huge pages
#echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag
#echo never > /sys/kernel/mm/redhat_transparent_hugepage/enabled

#TODO:
#etc/cloud/cloud-config and set disable_root: 0

