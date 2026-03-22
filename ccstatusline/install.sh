#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/ccstatusline/settings.json
DEST=$HOME/.config/ccstatusline/settings.json

backup_old $DEST
install_dotfiles $TARGET $DEST
