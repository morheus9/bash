##### Update
```
sudo dnf upgrade -y --refresh
```
--------------------------------------------------------------------
##### If you have SSD add to fstab parameters after "compress=zstd:1" for sections: /, /home, /var/log:
```
sudo gnome-text-editor /etc/fstab:

,defaults,noatime,discard=async
```
--------------------------------------------------------------------
##### Doing dnf faster:
```
sudo gnome-text-editor /etc/dnf/dnf.conf

fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```
--------------------------------------------------------------------
##### To add RPM Fusion repositories and non-free RPM Fusion repositories use:
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
--------------------------------------------------------------------
##### Flatpak
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
--------------------------------------------------------------------
##### Nvidia
```
sudo dnf install xorg-x11-drv-nvidia-470xx akmod-nvidia-470xx
```
--------------------------------------------------------------------
##### Kodecs
```
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
```
--------------------------------------------------------------------
##### Gcc
```
sudo dnf install make automake gcc gcc-c++ kernel-devel
```
--------------------------------------------------------------------
##### Git
```
sudo dnf install git-all
```
--------------------------------------------------------------------
##### Python !!!!!!!!!!!!!!!!!!
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3-pip
sudo apt install python3.11 python3.11-venv
sudo apt install python3.12 python3.12-venv
python3.11 -V && python3.12 -V
[Poetry](https://python-poetry.org/docs/)
```
--------------------------------------------------------------------
##### Vscode
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' \
&& dnf check-update \
&& sudo dnf install code
```
--------------------------------------------------------------------
##### Gnome Boxes
```
flatpak install flathub org.gnome.Boxes
```
--------------------------------------------------------------------
##### Gnome-tweaks
```
sudo dnf install gnome-tweaks
```
--------------------------------------------------------------------
##### Timeshift
```
sudo dnf install timeshift
```
--------------------------------------------------------------------
##### Go
```
sudo dnf install golang
```
##### [Go](https://go.dev/doc/install)
--------------------------------------------------------------------
##### [Yandex](https://browser.yandex.ru)
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
--------------------------------------------------------------------
##### [Docker](https://docs.docker.com/desktop/install/fedora)
--------------------------------------------------------------------



##### Ansible + molecule + pip!!!!!!!!!!!!!!!!!!!!!!!!!!
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
```
--------------------------------------------------------------------
##### [Plafon](https://plafon.gitbook.io/fedora-zero)
--------------------------------------------------------------------
