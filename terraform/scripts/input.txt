#!/bin/sh

echo "nonsudo test" > /home/nonsudotest.txt
sudo echo "sudo test" > /home/sudotest.txt

IP_ADDR=$(ip address)
USERNAME="garrettwong"
REMOTE_IP_ADDR=$IP_ADDR

# create ansible hosts file
sudo cat > /etc/ansible/hosts << EOF
[webservers]
EOF

ssh-copy-id $USERNAME@$REMOTE_IP_ADDR

sudo apt-get update
sudo apt-get --assume-yes install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get --assume-yes install ansible
