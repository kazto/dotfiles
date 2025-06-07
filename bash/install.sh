#!/bin/sh

PROGRAM_DIR=$(cd $(dirname $0); pwd)
UTIL_SH=$(dirname ${PROGRAM_DIR})/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/bash/.bash_aliases
DEST=$HOME/.bash_aliases

backup_old $DEST
install_dotfiles $TARGET $DEST
