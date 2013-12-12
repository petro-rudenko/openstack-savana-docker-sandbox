# Openstack/Savanna/Docker

Vagrant VM with Openstack/Savanna/Docker

## How to install:
* Install latest [Vagrant](http://www.vagrantup.com/) and Virtualbox

```bash
   $ git clone https://github.com/petro-rudenko/openstack-savana-docker-sandbox && cd openstack-savana-docker-sandbox
   $ vagrant up
```
   First time it would take an hour or so to install all packages.
   
* Open a browser [http://127.0.0.1:8000](http://127.0.0.1:8000) and login to horizon dashboard (admin/1111)
* ssh to VM:

```
$ vagrant ssh
$ sudo su -
# docker pull tutum/centos
# docker tag tutum/centos localhost:5042/centos-ssh
# docker push localhost:5042/centos-ssh	
```

* Launch some docker instances (project -> instances -> launch -> Boot from image -> openstack-savanna:latest)
* You'll see an instance IP on horizon dashboard
* Make sure docker instances are running inside your VM and ssh to it :

```
# docker ps
# mkdir /root/.ssh
# cp /vagrant/scripts/ssh/* /root/.ssh
# chmod 600 /root/.ssh/id_rsa
# ssh root@IP_FROM_DASHBOARD
Password: changeme
```

* How to launch savanna HDP cluster:
1) After launching VM go to savanna dashboard
2) Register openstack-savanna:latest as image for HDP provider
3) Create Nodegroup template (typical master/slave)
4) Create Cluster template
5) Launch cluster

**TODO** After reboot VM savanna container doesn't register on docker-registry. Need to run:

```
docker push localhost:5042/openstack-savanna
```
