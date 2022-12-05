#!/bin/bash

# Update
sudo apt update && sudo apt upgrade
# Kodecs+Gcc+Nvidia
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
# Git
sudo apt install git
# Ansible
python3 -m pip install --user ansible
pip3 install "ansible-lint"
# Vargant
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
# ansible --version
# yes | sudo bash ubuntu.sh
