function install_neovim() {
    print_green "Installing neovim build dependencies...\n"
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
    print_green "Cloning neovim...\n"
    git clone https://github.com/neovim/neovim
    print_green "Now building neovim stable...\n"
    cd neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    sudo make install
    cd

    print_green "Installing neovim dependencies...\n"
    print_green "   - ${NC}ripgrep"
    print_green "   - ${NC}fd-find"
    print_green "   - ${NC}lazygit"
    print_green "   - ${NC}[PYTHON]pynvim"
    print_green "   - ${NC}[NPM] neovim\n"
    print_green "   - ${NC}[NPM] tree-sitter-cli\n"
    sudo nala install ripgrep fd-find -y
    pip install pynvim
    sudo npm i -g neovim tree-sitter-cli
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
    rm -rf lazygit.tar.gz

    cd
    printf "${RED}[-----]${NC} Stowing neovim config"
    cd dotfiles
    stow nvim
    cd

    print_green "Installing LunarVim..."
    LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y --install-dependencies
}

install_neovim
