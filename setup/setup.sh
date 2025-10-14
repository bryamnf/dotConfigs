#!/bin/bash

# Set up of bashrc
ln -sfn $HOME/dotconfigs/setup/profile $HOME/.profile
ln -sfn $HOME/dotconfigs/setup/bashrc $HOME/.bashrc

mkdir $HOME/.local
mkdir $HOME/.config
cd $HOME/.local
mkdir bin
mkdir share
mkdir lib
mkdir usr
mkdir state

# Nvim
if [ -d $nvim]; then
    echo "nvim is already installed"
  else
    echo "installing nvim"
    curl -o ./nvim.tar.gz -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar -xzvf nvim.tar.gz
    rm nvim.tar.gz
    mv nvim-linux-x86_64 nvim
    # Setting config
    ln -sfn ~/dotconfigs/nvim ~/.config/nvim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    # Setting extra dependancies
    apt download wl-clipboard 
    dpkg-deb -x wl-clipboard*.deb $HOME/.local
    rm wl-clipboard*.deb
fi
