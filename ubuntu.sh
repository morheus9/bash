# yes | sudo bash ubuntu.sh
# Update
sudo echo 'alias upg="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc \
&& source ~/.bashrc \
&& upg
# Kodecs+Gcc
sudo apt install ubuntu-restricted-extras libavcodec-extra \
&& sudo apt -y install build-essential -y
# Git, transmission, timeshift and virtualbox
sudo apt install git \
&& transmission \
&& timeshift \
&& virtualbox -y
# Go
sudo snap install go -y
# Python
sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt update
sudo apt install python3.12 python3.12-venv
curl -LsSf https://astral.sh/uv/install.sh | sh
# SSH
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
