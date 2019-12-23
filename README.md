<<<<<<< HEAD
# Ansible
=======
# Ansible Examples
>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62

Using Ansible on Google Cloud Platform

## Prerequisites

### Install Ansible on Ubuntu

<<<<<<< HEAD
[Ansible Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
=======
## Getting Started
>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62

### Pre-Requisites

<<<<<<< HEAD
### Install Ansible on Mac OSX

```bash
brew install ansible
```

## Getting Started

### Solution 1: Using Terraform11 to Deploy an Ansible VM Configuration

```bash
# navigate to the terraform directory
cd terraform11/

# script: install terraform 0.11.14
./install-terraform.sh

# script: creates a sa for running terraform from your local system and grants it roles/editor
# sets the GOOGLE_APPLICATION_CREDENTIALS variable
source setup.sh
=======
* Terraform - ./setup/install-terraform.sh (IF NOT ALREADY INSTALLED)

Below are steps for Ansible Configuration in GCP.

```bash
# generate a service account key
./setup/get-service-account.sh

# generate a ssh-key-pair ~/.ssh/ansible_ssh_key(.pub)
./setup/generate-ssh-keys.sh

```

### Run terraform

[Ansible Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

These commands are intended to be run in the terraform/ root directory.
>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62

```bash
terraform init
terraform plan
terraform apply --auto-approve
```

<<<<<<< HEAD
gsutil cp gs://gw-ansible-bucket/install-ansible.sh .
chmod +x install-ansible.sh
./install-ansible.sh

## Troubleshooting

* Startup Script sometimes not running?
=======
Copy the ansible-bucket/install-ansible.sh script.   Add permissions to run the install-ansible script & execute.  

```bash
gsutil cp gs://gw-ansible-bucket/install-ansible.sh .
chmod +x install-ansible.sh 
./install-ansible.sh 
```

## References

* [Adding/Removing SSH Keys](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)
* [StartupScripts in GCE](https://cloud.google.com/compute/docs/startupscript#using_a_local_startup_script_file)
* [ssh-copy-id examples](https://www.ssh.com/ssh/copy-id#sec-Copy-the-key-to-a-server)
* [Ansible Inventory](https://docs.ansible.com/ansible/2.4/intro_inventory.html)

### Troubleshooting

>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62
* Fixing Unprotected Private Key File:

```bash
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
<<<<<<< HEAD
```

## References

* [Reference Document](https://docs.google.com/document/d/1JmVDth4J8uCz_64bKF176fu9EOgQg1hV7J3k1HabASI/edit#)
* [Adding/Removing SSH Keys](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)
* [StartupScripts in GCE](https://cloud.google.com/compute/docs/startupscript#using_a_local_startup_script_file)
* [ssh-copy-id examples](https://www.ssh.com/ssh/copy-id#sec-Copy-the-key-to-a-server)
* [Ansible Inventory](https://docs.ansible.com/ansible/2.4/intro_inventory.html)
=======
```
>>>>>>> 4ab965c8220daea3d117f67a3a7e96cd671f9f62
