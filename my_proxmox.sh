#!/bin/bash

#---------------------------------------------------Update
apt update && apt full-upgrade

#---------------------------------------------------Vscode
apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
apt install apt-transport-https
apt update
apt install code

#---------------------------------------------------Chrome
cat << EOF > /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF
wget -O- https://dl.google.com/linux/linux_signing_key.pub |gpg --dearmor > /etc/apt/trusted.gpg.d/google.gpg
apt update
apt install google-chrome-stable

#---------------------------------------------------Add_user
#     adduser pi
#     usermod -aG sudo pi



######### Telegram + chrome_setup ######################################################################
#     https://web.telegram.org
#     please off hardware acceleration in chrome
########################################################################################################
