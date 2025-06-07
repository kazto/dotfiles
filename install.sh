#!/bin/sh

rm -rf $HOME/.dotfiles
git clone https://github.com/kazto/dotfiles.git $HOME/.dotfiles

for v in */install.sh
do
    sh $v
done
