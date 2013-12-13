FROM hansode/centos-6-x86_64
MAINTAINER Peter Rudenko <prudenko@hortonworks.com>

RUN yum -y install openssh-server openssh-clients wget tar && cd /tmp && wget https://raw.github.com/petro-rudenko/openstack-savana-docker-sandbox/master/scripts/prepare_container.sh && chmod +x prepare_container.sh && ./prepare_container.sh;


EXPOSE 22 80 8020 8080 9083 10000 11000 50070 50075 50111 
#TODO: EXPOSE ALL PORTS FOR EVERY SERVICE
CMD ["/usr/sbin/sshd", "-D"]

