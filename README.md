# Ansible Examples

[Doc](https://docs.google.com/document/d/1JmVDth4J8uCz_64bKF176fu9EOgQg1hV7J3k1HabASI/edit#)

## Getting Started

### Pre-Requisites

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

```bash
terraform init
terraform apply --auto-approve
```

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

* Fixing Unprotected Private Key File:
```
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
```