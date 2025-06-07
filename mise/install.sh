#!/bin/sh

PROGRAM_DIR=$(cd $(dirname $0); pwd)
UTIL_SH=$(dirname ${PROGRAM_DIR})/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/mise/config.toml
DEST=$HOME/.config/mise/config.toml

backup_old $DEST
install_dotfiles $TARGET $DEST
