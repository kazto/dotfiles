#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET_RC=$HOME/.dotfiles/zsh/.zshrc
DEST_RC=$HOME/.zshrc

backup_old $DEST_RC

install_dotfiles $TARGET_RC $DEST_RC

