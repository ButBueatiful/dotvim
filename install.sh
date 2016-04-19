#!/usr/bin/env bash

printf "Do you want to backup your old file? (y|n) "

read result

if test $result = y ; then
  echo "Install exit!"
  exit
fi

rm -f $HOME/.vimrc $HOME/.gvimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

vim -u $HOME/.vimrc +PlugInstall! +PlugClean! +qall
