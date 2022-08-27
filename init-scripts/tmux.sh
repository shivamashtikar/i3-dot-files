DOTFILE=$(pwd)
ln -s $DOTFILE/tmux.conf $HOME/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
