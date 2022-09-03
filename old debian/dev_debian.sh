#!/bin/bash

#--------------------------------------------------Update
apt update && apt full-upgrade

#--------------------------------------------------Python
apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz
tar -xf Python-3.10.*.tgz
cd Python-3.10.*/
./configure --enable-optimizations
make -j 4
make altinstall
sudo apt install python3-pip
cat <<EOF | sudo tee ~/.bashrc
alias python='/usr/local/bin/python3.10'
EOF
source ~/.bashrc

#---------------------------------------------------Golang
rm -r update-golang
git clone https://github.com/udhos/update-golang
cd update-golang
bash ./update-golang.sh

#---------------------------------------------------Gcc
apt -y install build-essential

#---------------------------------------------------Git
apt install git

#---------------------------------------------------Vscode
apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt install apt-transport-https
apt update
apt install code

#---------------------------------------------------Chrome
cat <<EOF >/etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF
wget -O- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor >/etc/apt/trusted.gpg.d/google.gpg
apt update
apt install google-chrome-stable

#---------------------------------------------------Docker
apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker pi
newgrp docker

python3 --version
go version
docker ps

######### Telegram + chrome_setup ######################################################################
#     https://web.telegram.org
#     please off hardware acceleration in chrome

########################################################################################################################################################
#----------------------------------------------------KVM + virtual_machine_manager
# apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon
# sudo apt install virt-manager -y
# sudo virsh net-start default
# sudo virsh net-autostart default
# sudo modprobe vhost_net
#----------------------------------------------------Fix_network
# sudo systemctl restart libvirtd
# sudo usermod -a -G libvirt $(whoami)

######### setup_of_libvirt #############################################################################
#  sudo nano /etc/libvirt/qemu.conf ------And rename:
#     user = "USERNAME" <----------------
#     The group for QEMU processes run by the system instance. It can be
#     specified in a similar way to user.
#     group = "libvirt" <----------------
