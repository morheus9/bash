#### To add 'Fluthub', 'RPM Fusion repositories' and 'non-free RPM Fusion repositories' use:
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y \
&& sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y \
&& flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```
--------------------------------------------------------------------
#### Update
```
sudo echo 'alias upg="sudo dnf upgrade -y --refresh && sudo dnf autoremove -y"' >> ~/.bashrc \
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
#### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.105
```
--------------------------------------------------------------------
#### If you have SSD add to fstab parameters after "compress=zstd:1" for sections: /, /home, /var/log:
```
sudo gnome-text-editor /etc/fstab
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
#### Kodecs + Gcc + timeshift, transmission
```
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y \
&& sudo dnf install lame\* --exclude=lame-devel -y \
&& sudo dnf group upgrade --with-optional Multimedia -y \
&& sudo dnf install make automake gcc gcc-c++ kernel-devel -y \
&& sudo dnf install timeshift transmission  kernel-devel-$(uname -r)  -y

```
--------------------------------------------------------------------
#### Vscode
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' \
&& dnf check-update \
&& sudo dnf install code -y
```
--------------------------------------------------------------------
#### [Go](https://go.dev/doc/install)
```
sudo dnf install golang -y
```
--------------------------------------------------------------------
#### [Warp-terminal](https://www.warp.dev)
#### [Podman Desktop](https://podman-desktop.io/docs/installation/linux-install)
--------------------------------------------------------------------
#### Gnome dock and Gnome-tweaks
```
sudo dnf install gnome-tweaks gnome-shell-extension-dash-to-dock gnome-extensions-app -y
```
##### search app "Extensions" and enable dock
--------------------------------------------------------------------
#### [UV for python](https://astral.sh/blog/uv)
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
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
#### [Docker](https://docs.docker.com/desktop/install/fedora)
```
gpg --generate-key
pass init YOURKEY
```
--------------------------------------------------------------------
#### [Plafon](https://plafon.gitbook.io/fedora-zero)
--------------------------------------------------------------------
