export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

alias xresourceseconfig="nvim ~/.Xresources"
alias ms="cd ~/Writing/MirkoSacchetti"
alias zshconfig="nvim ~/.zshrc"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias jn="jupyter notebook"
alias wn="cd ~/Code/WiNet"
alias newpass="openssl rand -base64 12"

set fish_greeting
set -x PATH $PATH /Users/m/Library/flutter/bin
set -x PATH $PATH /opt/homebrew/bin
set -x GOPATH $HOME/Code/go
set -x PATH $PATH $GOPATH/bin
