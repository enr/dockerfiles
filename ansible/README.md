Ansible
=======

Ansible on Alpine Linux.

Build image:

	docker build --rm=true --tag=denr/ansible .

Usage
-----

Sample command:

    docker run -it -v `pwd`/hosts:/etc/ansible/hosts -v `pwd`/insecurekey:/tmp/insecurekey denr/ansible ansible all -m ping
