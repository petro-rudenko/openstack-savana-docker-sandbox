# Openstack/Savanna/Docker

Vagrant VM with Openstack/Savanna/Docker

## How to install:
* Install latest [Vagrant](http://www.vagrantup.com/) and Virtualbox
* Install [vagrant-cachier](http://fgrehm.viewdocs.io/vagrant-cachier): 
```
vagrant plugin install vagrant-cachier
```

```bash
   $ git clone https://github.com/petro-rudenko/openstack-savana-docker-sandbox && cd openstack-savana-docker-sandbox
   $ vagrant up
```
   First time it would take an hour or so to install all packages.
   
* Open a browser [http://127.0.0.1:8000](http://127.0.0.1:8000) and login to horizon dashboard (admin/1111)
* Launch some docker instances (project -> instances -> launch -> Boot from image -> openstack-savanna:latest)
* You'll see an instance IP on horizon dashboard
* Make sure docker instances are running inside your VM and ssh to it :

```
# docker ps
# ssh root@IP_FROM_DASHBOARD
# Password: hadoop
```

# How to launch savanna HDP cluster:

* After launching VM go to savanna dashboard
* Register openstack-savanna:latest as image for HDP provider
* Create Nodegroup template (typical master/slave)
* Create Cluster template
* Launch cluster

**TODO** It would stuck for now. Need to make it work.

**TODO** After reboot VM savanna container doesn't register on docker-registry. Need to run:

```
docker push localhost:5042/openstack-savanna
```
