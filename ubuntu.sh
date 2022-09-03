#!/bin/bash

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install ttf-mscorefonts-installer
#Update
sudo apt update && sudo apt full-upgrade
#Kodecs+Gcc
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
#IDE
sudo snap install code --classic
sudo snap install libreoffice
sudo snap install foliate
#Git
sudo apt install git
sudo apt update
sudo apt upgrade

# yes | sudo bash ubuntu.sh
