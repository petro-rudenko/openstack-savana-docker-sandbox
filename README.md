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
* First instance would not be accessible by ssh: **TODO** Fix it
* To connect to second and consecutive instances run:
```
   $ ssh -i /opt/devstack/default.pam root@10.0.0.X
```
* You'll see an instance IP on horizon dashboard
* Make sure docker instances are running inside your VM and ssh to it :


# How to launch savanna HDP cluster:

* After launching VM go to savanna dashboard
* Register openstack-savanna:latest as image for HDP provider
* Create Nodegroup template (typical master/slave)
* Create Cluster template
* Launch cluster

**TODO** It would stuck for now. Need to make it work.

