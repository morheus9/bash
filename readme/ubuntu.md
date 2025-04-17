- Kodecs + gcc
- Git, transmission, timeshift, vlc
- [Google Chrome](https://www.google.com/chrome)
- [Warp-terminal](https://www.warp.dev)
- [Vscode](https://code.visualstudio.com)
- [Docker](https://docs.docker.com/engine/install/ubuntu)
- [Docker-desktop](https://docs.docker.com/desktop/setup/install/linux/ubuntu)
```
wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm -f warpdotdev.gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

wget -c https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install snapd ca-certificates curl ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc warp-terminal code docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin ./*.deb

sudo systemctl enable containerd.service
sudo systemctl enable docker.service

rm -f ./*.deb
sudo apt autoremove

sudo apt-get install pass
gpg --full-generate-key
pass init
```
--------------------------------------------------------------------
##### Upgrade alias
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
##### k3s
```
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
```
curl -LsSf https://astral.sh/uv/install.sh | sh
```
##### go, zsh, python+pip
```
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
```
pip3 install "ansible-lint"
python3.12 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible molecule

ansible --version
molecule --version
python3.12 -V
```
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@ххх.ххх.ххх.ххх
```
--------------------------------------------------------------------
#### Firefox little top - about:config
change to 1:
```
browser.uidensity
```
--------------------------------------------------------------------
##### [Podman Desktop](https://podman-desktop.io/downloads)
```
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub io.podman_desktop.PodmanDesktop
```
##### [Vscode](https://code.visualstudio.com)
##### [Warp-terminal](https://www.warp.dev)
##### [Python](https://github.com/morheus9/bash/blob/main/scripts%20and%20patterns/python.md)
