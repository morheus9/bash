- Kodecs + gcc
- Git, transmission, timeshift, vlc
- [Podman Desktop](https://podman-desktop.io/downloads)
- [Google Chrome](https://www.google.com/chrome)
- [Warp-terminal](https://www.warp.dev)
- [Vscode](https://code.visualstudio.com)
```
wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

wget -c -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt update
sudo apt install snapd flatpak curl ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc warp-terminal code *.deb -y
flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub io.podman_desktop.PodmanDesktop
rm -f ./*.deb
sudo apt autoremove
```
--------------------------------------------------------------------
##### Upgrade alias + gpg
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg

gpg --full-generate-key
```
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
--------------------------------------------------------------------
##### Firefox install:
```
sudo snap install firefox
```
#### about:config
change to 1:
```
browser.uidensity
```
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
##### [Python](https://github.com/morheus9/bash/blob/main/scripts%20and%20patterns/python.md)
