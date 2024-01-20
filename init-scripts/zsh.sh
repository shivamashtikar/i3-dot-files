#!/bin/bash
set -x

echo "Linking ZSH configs"
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.old
ln -s $(pwd)/zshrc ~/.zshrc
ln -s $(pwd)/config/aliasrc ~/.config/aliasrc
ln -s $(pwd)/oh-my-zsh/custom/themes/agnoster-new-line.zsh-theme ~/.oh-my-zsh/themes/agnoster-new-line.zsh-theme

echo "Installing ZSH autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing ZSH syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir -p ~/.fonts/figlet/
wget -O ~/.fonts/figlet/Bloody.flf \
    "https://github.com/xero/figlet-fonts/blob/master/Bloody.flf?raw=true";

