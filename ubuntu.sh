# yes | sudo bash ubuntu.sh
# Update
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc && source ~/.bashrc && upg
# Kodecs+Gcc
sudo apt install ubuntu-restricted-extras libavcodec-extra build-essential -y
# Git, transmission, timeshift and virtualbox
sudo apt install git transmission timeshift virtualbox -y
