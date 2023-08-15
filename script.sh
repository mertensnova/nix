#!/bin/bash

# Installing Git
echo "Installing Git"
sudo pacman -S git

echo "Installing Yay"
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd

#Installing tmux
echo "Installing tmux"
sudo pacman -Sy tmux

# Installing Neovim & Neofetch
echo "Installing Neovim & Neofetch"
sudo pacman -S neovim
sudo pacman -S neofetch

# Setting up Neovim
echo "Setting up Neovim"
mkdir ~/.config/
cd ~/.config/
git clone https://github.com/amr8644/neovim-config
mv neovim-config nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#Installing Golang
echo "Installing Golang"
sudo pacman -S go

#Installing C/C++ complier
echo "Installing GCC"
sudo pacman -S gcc

# Installing Node
echo "Installing Node "
sudo pacman -S nodejs

#Installing Nginx
echo "Installing Nginx"
sudo pacman -S nginx-mainline

# Installing docker	
echo "Installing Docker"
sudo pacman -S docker

# Installing browsers
#
echo "Installing browsers"
yay -S google-chrome
yay -S brave-bin

echo "Installing Notes"
yay -S obsidian

git clone https://github.com/amr8644/notes.git
