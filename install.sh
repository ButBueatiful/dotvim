#!/usr/bin/env bash

printf "Do you want to backup your old file? (y|n) "

read result
[ $result == 'y' ] && echo "Pls backup!" && exit

configs=(vimrc vimrc.plugins)
for i in "${configs[@]}"
do
    rm -f $HOME/.$i
    ln -s $HOME/.vim/$i $HOME/.$i
done

vim -u $HOME/.vimrc +PlugInstall! +PlugClean! +qall
