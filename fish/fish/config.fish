set fish_greeting
export TERM=xterm-256color
# aliases
alias python="python3"
alias dots="cd ~/Dotfiles && nvim ."
alias vim="nvim"
alias vi="vim"
alias wn="cd ~/Code/WiNet"
alias ms="cd ~/Writing/MirkoSacchetti"
alias jn="jupyter notebook"
# sunday as first day of the week is an abomination
alias cal="cal -m"
# envs
set -g theme_nerd_fonts yes
set -g TERM xterm-256color
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin
set os (uname)
switch $os
    case "Darwin"
        set -x PATH $PATH /opt/homebrew/bin
end
# stuff
function pickrandom
    find . -maxdepth 1 -mindepth 1 -type d | shuf -n 8
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

