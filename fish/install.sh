#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/fish/config.fish
DEST=$HOME/.config/fish/config.fish

backup_old $DEST
install_dotfiles $TARGET $DEST
