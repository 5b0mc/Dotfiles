export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

alias vi="vim"
alias vim="nvim"

alias python="python3"
alias ms="cd ~/Writing/MirkoSacchetti"
alias dotfiles="nvim ~/Projects/dotfiles"
alias wn="cd ~/Code/WiNet"

if test (uname) = "Darwin"
    set -x PATH $PATH /Users/m/Library/flutter/bin
    set -x PATH $PATH /opt/homebrew/bin
else if test (uname) = "Linux"
end

set -g theme_nerd_fonts yes
set fish_greeting

set -x GOPATH $HOME/Code/go
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $PATH $NPM_PACKAGES/bin $GOPATH/bin

function newpass
    for i in (seq 3)
        tr -dc 'A-Za-z0-9!@#%^&*_+-' < /dev/urandom | head -c 8; echo
    end
end
