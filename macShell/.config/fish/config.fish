export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

alias vi="vim"
alias vim="nvim"
alias newpass="openssl rand -base64 12"
alias python="python3"
alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge .'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl .'
alias ms="cd ~/Writing/MirkoSacchetti"
alias dotfiles="cd ~/Projects/dotfiles"
alias wn="cd ~/Code/WiNet"

set -g theme_nerd_fonts yes
set fish_greeting

set -x PATH $PATH /Users/m/Library/flutter/bin
set -x PATH $PATH /opt/homebrew/bin
set -x GOPATH $HOME/Code/go
set -x PATH $PATH $GOPATH/bin
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $PATH $NPM_PACKAGES/bin
