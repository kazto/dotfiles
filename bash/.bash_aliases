alias s='s -b $HOME/.local/bin/edge'

ss() {
    local PROVIDER=$(s -l | fzf)
    s -p $PROVIDER $*
}
