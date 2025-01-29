Обновить зеркала
```
sudo pacman-mirrors -f 
```
Добавить ключ
```
gpg --full-generate-key
```
Yay + Go
```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```
Установить пакеты
```
yay -S \
visual-studio-code-bin \
warp-terminal-bin \
google-chrome \
podman-desktop \
rust
```
sudo pacman -S packagename
```
Удалить ненужные пакеты
```
yay -Rn $(yay -Qdtq)
```
Удалить пакет и зависимости
```
yay -Rns foo
sudo pacman -Rns foo
```
Обновить все пакеты
```
yay (Alias to yay -Syu)
sudo pacman -Syyu
```
Найти пакеты AUR
```
yay packagename
```
Список из AUR:
- visual-studio-code-bin
- warp-terminal-bin
- google-chrome
- [Podman-Desktop](https://podman-desktop.io/docs/installation/linux-install)
K3s
```
curl -sfL https://get.k3s.io | sh -
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown pi:pi ~/.kube/config
```
Poetry
```
curl -sSL https://install.python-poetry.org | python3 -
```
