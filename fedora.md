### Update
```
sudo dnf upgrade -y
```
--------------------------------------------------------------------
Add the RPM repositories using the following commands in the terminal. For free repositories, use:
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```
For non-free repositories, use:
```
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
### Nvidia
```
sudo dnf install xorg-x11-drv-nvidia-470xx akmod-nvidia-470xx
```
optional for cuda up to 11.4 support
```
sudo dnf install xorg-x11-drv-nvidia-470xx-cuda 
```
### Gcc
```
sudo dnf install make automake gcc gcc-c++ kernel-devel
```
--------------------------------------------------------------------
### Git
```
sudo dnf install git-all
```
--------------------------------------------------------------------
### Python !!!!!!!!!!!!!!!!!!
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3-pip
sudo apt install python3.11 python3.11-venv
sudo apt install python3.12 python3.12-venv
python3.11 -V && python3.12 -V
[Poetry](https://python-poetry.org/docs/)
```
### Vscode
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' \
&& dnf check-update \
&& sudo dnf install code
```
[Yandex](https://browser.yandex.ru)
--------------------------------------------------------------------
[Warp-terminal](https://www.warp.dev)
--------------------------------------------------------------------
[Docker](https://docs.docker.com/desktop/install/fedora/)
--------------------------------------------------------------------

### Ansible + molecule + pip!!!!!!!!!!!!!!!!!!!!!!!!!!
```
sudo dnf install -y ansible
pip3 install "ansible-lint"
python3.11 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.11 -m pip uninstall ansible molecule
```
--------------------------------------------------------------------
```
ansible --version
molecule --version
