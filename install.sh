#!/usr/bin/env bash

printf "Do you want to backup your old file? (y|n) "

read -r result
[ "$result" == 'y' ] && echo "Pls backup!" && exit

for i in vimrc*
do
  rm -f "$HOME/.$i"
  ln -s "$HOME/.vim/$i" "$HOME/.$i"
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For nvim
mkdir -p ~/.config/nvim/autoload
ln -sf ~/.vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/

vim -u "$HOME"/.vimrc +PlugInstall! +PlugClean! +qall
