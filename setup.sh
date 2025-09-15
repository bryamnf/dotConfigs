#!/bin/bash
set -e #fail at error!

# Set up nvim
sudo snap install nvim --classic
sudo apt update -y 
sudo apt install tree-sitter-cli -y

ln -sfn ~/dotconfigs/nvim ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
