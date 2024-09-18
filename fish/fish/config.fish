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

set FZF_DEFAULT_OPTS "--bind ctrl-k:down,ctrl-l:up"
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

set -g os "linux"
if test (uname) = "Darwin"
    set os "macos"
end
function pickrandom
    find . -maxdepth 1  -type f -o -type d -a ! -name '.' ! -name '..' | shuf -n 8
end

function newpass
    for i in (seq 3)
        openssl rand -base64 10 | tr -d '/+=\n' | head -c 8; echo
    end
end

function coin
    if test ( math (random) % 2) -eq 0
        echo "No."
    else
        echo "Yes."
    end
end

function dsstorefucker
    sudo find ~/Code -name .DS_Store -depth -exec rm {} \;
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

function timer
    set -l minutes 4
    if test (count $argv) -eq 1
        set minutes $argv[1]
    end
    sleep (math $minutes \* 60)
    switch $os
    case "macos"
        afplay /System/Library/Sounds/Ping.aiff
    case "linux"
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
        paplay /usr/share/sounds/freedesktop/stereo/complete.oga
    end
end

function aj
    mpv https://live-hls-aje-ak.getaj.net/AJE/06.m3u8 &>/dev/null &
end


function venv
    python -m venv .env
    source .env/bin/activate.fish
end

switch $os
case "macos"
    set -x PATH $PATH /Users/m/Library/flutter/bin
    set -x PATH $PATH /opt/homebrew/bin
    source "$HOME/.cargo/env.fish" 
    # opam configuration
    #source /Users/m/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

case "linux"
     if status is-login
         #         exec sway
        if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
             exec startx -- -keeptty
         end
     end
    alias open="xdg-open"
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/m/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/m/Downloads/google-cloud-sdk/path.fish.inc'; end
