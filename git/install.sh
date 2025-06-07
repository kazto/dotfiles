#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/git/.gitconfig
DEST=$HOME/.gitconfig

backup_old $DEST
install_dotfiles $TARGET $DEST
