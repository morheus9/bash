##### Update
```
sudo echo 'alias upg="sudo snap refresh && sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
source ~/.bashrc
upg
```
--------------------------------------------------------------------
- Kodecs+Gcc
- Git, transmission, timeshift, vlc, virtualbox warp-terminal
- Vscode
- Docker desktop
- Poetry
- Yandex browser
```
wget -c -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
wget -c -O docker_desktop.deb "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"
wget -c -O yandex.deb "https://browser.yandex.ru/download?package=deb&x64=1&os=linux&darktheme=1&banerid=6302000000&portal_testids=1114347%2F-1&signature=BvCgo%2FICb3xElms%2FKms%2F8mDe%2B6%2B4t5nT85wU%2BLPg5RX7q%2FN1k2Wr6kAVMgikE18me3mSyZbxtFMUn29N7GhN1Q%3D%3D"

wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
rm warpdotdev.gpg

sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install ubuntu-restricted-extras libavcodec-extra build-essential git transmission timeshift vlc virtualbox warp-terminal ./*.deb -y
curl -sSL https://install.python-poetry.org | python3 -
rm -f ./*.deb
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

##### Ansible + molecule + pip + python + rust
```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
sudo snap install golang -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
--------------------------------------------------------------------
pip3 install "ansible-lint"
python3.11 -m pip install ansible molecule
python3 -m pip install --upgrade --user ansible
python3.11 -m pip uninstall ansible molecule
--------------------------------------------------------------------
ansible --version
molecule --version
python3.12 -V
sudo echo 'alias upg="sudo apt update && sudo apt upgrade -y"' >> ~/.bashrc
```
--------------------------------------------------------------------
##### SSH
```
ssh-keygen -t ed25519
chmod 700 ~/.ssh/id_ed25519
ssh-copy-id -i ~/.ssh/id_ed25519.pub -f pi@192.168.1.104
```
--------------------------------------------------------------------
##### [Vscode](https://code.visualstudio.com)
--------------------------------------------------------------------
##### [Warp-terminal](https://www.warp.dev)
____________________________________________________________________


```
#!/usr/bin/env python
chmod +x myfile.py
```
For installing python use:
```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.12 python3.12-venv python3-pip python-is-python3
python3.12 -V
```
##### [Poetry](https://python-poetry.org/docs/#installing-with-the-official-installer)
```
# https://python-poetry.org/docs/#installing-with-the-official-installer
poetry self update
poetry config virtualenvs.in-project true

poetry init
poetry shell
poetry install
poetry add fastapi
poetry add ruff -G dev
poetry lock
poetry remove fastapi
poetry env list
poetry env use /usr/bin/python3.11 or poetry env use python3.12
poetry env remove -n envname
poetry env remove --all
poetry export --without-hashes --format=requirements.txt > requirements.txt
poetry show --tree
poetry cache list
poetry cache clear PyPI --all
poetry env info
```
##### [Pixi](https://pixi.sh/latest/tutorials/python/)
```
curl -fsSL https://pixi.sh/install.sh | bash
pixi self-update
pixi add aiogram
pixi add --dev black
pixi lint --fix
```
##### [Miniconda](https://docs.anaconda.com/miniconda/#quick-command-line-install)
```
# https://docs.conda.io/projects/miniconda/en/latest/
conda update -n base conda

conda install -n base conda-libmamba-solver
conda config --set solver libmamba
conda config --show-sources

conda create -n CONDA python=3.11
conda create -n CONDA -f requirements.yml
conda env list
conda env remove -n CONDA
conda install -y pandas
conda list
conda remove -y pandas
conda env export -f requirements.yml
conda clean -a
```
##### [Rye](https://rye.astral.sh/guide)
```
yes | curl -sSf https://rye.astral.sh/get | bash
rye init --virtual
rye add aiogram
rye add --dev black
rye remove aiogram
rye lint --fix
rye sync --update-all
rye lock
```
For pyinstaller compilation to .bin use:
```
pip install pyinstaller
pyinstaller --onefile main.py
```
For nuitka:
```
sudo apt install patchelf
pip install nuitka
nuitka3 --onefile main.py
```



