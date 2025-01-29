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
#### Firmware updates:
```
sudo fwupdmgr refresh --force \
&& sudo fwupdmgr get-updates \
&& sudo fwupdmgr update
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
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly gstreamer1-ffmpeg
sudo dnf install lame\* --exclude=lame-devel make automake gcc gcc-c++ kernel-devel-$(uname -r) -y \
sudo dnf group upgrade --with-optional Multimedia -y

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo rpm --import https://releases.warp.dev/linux/keys/warp.asc
sudo sh -c 'echo -e "[warpdotdev]\nname=warpdotdev\nbaseurl=https://releases.warp.dev/linux/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://releases.warp.dev/linux/keys/warp.asc" > /etc/yum.repos.d/warpdotdev.repo'
dnf check-update

wget -c -O chrome.rpm "https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
sudo dnf install transmission warp-terminal code golang ./*.rpm -y
rm -f ./*.rpm
sudo dnf remove firefox
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
```
gpg --generate-key
pass init YOURKEY
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
