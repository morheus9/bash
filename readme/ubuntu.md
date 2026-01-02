- [Cursor](https://cursor.com/download)  !!
- [Google Chrome](https://www.google.com/chrome)
- [Warp-terminal](https://www.warp.dev)
- [Vscode](https://code.visualstudio.com)
- [Docker-desktop](https://docs.docker.com/desktop/setup/install/linux/ubuntu)
```bash

# ✅ Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# ✅ Warp Terminal
wget "https://app.warp.dev/download?package=deb" -O warp-terminal.deb
# ✅ VS Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
# ✅ Docker Desktop
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
sudo apt install curl gettext ubuntu-restricted-extras libavcodec-extra build-essential git pre-commit ./*.deb
rm -f ./*.deb
sudo apt autoremove

gpg --full-generate-key
pass init
```
--------------------------------------------------------------------
##### For gnome
```
git clone https://gitlab.gnome.org/tuxor1337/hidetopbar.git
cd hidetopbar
make
gnome-extensions install --force ./hidetopbar.zip
gnome-extensions enable hidetopbar@mathieu.bidon.ca
```
--------------------------------------------------------------------
##### Upgrade alias
```bash
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
##### k3s
```bash
sudo curl -sfL https://get.k3s.io | sh -

mkdir -p ~/.kube
sudo cp -f /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $(id -u):$(id -g) ~/.kube/config

nano ~/.bashrc
export KUBECONFIG=~/.kube/config
source ~/.bashrc

kubectl get pods --all-namespaces
```
##### uv
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```
##### go, zsh, python+pip
```bash
sudo snap install go --classic
--------------------------------------------------------------------
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
--------------------------------------------------------------------
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.13 python3.13-venv python3-pip python-is-python3
```
--------------------------------------------------------------------
##### Ansible
```bash
pip3 install "ansible-lint"
python3.13 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible molecule

ansible --version
molecule --version
python3.13 -V
```
--------------------------------------------------------------------
##### SSH
```bash
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@ххх.ххх.ххх.ххх
```
--------------------------------------------------------------------
#### Firefox little top - about:config
change to 1:
```bash
browser.uidensity
```
--------------------------------------------------------------------
##### [Podman Desktop](https://podman-desktop.io/downloads)
```bash
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub io.podman_desktop.PodmanDesktop
```
##### [Vscode](https://code.visualstudio.com)
##### [Warp-terminal](https://www.warp.dev)
##### [Python](https://github.com/morheus9/bash/blob/main/scripts%20and%20patterns/python.md)
