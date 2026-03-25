#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/textlint/.textlintrc.json
DEST=$HOME/.textlintrc.json

backup_old $DEST
install_dotfiles $TARGET $DEST
