# Fish Settings
set fish_greeting
set -g theme_nerd_fonts yes
set -g TERM xterm-256color
export TERM=xterm-256color
# Aliases
alias jn="jupyter notebook"
alias python="python3"
alias vim="nvim"
alias vi="vim"
# Aliases as Shortcuts for My Favorite Folders
alias do="cd ~/Dotfiles"
alias wn="cd ~/Code/WiNet"
alias ms="cd ~/Writing/MirkoSacchetti"
alias co="cd ~/Code"
# Sunday as first day of the week is an abomination
alias cal="cal -3m"
# Set Environment Variables
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin
# Set Environment for Linux or MacOS
set os (uname)
switch $os
    case "Darwin"
        set -x PATH $PATH /opt/homebrew/bin
    case "Linux"
        set PATH $PATH /opt/nvim-linux64/bin
end
# Find a random file in the current folder
function pickrandom
    find . -maxdepth 1 -mindepth 1 -type d | shuf -n 8
end
# Generate random srings for passwords
function newpass
    for i in (seq 3)
        openssl rand -base64 10 | tr -d '/+=\n' | head -c 8; echo
    end
end
# Make a Quick Decision
function coin
    if test ( math (random) % 2) -eq 0
        echo "No."
    else
        echo "Yes."
    end
end
