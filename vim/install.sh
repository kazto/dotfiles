#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/vim/.vimrc
DEST=$HOME/.vimrc

backup_old $DEST
install_dotfiles $TARGET $DEST
