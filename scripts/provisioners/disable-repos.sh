#!/bin/sh
#
# This script just changes the enabled flag to 0 to prevent yum install
# from going out over the network. It allows Savanna to provision VMs
# in disconnected mode.
#

find /etc/yum.repos.d -name "*.repo" -type f | xargs sed "s/enabled=1/enabled=0/" -i 
