#!/bin/bash

# Update
sudo apt update && sudo apt upgrade
# Kodecs+Gcc+Nvidia
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
# Git
sudo apt install git
# Ansible + molecule + pip
sudo apt install python3-pip
pip3 install "ansible-lint"
python3 -m pip install --user ansible "molecule[docker]"
# ansible --version
# molecule --version
# yes | sudo bash ubuntu.sh
