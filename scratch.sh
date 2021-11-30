install arch with archgui

￼https://sourceforge.net/projects/arch-linux-gui/files/archlinux-gui-i3-2021.12-x86_64.iso/download

flash usb key with balena etcher

install via calamares

pick the english version
then only set the setxkbmap correctly

remove pico from i3/config

proper font sizes in i3 and kitty

install packages

paru
paru archlinux-keyring
paru -S --needed base-devel
paru -S gvim
paru -S ripgrep fd fzf plocate 
paru -S qutebrowser fish starship nnn

if no javascript needed netsurf can do the job

# qutebrowser
set content.tls.certificate_errors load-insecurely
# better way for this ?

set .config

for starship
for i3
for kitty
for fish
for bash
for alias

put some dracula theme everywhere

install proper vim from dotfiles

public dots
git clone https://github.com/xkdots/dotfiles.git

cd dotfiles

cp .vimrc ~/
cp .xkt.vim ~/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

heavy version go with firefox/chrome + vimium + vscode 
pycharm and the like
build essentials / clang and the like for programming

try again vimb or uzbl

add blackarch repo

