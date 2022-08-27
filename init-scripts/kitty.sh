
mkdir -p $HOME/.config/kitty
ln -s $(pwd)/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $(pwd)/config/kitty/open-actions.conf $HOME/.config/kitty/open-actions.conf
git clone --depth 1 https://github.com/dexpota/kitty-themes.git $HOME/.config/kitty/kitty-themes
