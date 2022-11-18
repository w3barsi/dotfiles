#!/bin/bash

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

function main() {
    install_initial_deps
    install_additional_deps
    install_languages
    install_shell
}

function test_print() {
    print_green "Installing initial dependencies..."
    print_green "   - ${NC}nala"
    print_green "   - ${NC}git"
    print_cyan "Cloning w3barsi/dotfiles..."
    print_red "Removing unnecessary folders..."
    print_green "Installing programming language..."
}


function install_initial_deps() {
    print_green "Installing initial dependencies..."
    print_green "   - ${NC}nala"
    print_green "   - ${NC}git\n"
    sudo apt install nala git -y
    print_green "Updating packages..."
    sudo nala update
    sudo nala upgrade -y
    print_cyan "Cloning w3barsi/dotfiles...\n"
    cd
    git clone https://github.com/w3barsi/dotfiles
    print_red "Removing unnecessary folders...\n"
    rm -rf Desktop Documents Downloads Music Pictures Public Templates Videos
}

function install_additional_deps() {
    print_green "Installing initial dependencies..."
    print_green "   - ${NC}zsh"
    print_green "   - ${NC}zoxide\n"
    print_green "   - ${NC}exa\n"
    print_green "   - ${NC}curl\n"
    print_green "   - ${NC}unzip\n"
    print_green "   - ${NC}python3\n"
    print_green "   - ${NC}python3-pip\n"
    print_green "   - ${NC}fd-find\n"
    print_green "   - ${NC}ripgrep\n"
    print_green "   - ${NC}fontconfig\n"
    sudo nala install stow \
        zsh \
        zoxide \
        exa \
        curl \
        unzip \
        python3 \
        python3-pip \
        fd-find \
        ripgrep \
        fontconfig -y
}

function install_languages(){
    print_green "Installing programming language..."
    print_brackets_green "1/4" "Making pip3 the default pip version\n"
    sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10

    print_brackets_green "2/4" "Installing Rust\n"
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "/home/barsi/.cargo/env"

    print_brackets_green "3/4" "Installing Go\n"
    curl -JLO https://go.dev/dl/go1.19.3.linux-amd64.tar.gz 
    sudo rm -rf /usr/local/go 
    sudo tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz 
    export PATH=$PATH:/usr/local/go/bin

    print_brackets_green "4/4" "Installing NodeJS\n"
    sudo nala install npm -y
    curl -fsSL https://fnm.vercel.app/install | bash
    print_red "EXPORTING FNM PATH\n"
    export PATH="/home/barsi/.local/share/fnm:$PATH"
    print_red "EVALUATING FNM\n"
    eval "`fnm env`"
    print_green "RUNNING FNM\n"
    fnm
}

function install_shell() {
    print_green "Installing Oh-My-Zsh..."
    print_green "   - ${NC}tmux\n"
    print_green "   - ${NC}zsh\n"
    print_green "   - ${NC}starship\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    sudo nala install tmux
    cargo install starship --locked

    print_green "Stowing Ubuntu/WSL dotfiles"
    cd
    rm -rf .zshrc .starship.toml .tmux.conf
    cd dotfiles
    stow wsl
    cd

    chsh -s $(which zsh)
}



# printf "${RED}[-----]${NC} Installing neovim build dependencies\n"
# sudo nala install ninja-build \
#     gettext \
#     libtool \
#     libtool-bin \
#     autoconf \
#     automake \
#     cmake \
#     g++ \
#     pkg-config \
#     unzip \
#     curl \
#     doxygen -y
#
# cd
# printf "${RED}[-----]${NC} Cloning neovim\n"
# git clone https://github.com/neovim/neovim
# cd neovim
# git checkout stable
# printf "${RED}[-----]${NC} Checked out to stable branch\n"
# printf "${RED}[-----]${NC} Now building...\n"
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install
# cd
#
# printf "${RED}[-----]${NC} Installing neovim dependencies\n"
# printf "${CYAN}[-----] - ${NC}ripgrep\n"
# printf "${CYAN}[-----] - ${NC}fd-find\n"
# sudo nala install ripgrep fd-find -y
# printf "${CYAN}[-----] - ${NC}pynvim\n"
# pip install pynvim
# printf "${CYAN}[-----] - ${NC}neovim\n"
# printf "${CYAN}[-----] - ${NC}tree-sitter-cli\n"
# npm i -g neovim tree-sitter-cli
#
# printf "${RED}[-----]${NC} - lazygit\n"
# LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
# curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
# rm -rf lazygit.tar.gz
#
# # printf "${RED}[-----]${NC} Installing LunarVim -- Checkhealth Shortcut"
# # LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
#
# cd
# printf "${RED}[-----]${NC} Stowing neovim config"
# stow nvim
# cd
#

# # printf "${RED}[-----]${NC} Downloading Fonts"
# # curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
# # printf "${RED}[-----]${NC} Installing Fonts"
# # cd
# # unzip JetBrainsMono.zip -d ~/.fonts
# # fc-cache -fv
# # rm -rf JetBrainsMono.zip
# # printf "${RED}[-----]${NC} Installed JetBrainsMono"

function print_blue(){
    printf "\n${BLUE} $1"
}
function print_green(){
    printf "\n${GREEN} $1"
}
function print_brackets_green(){
    printf "\n${NC}[${GREEN}$1${NC}] $2"
}

function print_cyan(){
    printf "\n${CYAN} $1"
}
function print_red(){
    printf "\n${RED} $1"
}

main
