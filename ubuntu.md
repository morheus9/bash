##### Keys
```
gpg --full-generate-key
```
--------------------------------------------------------------------
- Kodecs + gcc
- Git, transmission, timeshift, vlc
- Vscode
```
wget -c -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt update
sudo apt install curl snapd ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc ./*.deb -y
rm -f ./*.deb
sudo apt autoremove
```
--------------------------------------------------------------------
##### [Podman Desktop](https://podman-desktop.io/docs/installation/linux-install)
##### [Google Chrome](https://www.google.com/chrome)
--------------------------------------------------------------------
##### go + rust + pip + python + poetry + zsh
```
sudo snap install go --classic
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
curl -sSL https://install.python-poetry.org | python3 -
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.zshrc
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
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
