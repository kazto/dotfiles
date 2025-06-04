#!/bin/sh

LIST_INSTALL="bash/.bash_aliases fish/config.fish git/.gitconfig mise/config.toml tmux/.tmux.conf vim/.vimrc zsh/.zprofile zsh/.zshrc"
BACKUP_DIR=$HOME/.dotfiles/bak

backup_old() {
    mkdir -p $BACKUP_DIR
    for v in $LIST_INSTALL
    do
        local base=$(basename $v)
        if [ -f $HOME/$base ] && [ ! -L $HOME/$base ]
        then
            mv $HOME/$base $BACKUP_DIR/
        fi
    done
}

install_dotfiles() {
    for v in $LIST_INSTALL
    do
        local dir=$(dirname $v)
        local base=$(basename $v)
        if [ x$dir = 'xmise' ]
        then
            mkdir -p $HOME/.config/mise
            rm -f $HOME/.config/mise/$base
            ln -s $v $HOME/.config/mise/$base
        else
            rm -f $HOME/$base
            ln -s $v $HOME/$base
        fi
    done
}

git_clone() {
    rm -rf $HOME/.dotfiles
    git clone https://github.com/kazto/dotfiles.git $HOME/.dotfiles
}

git_clone
cd $HOME/.dotfiles
backup_old
install_dotfiles
