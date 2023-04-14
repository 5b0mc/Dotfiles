export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

alias vi="vim"
alias vim="nvim"
alias jn="jupyter notebook"
alias wn="cd ~/Code/WiNet"
alias newpass="openssl rand -base64 12"

set -g theme_nerd_fonts yes
set fish_greeting

set -x PATH $PATH /Users/m/Library/flutter/bin
set -x PATH $PATH /opt/homebrew/bin
set -x GOPATH $HOME/Code/go
set -x PATH $PATH $GOPATH/bin
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $PATH $GOPATH/bin
