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
mkdir -p .fonts/figlet
curl https://raw.githubusercontent.com/xero/figlet-fonts/master/Bloody.flf -o $HOME/.fonts/figlet/Bloody.flf

echo "setting up nvim"
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/vim-sessions
ln -s $HOME/workspace/i3-dot-files/nvimrc $HOME/.nvimrc
ln -s $HOME/workspace/i3-dot-files/nvimrc.plug $HOME/.nvimrc.plug
ln -s $HOME/workspace/i3-dot-files/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/workspace/i3-dot-files/config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json

echo "setting up tmux"
ln -s $HOME/workspace/i3-dot-files/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "setting up kitty"
mkdir -p $HOME/.config/kitty
ln -s $HOME/workspace/i3-dot-files/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
git clone --depth 1 https://github.com/dexpota/kitty-themes.git $HOME/.config/kitty/kitty-themes
