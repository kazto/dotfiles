#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/zellij/config.kdl
DEST=$HOME/.config/zellij/config.kdl

backup_old $DEST
install_dotfiles $TARGET $DEST
