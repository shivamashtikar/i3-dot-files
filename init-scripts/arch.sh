#!/bin/bash
set -x

echo "Refreshing packages"
sudo pacman -Syyu

echo "Installing packages"
sudo pacman -S tmux neovim kitty yay ranger ripgrep figlet lolcat base-devel htop 

yay -S visual-studio-code-bin


echo "Cloning dotfiles"
mkdir workspace
cd workspace
git clone https://github.com/shivamashtikar/i3-dot-files
cd $HOME


echo "linking dotfiles"

echo "setting up zsh"
ln -s $HOME/workspace/i3-dot-files/config/aliasrc $HOME/.config/aliasrc
mkdir -p ~/.fonts/figlet
curl https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf -o $HOME/.fonts/figlet/Bloody.flf

echo "setting up nvim"
sh $HOME/workspace/i3-dot-files/init-nvim.sh

echo "setting up tmux"
sh $HOME/workspace/i3-dot-files/tmux.sh

echo "setting up kitty"
sh $HOME/workspace/i3-dot-files/kitty.sh
