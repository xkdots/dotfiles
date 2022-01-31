install arch with archgui

￼https://sourceforge.net/projects/arch-linux-gui/files/archlinux-gui-i3-2021.12-x86_64.iso/download

flash usb key with balena etcher

install via calamares

pick the english version
then only set the setxkbmap correctly
see man xkeyboard-config
if no menu key play with another option under righ thumb

setxkbmap -layout fr -option caps:escape -option ctrl:swap_lalt_lctl_lwin

config
paru -S arandr firefox

cd
git clone https://github.com/xkdots/dotfiles
cd dotfiles
cp .alias .bashrc .fzf.bash .vimrc .xkt.vim ../
cp -R .config ../

TODO swap caps and escape to keep feature 

remove pico from i3/config

proper font sizes in i3 and kitty

install packages

paru
paru archlinux-keyring
paru -S --needed base-devel
paru -R vim
paru -S gvim update-grub os-prober ripgrep fd fzf plocate tmux atool autojump-rs exa bat qutebrowser fish starship nnn vifm wget ranger
paru -S code
paru -S thefuck

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c "PlugInstall"

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

fisher install oh-my-fish/plugin-bang-bang

timedatectl set-ntp true
sudo vim /etc/default/grub
sudo update-grub

:: vifm
wget -P ~/.config/vifm/colors https://raw.githubusercontent.com/vifm/vifm-colors/master/dracula.vifm

if no javascript needed netsurf can do the job

change default shell to fish
chsh -s /usr/bin/fish

# :: autojump
TODO 
https://gist.github.com/l4u/06502cf680b9a3817efddfb0a9a6ede8

:: create some universal search and open
TODO with locate and rg / fzf


TODO why is alt + . not working? used as mod in i3?
DONE semi solution esc + . seems to work ok

# :: qutebrowser
set content.tls.certificate_errors load-insecurely
# better way for this ?
:set content.blocking.method both

paru python-adblock

TODO define your own shortcut backspace and quick find /
backup config
DONE

# :: set .config

for starship
for i3
for kitty
for fish
  TODO ù for confirm validate
  DONE SOL or usr ctrl f then enter
for bash
for alias

TODO put some dracula theme everywhere
DONE

TODO save packages and sync to list of packages
DONE via savepackage alias 
TODO (also check nixOS)

install proper vim from dotfiles
DONE

once done use fzf install to set up keybiindings
~/.vim/plugged/fzf/install --no-zsh --key-bindings

:: public dots
git clone https://github.com/xkdots/dotfiles.git

cd dotfiles

# copy config
cp -Ra .config/* ~/.config

cp .vimrc ~/
cp .xkt.vim ~/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

heavy version go with firefox/chrome + vimium + vscode 
pycharm and the like
build essentials / clang and the like for programming

TODO pass
TODO save credentials

try again vimb or uzbl

add blackarch repo
# Run https://blackarch.org/strap.sh as root and follow the instructions.
$ curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
$ echo 84a2981475b49d7880bb8c5727ebea64f9f22a7c strap.sh | sha1sum -c

# Set execute bit
$ chmod +x strap.sh

# Run strap.sh
$ sudo ./strap.sh

# Enable multilib following https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:
$ sudo pacman -Syu
DONE

TODO homerow cursor navigation

:: MAC
TODO invert rcmd and ralt
compose rwin-altgr

fn shift enter does shift ins to paste
ctl + shift + c / v also work

:: sources

https://github.com/rothgar/awesome-tuis
https://idempotent-desktop.netlify.app/


:: research 

check out nixOS
https://github.com/ksevelyar/idempotent-desktop/blob/25eba689681ea02b961e1403f46593f7453c71c3/sys/aliases.nix

