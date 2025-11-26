#### To add 'Fluthub', 'RPM Fusion repositories' and 'non-free RPM Fusion repositories':
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y \
&& sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y \
&& flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
--------------------------------------------------------------------
#### Update
```
sudo echo 'alias upg="sudo dnf upgrade -y --refresh && sudo dnf autoremove && sudo dnf clean all -y"' >> ~/.bashrc \
&& source ~/.bashrc \
&& upg
```
--------------------------------------------------------------------
#### Firmware updates + gpg keys:
```
sudo fwupdmgr refresh --force \
&& sudo fwupdmgr get-updates \
&& sudo fwupdmgr update

gpg --generate-key
pass init YOURKEY
```
--------------------------------------------------------------------
#### If you have SSD add to fstab parameters after "compress=zstd:1" for sections: /, /home, /var/log:
```
sudo nano /etc/fstab
btrfs   subvol=home,compress=zstd:1,defaults,noatime,discard=async 0 0
```
--------------------------------------------------------------------
#### Doing dnf faster:
```
sudo cat >> /etc/dnf/dnf.conf << EOF
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOF
```
--------------------------------------------------------------------
#### Kodecs + Gcc + transmission, warp, vscode, golang, chrome
```
sudo dnf reinstall mesa-dri-drivers xorg-x11-drv-nouveau
sudo dnf remove \*nvidia\*
sudo dracut --force

sudo dnf install ffmpeg-libs gstreamer1-plugin-libav gstreamer1-plugins-ugly-free ffmpeg-libs
sudo dnf install make automake gcc gcc-c++ kernel-devel-$(uname -r)

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

wget -c -O chrome.rpm "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
sudo dnf install ./*.rpm
rm -f ./*.rpm

dnf check-update
sudo dnf install code -y
sudo dnf install golang
```
--------------------------------------------------------------------
#### [Podman Desktop](https://podman-desktop.io/docs/installation/linux-install)
--------------------------------------------------------------------
#### [UV for python](https://astral.sh/blog/uv)
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------
#### [Warp-terminal](https://www.warp.dev)
#### [Docker](https://docs.docker.com/desktop/install/fedora)
#### [Google Chrome](https://www.google.com/chrome)
#### [Plafon](https://plafon.gitbook.io/fedora-zero)
--------------------------------------------------------------------
#### Ansible + molecule + pip
```
sudo dnf install -y ansible
pip3 install "ansible-lint"
python3.13 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.13 -m pip uninstall ansible molecule
```
--------------------------------------------------------------------
```
ansible --version
molecule --version
```
#### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.105
```
#### Config for Firefox, change to 1
```
browser.uidensity
```
#### Gnome dock and Gnome-tweaks
```
sudo dnf install gnome-tweaks gnome-shell-extension-dash-to-dock gnome-extensions-app -y
```
--------------------------------------------------------------------
#### Search app "Extensions" and enable dock
