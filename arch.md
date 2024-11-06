Установить Yay
```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```
Установить пакеты
```
yay -S \
visual-studio-code-bin \
yandex-browser \
go \
rust \
podman-desktop
```
```
sudo pacman -S foo
```
K3s
```
curl -sfL https://get.k3s.io | sh -
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown pi:pi ~/.kube/config
```
Удалить пакет и зависимости
```
sudo pacman -Rns foo
yay -Rns foo
```
Обновить список пакетов
```
sudo pacman -Sy
yay
```
Обновить все пакеты
```
sudo pacman -Syyu
```
Обновить все пакеты (+AUR)
```
yay -Syu
```
Найти пакеты AUR
```
sudo yay packagename
```
Найти ненужные зависимости
```
yay -Yc
```
Список из AUR:
```
visual-studio-code-bin
yandex-browser
go
rust
```
