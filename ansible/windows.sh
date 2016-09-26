#!/usr/bin/env bash

# Update Repositories
sudo apt-get update

sudo apt-get install -y software-properties-common ansible


cp /vagrant/ansible/inventories/dev /etc/ansible/hosts -f
chmod 666 /etc/ansible/hosts

sudo ansible-playbook /vagrant/ansible/playbook.yml -e hostname=$1 --connection=local
