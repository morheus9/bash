##### Update
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
##### Kodecs+Gcc
```
sudo apt install ubuntu-restricted-extras libavcodec-extra build-essential -y
```
--------------------------------------------------------------------
##### Git, transmission, timeshift, vlc and virtualbox
```
sudo apt install git transmission timeshift vlc virtualbox -y
```
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
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
##### [Vscode](https://code.visualstudio.com)
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
--------------------------------------------------------------------
##### [Poetry](https://python-poetry.org/docs/#installing-with-the-official-installer)
--------------------------------------------------------------------
##### [Pixi](https://rye.astral.shhttps://pixi.sh/latest)
--------------------------------------------------------------------
##### [Rye](https://rye.astral.sh)
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
____________________________________________________________________
