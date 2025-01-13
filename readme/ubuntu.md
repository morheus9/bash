##### Upgrade alias
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
- Warp
- Kodecs + gcc
- Git, transmission, timeshift, vlc
- Vscode
- Chrome
```
wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg

wget -c -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
wget -c -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo apt update
sudo apt install curl ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc warp-terminal ./*.deb -y
rm -f ./*.deb
sudo snap remove --purge firefox
sudo apt autoremove
```
--------------------------------------------------------------------
##### [Podman Desktop](https://podman-desktop.io/downloads)
--------------------------------------------------------------------
##### go, pip, python, uv, rust, zsh
```
sudo snap install go --classic

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
curl -LsSf https://astral.sh/uv/install.sh | sh

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
##### [Python](https://github.com/morheus9/bash/blob/main/scripts%20and%20patterns/python.md)
--------------------------------------------------------------------
##### Ansible
```
pip3 install "ansible-lint"
python3.12 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible molecule
--------------------------------------------------------------------
ansible --version
molecule --version
python3.12 -V
```
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@ххх.ххх.ххх.ххх
```
--------------------------------------------------------------------
##### [Vscode](https://code.visualstudio.com)
##### [Warp-terminal](https://www.warp.dev)
##### [Google Chrome](https://www.google.com/chrome)
