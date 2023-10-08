# FOR MY UBUNTU

### Update
```
sudo apt update && sudo apt upgrade
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
```
--------------------------------------------------------------------
### Ansible + molecule + pip
```
sudo apt install python3-pip
pip3 install "ansible-lint"
python3 -m pip install --user ansible "molecule[docker]"
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
