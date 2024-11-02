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
rust
```
```
sudo pacman -S foo
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
