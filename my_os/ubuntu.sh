#!/bin/bash

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install ttf-mscorefonts-installer
#Update
sudo apt update && sudo apt upgrade
#Kodecs+Gcc+Nvidia
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
#IDE
sudo snap install code --classic
sudo snap install libreoffice
sudo snap install foliate
#Git
sudo apt install git

# yes | sudo bash ubuntu.sh
