#!/bin/bash

RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

sudo apt install nala git -y
cd
git clone https://github.com/w3barsi/dotfiles
rm -rf Desktop Documents Downloads Music Pictures Public Templates Videos

sudo apt update
sudo apt upgrade -y
printf "${RED}[-----]${NC} Downloading initial dependencies...\n"
sudo nala install stow zsh zoxide exa curl unzip npm python3 python3-pip fontconfig -y

# printf "${RED}[-----]${NC} Installing Starship Prompt\n"
# curl -sS https://starship.rs/install.sh | sh

printf "${RED}[-----]${NC} Making python3 default python command\n"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

printf "${RED}[-----]${NC} Installing fnm - A node version manager\n"
curl -fsSL https://fnm.vercel.app/install | bash

printf "${RED}[-----]${NC} Installing Rust\n"
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


printf "${RED}[-----]${NC} Stowing Ubuntu/WSL dotfiles\n"
printf "${CYAN}[-----] -${NC} tmux\n"
printf "${CYAN}[-----] -${NC} zsh\n"
printf "${CYAN}[-----] -${NC} starship\n"
cd
rm -rf .zshrc .starship.toml .tmux.conf
cd dotfiles
stow wsl
cd

source "$HOME/.zshrc"

printf "${RED}[-----]${NC} Installing node 18\n"
fnm install 18

printf "${RED}[-----]${NC} Installing neovim build dependencies\n"
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
printf "${RED}[-----]${NC} Cloning neovim\n"
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
printf "${RED}[-----]${NC} Checked out to stable branch\n"
printf "${RED}[-----]${NC} Now building...\n"
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd

printf "${RED}[-----]${NC} Installing neovim dependencies\n"
printf "${CYAN}[-----] - ${NC}ripgrep\n"
printf "${CYAN}[-----] - ${NC}fd-find\n"
sudo nala install ripgrep fd-find -y
printf "${CYAN}[-----] - ${NC}pynvim\n"
pip install pynvim
printf "${CYAN}[-----] - ${NC}neovim\n"
printf "${CYAN}[-----] - ${NC}tree-sitter-cli\n"
npm i -g neovim tree-sitter-cli

printf "${RED}[-----]${NC} - lazygit\n"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz

# printf "${RED}[-----]${NC} Installing LunarVim -- Checkhealth Shortcut"
# LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y

cd
printf "${RED}[-----]${NC} Stowing neovim config"
stow nvim
cd
# nvim


# declare -a __npm_deps=(
#   "neovim"
#   "tree-sitter-cli"
# )
# 
# declare -a __pip_deps=(
#   "pynvim"
# )
#fd::fd-find" "rg::ripgrep
