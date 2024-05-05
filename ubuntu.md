##### Update
```
sudo echo 'alias upg="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
##### Kodecs+Gcc
```
sudo apt install ubuntu-restricted-extras libavcodec-extra \
&& sudo apt -y install build-essential -y
```
--------------------------------------------------------------------
##### Git, transmission, timeshift and virtualbox
```
sudo apt install git \
&& transmission \
&& timeshift \
&& virtualbox -y
```
--------------------------------------------------------------------
##### [Vscode](https://code.visualstudio.com/)
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
--------------------------------------------------------------------
##### Go
```
sudo snap install go -y
```
--------------------------------------------------------------------
##### [Python](https://github.com/morheus9/scripts_py)
```
python3.12 -V
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv
```
##### [UV for python](https://astral.sh/blog/uv)
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
##### [Poetry](https://python-poetry.org/docs/)
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.105
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


##### Ansible + molecule + pip
```
sudo apt install python3-pip
pip3 install "ansible-lint"
python3.11 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.11 -m pip uninstall ansible molecule
```
--------------------------------------------------------------------
```
ansible --version
molecule --version
python3.11 -V
yes | sudo bash ubuntu.sh
sudo nano ~/.bashrc
alias upg="sudo apt update && sudo apt upgrade"
```
____________________________________________________________________
