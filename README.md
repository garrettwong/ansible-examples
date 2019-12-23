# Ansible

Using Ansible on Google Cloud Platform

## Prerequisites

### Install Ansible on Ubuntu

[Ansible Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

```bash
# install on a Ubuntu based VM
./install-ansible.sh
```

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

terraform init
terraform plan
terraform apply --auto-approve
```

gsutil cp gs://gw-ansible-bucket/install-ansible.sh .
chmod +x install-ansible.sh
./install-ansible.sh

## Troubleshooting

* Startup Script sometimes not running?
* Fixing Unprotected Private Key File:

```bash
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
```

## References

* [Reference Document](https://docs.google.com/document/d/1JmVDth4J8uCz_64bKF176fu9EOgQg1hV7J3k1HabASI/edit#)
* [Adding/Removing SSH Keys](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)
* [StartupScripts in GCE](https://cloud.google.com/compute/docs/startupscript#using_a_local_startup_script_file)
* [ssh-copy-id examples](https://www.ssh.com/ssh/copy-id#sec-Copy-the-key-to-a-server)
* [Ansible Inventory](https://docs.ansible.com/ansible/2.4/intro_inventory.html)
