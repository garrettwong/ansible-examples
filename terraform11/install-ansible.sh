#!/bin/sh

echo "nonsudo test" > /home/one

IP_ADDR=$(ip address)
USERNAME="garrettwong"
ANSIBLE_HOST_IP=$IP_ADDR

sudo cat > /home/garrettwong/ansible-hosts << EOF
[webservers]
<<<<<<< HEAD:terraform11/install-ansible.sh
35.193.4.222
35.224.206.189
=======
35.225.74.89
35.222.233.212
>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62:terraform/install-ansible.sh
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
