##### Update
Добавить ключи
```
gpg --full-generate-key
```
Alias for update
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
- Kodecs+gcc
- Git, transmission, timeshift, vlc, virtualbox
- Vscode
- Yandex browser
- Poetry
```
wget -c -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
wget -c -O yandex.deb "https://browser.yandex.ru/download?package=deb&x64=1&os=linux&darktheme=1&banerid=6302000000&portal_testids=1114347%2F-1&signature=BvCgo%2FICb3xElms%2FKms%2F8mDe%2B6%2B4t5nT85wU%2BLPg5RX7q%2FN1k2Wr6kAVMgikE18me3mSyZbxtFMUn29N7GhN1Q%3D%3D"

sudo apt update
sudo apt install curl snapd ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc virtualbox ./*.deb -y
curl -sSL https://install.python-poetry.org | python3 -
rm -f ./*.deb
sudo apt autoremove
```
--------------------------------------------------------------------
##### [Podman-Desktop](https://podman-desktop.io/docs/installation/linux-install)
--------------------------------------------------------------------
##### go + rust + pip + python
```
sudo snap install go --classic
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
```
--------------------------------------------------------------------
##### Ansible
```
pip3 install "ansible-lint"
python3.12 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.12 -m pip uninstall ansible molecule
--------------------------------------------------------------------
ansible --version
molecule --version
python3.12 -V
sudo echo 'alias upg="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
```
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
```
--------------------------------------------------------------------
##### [Vscode](https://code.visualstudio.com)
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
