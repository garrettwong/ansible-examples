#!/bin/sh

sudo apt-get install unzip

wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip

unzip terraform_0.11.14_linux_amd64.zip

sudo mv terraform /usr/local/bin/

terraform --version 

rm terraform_0.11.14_linux_amd64.zip
