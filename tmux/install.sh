#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/tmux/.tmux.conf
DEST=$HOME/.tmux.conf

backup_old $DEST
install_dotfiles $TARGET $DEST
