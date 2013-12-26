#!/usr/bin/env bash

if [[-f /opt/openstack-installed ]]; then
	su - stack -c"bash /opt/devstack/rejoin-stack.sh"
else
	apt-get update;
	cd /opt;
	apt-get install -y git wget curl
	git clone https://github.com/openstack-dev/devstack.git
	cd devstack;
	source lib/nova_plugins/hypervisor-docker;
	if [[ ! -r /vagrant/.cache/docker-registry.tar.gz ]]; then
		wget -O /vagrant/.cache/docker-registry.tar.gz $DOCKER_REGISTRY_IMAGE;
	fi
	cp /vagrant/.cache/docker-registry.tar.gz files/
	sed -i 's/curl\s-OR/wget/g' tools/docker/install_docker.sh;
	./tools/docker/install_docker.sh;
	./tools/create-stack-user.sh
	usermod -a -G docker stack
	mkdir /var/log/openstack && chown stack:stack /var/log/openstack;
	cp /vagrant/scripts/localrc /opt/devstack/localrc
	chown stack:stack -R /opt/devstack
	su - stack -c"export PIP_DOWNLOAD_CACHE=/vagrant/.cache && bash /opt/devstack/stack.sh"
	echo "export OS_USERNAME=admin" >> openrc
	echo "export OS_TENANT_NAME=admin" >> openrc
	echo "export OS_PASSWORD=1111" >> openrc
	echo "export OS_AUTH_URL=http://127.0.0.1:35357/v2.0/" >> openrc
	echo "export PS1='[\u@\h \W(keystone_admin)]\$ '" >> openrc
	if [[ ! -r /vagrant/scripts/.cache/jdk-6u31-linux-x64.bin ]]; then
		mkdir /vagrant/scripts/.cache;
		wget -O /vagrant/scripts/.cache/jdk-6u31-linux-x64.bin https://s3.amazonaws.com/public-repo-1.hortonworks.com/ARTIFACTS/jdk-6u31-linux-x64.bin;
	fi
	docker build -t localhost:5042/openstack-savanna /vagrant/scripts/
	docker push localhost:5042/openstack-savanna
	su - stack -c"cd /opt/devstack && source openrc && nova keypair-add default > default.pem && chmod 600 default.pem"
	#nova secgroup-add-rule default tcp 22 22 0.0.0.0/0 && nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
	su - stack -c"source /opt/devstack/openrc && nova-manage flavor create --name=master --cpu=2 --memory=2000 --flavor=98 --root_gb=10"
	su - stack -c"source /opt/devstack/openrc && nova-manage flavor create --name=slave --cpu=1 --memory=750 --flavor=99 --root_gb=8"
	touch /opt/openstack-installed
fi
