##### Update
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
- Kodecs+Gcc
- Git, transmission, timeshift, vlc, virtualbox warp-terminal
- vscode
- docker desktop
- poetry
```
wget -c -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
wget -c -O docker_desktop.deb "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"

wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg

sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc virtualbox warp-terminal ./*.deb -y
curl -sSL https://install.python-poetry.org | python3 -
rm -f ./*.deb
```
--------------------------------------------------------------------
##### [Docker](https://docs.docker.com/desktop/install/ubuntu/#install-docker-desktop)
```
gpg --generate-key
pass init YOURKEY
```
###### if doesnt start docker desktop on ubuntu 24
```
sudo echo "kernel.apparmor_restrict_unprivileged_userns=0" >> /etc/sysctl.conf
```
--------------------------------------------------------------------

##### Ansible + molecule + pip + python + rust
```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
sudo snap install golang -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
--------------------------------------------------------------------
pip3 install "ansible-lint"
python3.11 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.11 -m pip uninstall ansible molecule
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
--------------------------------------------------------------------
##### [Poetry](https://python-poetry.org/docs/#installing-with-the-official-installer)
--------------------------------------------------------------------
##### [Pixi](https://pixi.sh/latest)
____________________________________________________________________
