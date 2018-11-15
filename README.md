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

[Adding/Removing SSH Keys](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys)

