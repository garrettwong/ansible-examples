#!/bin/sh

echo "nonsudo test" > /home/nonsudotest.txt
sudo echo "sudo test" > /home/sudotest.txt

IP_ADDR=$(ip address)
USERNAME="garrettwong"
ANSIBLE_HOST_IP=$IP_ADDR

# create ansible hosts file
sudo cat > /etc/ansible/hosts << EOF
[webservers]
EOF

sudo cat > /home/garrettwong/ansible-hosts << EOF
[webservers]
EOF

# generate ssh keys
KEY_FILENAME=ansible_ssh_key
ssh-keygen -t rsa -f ~/.ssh/$KEY_FILENAME -C $USERNAME
PUB_KEY=$(cat ~/.ssh/$KEY_FILENAME.pub)

# copy ssh keys from current location to ansible-host server
# ssh-copy-id -i ~/.ssh/ansible_ssh_key $USERNAME@$ANSIBLE_HOST_IP
gcloud compute project-info add-metadata --metadata="sshKeys=$PUB_KEY"

sudo apt-get update
sudo apt-get --assume-yes install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get --assume-yes install ansible