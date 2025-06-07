#!/bin/sh

PROGRAM_DIR=$(cd $(dirname $0); pwd)
UTIL_SH=$(dirname ${PROGRAM_DIR})/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/fish/config.fish
DEST=$HOME/.config/fish/config.fish

backup_old $DEST
install_dotfiles $TARGET $DEST
