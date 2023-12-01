export TERM=xterm-256color

alias vi="vim"
alias vim="nvim"

alias python="python3"
alias ms="cd ~/Writing/MirkoSacchetti"
alias dotfiles="nvim ~/Dotfiles"
alias wn="cd ~/Code/WiNet"
alias jn="jupyter notebook"

set -g theme_nerd_fonts yes
set fish_greeting
set  -g TERM xterm-256color

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

function pickrandom
    find . -maxdepth 1  -type f -o -type d -a ! -name '.' ! -name '..' | shuf -n 20
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

function aj
    mpv https://live-hls-aje-ak.getaj.net/AJE/04.m3u8 &>/dev/null &
end

function pippo
    python -m venv .env
    source .env/bin/activate.fish
end

switch (uname)
case "Darwin"
    set -x PATH $PATH /Users/m/Library/flutter/bin
    set -x PATH $PATH /opt/homebrew/bin
    # opam configuration
    #source /Users/m/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

case "Linux"
    if status is-login
        if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
            exec startx -- -keeptty
        end
    end
    alias open="xdg-open"
end

