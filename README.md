# Ansible Getting Started

[Doc](https://docs.google.com/document/d/1JmVDth4J8uCz_64bKF176fu9EOgQg1hV7J3k1HabASI/edit#)

## Installation of Ansible
[Ansible Reference](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

```bash
# install on a Ubuntu based VM
./install-ansible.sh
```

## Using Terraform Deployment of Ansible Host and VMs

In the terraform/ directory, run the following commands to deploy an ansible setup.

```bash
# install terraform (if not installed)
./install-terraform.sh

./setup.sh

terraform init
terraform apply --auto-approve
```


gsutil cp gs://gw-ansible-bucket/install-ansible.sh .
chmod +x install-ansible.sh 
./install-ansible.sh 

## References

* [Adding/Removing SSH Keys](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)
* [StartupScripts in GCE](https://cloud.google.com/compute/docs/startupscript#using_a_local_startup_script_file)
* [ssh-copy-id examples](https://www.ssh.com/ssh/copy-id#sec-Copy-the-key-to-a-server)
* [Ansible Inventory](https://docs.ansible.com/ansible/2.4/intro_inventory.html)

## Troubleshooting

* Startup Script sometimes not running?

* Fixing Unprotected Private Key File:
```
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub
```
