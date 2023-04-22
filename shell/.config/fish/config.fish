export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

alias vi="vim"
alias vim="nvim"

alias python="python3"
alias ms="cd ~/Writing/MirkoSacchetti"
alias dotfiles="nvim ~/Projects/dotfiles"
alias wn="cd ~/Code/WiNet"

set -g theme_nerd_fonts yes
set fish_greeting

set -x GOPATH $HOME/Code/go
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $PATH $NPM_PACKAGES/bin $GOPATH/bin

if test (uname) = "Darwin"
    set -x PATH $PATH /Users/m/Library/flutter/bin
    set -x PATH $PATH /opt/homebrew/bin
else if test (uname) = "Linux"
end

function pick10
    find . -maxdepth 1  -type f -o -type d -a ! -name '.' ! -name '..' | shuf -n 10
end
function newpass
    for i in (seq 3)
        tr -dc 'A-Za-z0-9!@#%^&*_+-' < /dev/urandom | head -c 8; echo
    end
end

function dsstorefucker
    sudo find ~/Code -name .DS_Store -depth -exec rm {} \;
    sudo find ~/Projects -name .DS_Store -depth -exec rm {} \;
    sudo find ~/Documents -name .DS_Store -depth -exec rm {} \;
    sudo find ~/Writing -name .DS_Store -depth -exec rm {} \;
    if test (uname) = "Darwin"
        defaults write com.apple.desktopservices DSDontWriteNetworkStores true
    end 
end  

function nvmloader
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
end
