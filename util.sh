#!/bin/sh

backup_old() {
    local backup_dir=$HOME/.dotfiles/bak
    local target=$1

    mkdir -p $backup_dir
    local base=$(basename $target)
    if [ -f $target ] && [ ! -L $target ]
    then
        mv $target $backup_dir/
    fi
}

install_dotfiles() {
    local from=$1
    local dest=$2
    local dest_dir=$(dirname "$dest")

    if [ x$2 != 'x' ]
    then
        mkdir -p $dest_dir
    fi
    rm -f $dest
    ln -s $from $dest
    ls -l $dest
}
