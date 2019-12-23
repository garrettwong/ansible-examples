#!/bin/sh

echo "nonsudo test" > /home/one

IP_ADDR=$(ip address)
USERNAME="garrettwong"
ANSIBLE_HOST_IP=$IP_ADDR

sudo cat > /home/garrettwong/ansible-hosts << EOF
[webservers]
34.82.177.130
34.82.44.169
EOF

sudo echo "sudo test" > /home/two

# generate ssh keys
KEY_FILENAME="ansible_ssh_key"
cat /dev/zero | ssh-keygen -q -N "" -f ~/.ssh/$KEY_FILENAME -C $USERNAME
PUB_KEY=$(cat ~/.ssh/$KEY_FILENAME.pub)

sudo echo "three" > /home/three

# copy ssh keys from current location to ansible-host server
# ssh-copy-id -i ~/.ssh/ansible_ssh_key $USERNAME@$ANSIBLE_HOST_IP
gcloud compute project-info add-metadata --metadata="sshKeys=$PUB_KEY"

sudo apt-get update
sudo apt-get --assume-yes install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get --assume-yes install ansible
