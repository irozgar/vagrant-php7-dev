#!/usr/bin/env bash

# Update Repositories
sudo apt-get update -y

# Add ansible repo only if its not already present
ansibleRepoAdded=`grep ppa.launchpad.net/ansible /etc/apt/sources.list | wc -l`

if [ $ansibleRepoAdded -eq 0 ]; then
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
    sudo apt-get update -y
fi

sudo apt-get install ansible -y


cp /vagrant/ansible/inventories/dev /etc/ansible/hosts -f
chmod 666 /etc/ansible/hosts

sudo ansible-playbook /vagrant/ansible/playbook.yml -e hostname=$1 --connection=local
