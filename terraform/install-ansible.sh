#!/bin/sh

sudo su -

apt-get update
apt-get install software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get --assume-yes install ansible
