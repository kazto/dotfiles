#!/bin/sh

PROGRAM_DIR=$(cd $(dirname $0); pwd)
UTIL_SH=$(dirname ${PROGRAM_DIR})/util.sh
. $UTIL_SH

TARGET_PR=$HOME/.dotfiles/zsh/.zprofile
DEST_PR=$HOME/.zprofile
TARGET_RC=$HOME/.dotfiles/zsh/.zshrc
DEST_RC=$HOME/.zshrc

backup_old $DEST_PR
backup_old $DEST_RC

install_dotfiles $TARGET_PR $DEST_PR
install_dotfiles $TARGET_RC $DEST_RC
