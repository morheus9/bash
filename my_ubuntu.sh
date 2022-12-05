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
python3 -m pip install --user "molecule[docker]"
# ansible --version
# yes | sudo bash ubuntu.sh
