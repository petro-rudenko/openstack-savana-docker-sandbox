#!/usr/bin/env bash

if [[-f /opt/openstack-installed ]]; then
	su - stack -c"bash /opt/devstack/stack.sh"
else
	apt-get update;
	cd /opt;
	apt-get install -y git wget curl
	git clone https://github.com/openstack-dev/devstack.git
	cd devstack;
	sed -i 's/curl\s-OR/wget/g' tools/docker/install_docker.sh;
	./tools/docker/install_docker.sh;
	./tools/create-stack-user.sh
	usermod -a -G docker stack
	echo "VIRT_DRIVER=docker" > localrc
	echo "ADMIN_PASSWORD=1111" >> localrc
	echo "MYSQL_PASSWORD=1111" >> localrc
	echo "RABBIT_PASSWORD=1111" >> localrc
	echo "SERVICE_PASSWORD=1111" >> localrc
	echo "ENABLED_SERVICES+=,savanna" >> localrc
	chown stack:stack -R /opt/devstack
	su - stack -c"bash /opt/devstack/stack.sh"
	docker build -t localhost:5042/openstack-savanna /vagrant/scripts/
	docker push localhost:5042/openstack-savanna
	touch /opt/openstack-installed
fi
