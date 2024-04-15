### Update
```
sudo dnf upgrade
```
--------------------------------------------------------------------
### Kodecs+Gcc+Nvidia
```
sudo apt install ubuntu-restricted-extras libavcodec-extra
sudo apt -y install build-essential
sudo ubuntu-drivers autoinstall
```
--------------------------------------------------------------------
### Git
```
sudo apt install git
```
--------------------------------------------------------------------
### Python
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 python3.11-venv
sudo apt install python3.12 python3.12-venv
python3.11 -V && python3.12 -V
[Poetry](https://python-poetry.org/docs/)
```
### Vscode
```
sudo apt install apt-transport-https && \
sudo snap install code
```
[Yandex](https://browser.yandex.ru)
--------------------------------------------------------------------
[Warp-terminal](https://www.warp.dev)
--------------------------------------------------------------------
[Docker](https://docs.docker.com/desktop/install/ubuntu/#install-docker-desktop)
--------------------------------------------------------------------


### Ansible + molecule + pip
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
