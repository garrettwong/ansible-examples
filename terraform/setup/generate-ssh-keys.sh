#!/bin/sh

KEY_FILENAME=ansible_ssh_key
USERNAME=garrettwong

ssh-keygen -t rsa -f ~/.ssh/$KEY_FILENAME -C $USERNAME
