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
# NPM
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $PATH $NPM_PACKAGES/bin
# Go
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin
# Cargo e Rustup
set -x CARGO_HOME $HOME/.cargo
set -x PATH $PATH $CARGO_HOME/bin
set -x RUSTUP_HOME $HOME/.rustup
set -x PATH $PATH $RUSTUP_HOME/bin

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
    find . -maxdepth 1 -mindepth 1 -type d | shuf -n 14
end

# Generate random srings for passwords
function newpass
    for i in (seq 3)
        openssl rand -base64 10 | tr -d '/+=\n' | head -c 8;echo
    end
end

# Print  the color value of an pixel
function colorpicker
    grim -g "(slurp -p)" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt:-
end

# Make a Quick Decision
function coin
    if test ( math (random) % 2) -eq 0
        echo "No."
    else
        echo "Yes."
    end
end

# Iterates through files in ~/.config/keys, converting filenames to uppercase variable names and exporting their contents as environment variables
if test -d ~/.config/keys
    for key_file in ~/.config/keys/*
        if test -f $key_file
            set file_name (basename $key_file)
            set var_name (string upper $file_name)
            set key_content (cat $key_file)
            if test -n "$key_content"
                set -gx $var_name $key_content
            end
        end
    end
end

