#!/usr/bin/bash

echo "Auto-install script..."
echo " "
echo " "
echo " "
echo "Installing: "
echo "      - neovim"
echo "      - nodejs"
echo "      - python"
echo "      - java"
echo "      - brave"

sudo pacman -S neovim nodejs npm python-pip paru jre-openjdk

echo "Installing Plug and creating init.vim"
ln -s alacritty.yml ~/.alacritty.yml
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir ~/.config/nvim/
ln -s init.vim ~/.config/nvim/init.vim

Echo "Copying i3 Config"
rm ~/.config/i3/config
ln -s ./i3config_arco ~/.config/i3/config

Echo "Copying Rofi theme"
cp oxide.rasi ~/oxide.rasi 


Echo "Copying ZSH Theme"
rm /usr/share/oh-my-zsh/themes/sorin.zsh-theme
cp ./sorin.zsh-theme /usr/share/oh-my-zsh/themes

Echo "Copying Alacritty.yml"
ln -s ./alacritty.yml ~/.alacritty.yml
