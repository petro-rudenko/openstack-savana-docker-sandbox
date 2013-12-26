FROM centos:6.4
MAINTAINER Peter Rudenko <prudenko@hortonworks.com>

ADD start.sh /opt/start.sh
ADD provisioners /tmp/provisioners
ADD prepare_container.sh /tmp/
ADD .cache/jdk-6u31-linux-x64.bin /tmp/

RUN /bin/bash /tmp/prepare_container.sh;


EXPOSE 22 80 8020 8080 9083 10000 11000 50070 50075 50111 
#TODO: EXPOSE ALL PORTS FOR EVERY SERVICE

#CMD ["/usr/sbin/sshd", "-D"]

CMD ["/bin/bash", "/opt/start.sh"]

