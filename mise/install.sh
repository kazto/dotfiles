#!/bin/sh

UTIL_SH=$HOME/.dotfiles/util.sh
. $UTIL_SH

TARGET=$HOME/.dotfiles/mise/conf.d
DEST=$HOME/.config/mise/conf.d

install_files="$*"
if [ "x$install_files" = "x" ]
then
    exit 0
fi

test -f $DEST/minimum.toml && backup_old $DEST/minimum.toml
test -f $DEST/lang1.toml && backup_old $DEST/lang1.toml
test -f $DEST/lang2.toml && backup_old $DEST/lang2.toml
test -f $DEST/tools.toml && backup_old $DEST/tools.toml

for f in $install_files
do
    target_f=$TARGET/$f.toml
    dest_f=${DEST}/$f.toml
    install_dotfiles $target_f $dest_f
done

touch $HOME/.config/mise/config.toml
