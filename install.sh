#!/usr/bin/env bash

printf "Do you want to backup your old file? (y|n) " 

read result 

if test $result = y ; then
    echo "Install exit!"
    exit
fi

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

rm -f $HOME/.vimrc $HOME/.gvimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

vim +BundleInstall! +BundleClean +qall
