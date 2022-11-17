#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

cd "/home/barsi"
git clone https://github.com/w3barsi/dotfiles
rm -rf Desktop Documents Downloads Music Pictures Public Templates Videos

sudo apt update
sudo apt upgrade -y
printf "${RED}[-----]${NC} Downloading initial dependencies..."
sudo apt install nala -y
sudo nala install stow zsh zoxide exa curl unzip npm python3 python3-pip fontconfig -y

printf "${RED}[-----]${NC} Installing Starship Prompt"
curl -sS https://starship.rs/install.sh | sh

printf "${RED}[-----]${NC} Making python3 default python command"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

printf "${RED}[-----]${NC} Installing fnm - A node version manager"
curl -fsSL https://fnm.vercel.app/install | bash

printf "${RED}[-----]${NC} Installing Rust"
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "/home/barsi/.cargo/env"

# printf "${RED}[-----]${NC} Downloading Fonts"
# curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
# printf "${RED}[-----]${NC} Installing Fonts"
# cd
# unzip JetBrainsMono.zip -d ~/.fonts
# fc-cache -fv
# rm -rf JetBrainsMono.zip
# printf "${RED}[-----]${NC} Installed JetBrainsMono"


printf "${RED}[-----]${NC} Stowing Ubuntu/WSL dotfiles"
printf "${RED}[-----]${NC}  - tmux"
printf "${RED}[-----]${NC}  - zsh"
printf "${RED}[-----]${NC}  - starship"
cd
rm -rf .zshrc .starship.toml .tmux.conf
cd dotfiles
stow wsl
cd

source "$HOME/.zshrc"

printf "${RED}[-----]${NC} Installing node 18"
fnm install 18

printf "${RED}[-----]${NC} Installing neovim build dependencies"
sudo nala install ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    cmake \
    g++ \
    pkg-config \
    unzip \
    curl \
    doxygen -y

cd
printf "${RED}[-----]${NC} Cloning neovim"
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
printf "${RED}[-----]${NC} Checked out to stable branch"
printf "${RED}[-----]${NC} Now building..."
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd

printf "${RED}[-----]${NC} Installing neovim build dependencies"
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

cd "/home/barsi/dotfiles"
printf "${RED}[-----]${NC} Stowing neovim config"
stow nvim
