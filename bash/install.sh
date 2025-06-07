#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/bash/.bash_aliases
DEST=$HOME/.bash_aliases

backup_old $DEST
install_dotfiles $TARGET $DEST
