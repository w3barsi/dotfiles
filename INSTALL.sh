#!/bin/bash
rm Desktop Music Templates Documents Pictures Public Videos -rf

pkill picom
yay -R 
yay -S --noconfirm picom discord caprine spotify nm-applet picom imwheel flameshot numlockx python-nvim stow tmux npm nerd-fonts-jetbrains-mono zsh-autosuggestions exa

# Installing FNM and NPM
curl -fsSL https://fnm.vercel.app/install | bash
fnm install 16
fnm default 16

# Installing pip


# Installing neovim health dependencies in advance
npm install -g neovim clang-format prettier
python3 -m pip install --user --upgrade pynvim

sudo pacman -S base-devel cmake unzip ninja tree-sitter curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

clear
echo "Delete the created neovim git folder"
echo "Enter Neovim and do :PlugInstall"
cd ~/dotfiles
stow nvim

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
yay -S --noconfirm zsh-theme-powerlevel10k-git

rm -rf ~/.config/alacritty/alacritty.yml
rm -rf ~/.config/i3/config
rm -rf ~/.config/polybar
rm -rf ~/.config/rofi/config.rasi
rm -rf ~/.zshrc

cd ~/dotfiles
stow arch
