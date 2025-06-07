#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/mise/config.toml
DEST=$HOME/.config/mise/config.toml

backup_old $DEST
install_dotfiles $TARGET $DEST
