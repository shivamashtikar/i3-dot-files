#!/bin/sh

cp -r $HOME/.config/polybar/* config/polybar
cp -r $HOME/.config/aliasrc config/aliasrc
cp -r $HOME/.config/zathura/* config/zathura
cp -r $HOME/.config/terminator/* config/terminator
cp -r $HOME/.config/rofi/* config/rofi
cp -r $HOME/.config/ranger/* config/ranger
cp -r $HOME/.config/conky/* config/conky
cp -r $HOME/.config/nvim/init.vim config/nvim/
cp -r $HOME/.config/nvim/coc-settings.json config/nvim/
cp -r $HOME/.scripts/* scripts
cp -r $HOME/.i3/* i3
cp -r $HOME/.nvimrc nvimrc
cp -r $HOME/.nvimrc.plug nvimrc.plug
cp -r $HOME/.Xresources Xresources
cp -r $HOME/.oh-my-zsh/custom/themes/* oh-my-zsh/custom/themes
cp -r $HOME/.zshrc zshrc
cp $HOME/.tmux.conf tmux.conf
cp $HOME/.vimrc vimrc
cp $HOME/.bashrc bashrc

rm -rf **/__pycache__

