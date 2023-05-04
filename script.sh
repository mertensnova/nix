#!/bin/bash

# Installing Git
echo "Installing Git"
sudo pacman -Sy git


#Installing tmux
echo "Installing tmux"
sudo pacman -Sy tmux

# Installing Neovim & Neofetch
echo "Installing Neovim & Neofetch"
sudo pacman -Sy neovim
sudo pacman -Sy neofetch

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
sudo pacman -Sy go

#Installing C/C++ complier
echo "Installing GCC"
sudo pacman -Sy gcc

# Installing Node
echo "Installing Node "
sudo pacman -Sy node


#Installing Nginx
echo "Installing Nginx"
sudo pacman -Sy nginx-mainline

# Installing docker	
sudo pacman -Sy docker

