Ansible
=======

Ansible on Alpine Linux.

Build image:

```
docker build --rm=true --tag=denr/ansible .
```

Ansible:

```
$ docker run -it denr/ansible ansible --version
ansible 2.2.1.0
  config file =
  configured module search path = Default w/o overrides
$ docker run -it denr/ansible which ansible
/usr/local/bin/ansible
```

Usage:

```
docker run -it -v `pwd`/hosts:/etc/ansible/hosts -v `pwd`/insecurekey:/tmp/insecurekey denr/ansible ansible all -m ping
```
