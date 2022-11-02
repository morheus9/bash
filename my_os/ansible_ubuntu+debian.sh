#!/bin/bash

apt update && apt upgrade

sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
pip3 install "ansible-lint"

ansible --version
