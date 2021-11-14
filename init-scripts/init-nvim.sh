
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/vim-sessions
ln -s $HOME/workspace/i3-dot-files/nvimrc $HOME/.nvimrc
ln -s $HOME/workspace/i3-dot-files/nvimrc.plug $HOME/.nvimrc.plug
ln -s $HOME/workspace/i3-dot-files/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/workspace/i3-dot-files/config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $HOME/workspace/i3-dot-files/config/nvim/lua $HOME/.config/nvim/lua
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

