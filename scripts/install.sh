#!/usr/bin/env bash

if [[-f /opt/openstack-installed ]]; then
	su - stack -c"bash /opt/devstack/stack.sh"
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
	echo "VIRT_DRIVER=docker" > localrc
	echo "ADMIN_PASSWORD=1111" >> localrc
	echo "MYSQL_PASSWORD=1111" >> localrc
	echo "RABBIT_PASSWORD=1111" >> localrc
	echo "SERVICE_PASSWORD=1111" >> localrc
	echo "ENABLED_SERVICES+=,savanna" >> localrc
	echo "SCREEN_LOGDIR=/var/log/openstack" >> localrc
	chown stack:stack -R /opt/devstack
	su - stack -c"export PIP_DOWNLOAD_CACHE=/vagrant/.cache && bash /opt/devstack/stack.sh"
	echo "export OS_USERNAME=admin" >> openrc
	echo "export OS_TENANT_NAME=admin" >> openrc
	echo "export OS_PASSWORD=1111" >> openrc
	echo "export OS_AUTH_URL=http://127.0.0.1:35357/v2.0/" >> openrc
	echo "export PS1='[\u@\h \W(keystone_admin)]\$ '" >> openrc
	docker build -t localhost:5042/openstack-savanna /vagrant/scripts/
	docker push localhost:5042/openstack-savanna
	touch /opt/openstack-installed
fi
