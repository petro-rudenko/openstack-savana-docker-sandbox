#!/bin/bash


# ===== CLEANUP AFTER VBOX =====

# ===== CLEANUP MISC  =====
#yum remove -y kernel-devel
yum clean all
rm -rf /var/cache/* 

# ===== CLEANUP NETWORKING =====
#rm -f /etc/udev/rules.d/70-persistent-net.rules
