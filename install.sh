#!/bin/sh

rm -rf $HOME/.dotfiles
git clone https://github.com/kazto/dotfiles.git $HOME/.dotfiles

for v in $HOME/.dotfiles/*/install.sh
do
    sh $v
done
