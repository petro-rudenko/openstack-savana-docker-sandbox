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
```bash
$ vagrant ssh
$ sudo su -
# docker pull tutum/centos
# docker tag tutum/centos localhost:5042/centos-ssh
# docker push localhost:5042/centos-ssh	
```
* Launch some docker instances (project -> instances -> launch -> Boot from image -> centos-ssh)
* You'll see an instance IP on horizon dashboard
* Make sure docker instances are running inside your VM and ssh to it:
```bash
# docker ps
# ssh root@IP_FROM_DASHBOARD
Password: changeme
```

- [ ] Create docker images for Savanna HDP **TODO**
- [ ] Launch multinode hadoop cluster inside VM **TODO**
