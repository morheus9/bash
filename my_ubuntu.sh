#!/bin/bash

# Update
sudo apt update && sudo apt upgrade
# Kodecs+Gcc+Nvidia
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
# IDE
sudo snap install code --classic
sudo snap install libreoffice
sudo snap install foliate
# Git
sudo apt install git
# Ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
pip3 install "ansible-lint"

# ansible --version
# yes | sudo bash ubuntu.sh
