# Fish Settings
set fish_greeting
set -g theme_nerd_fonts yes
set -g TERM xterm-256color
export TERM=xterm-256color
export EDITOR=nvim
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
alias pr="cd ~/Projects"
alias jk="vim ~/Projects/lkj/notes/interactions"
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

set -x PATH $PATH $HOME/.local/bin
# Set Environment for Linux or MacOS
set os (uname)
switch $os
    case "Darwin"
        set -x PATH $PATH /opt/homebrew/bin
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

# Make a Poderate Decision
function m8b
    set net_responses \
        "Yes, prioritize this right away to push your venture forward" \
        "No, you should focus on a more profitable or strategic activity" \
        "Absolutely, it aligns perfectly with your long-term vision" \
        "No, it doesn't seem to be the best use of your limited resources" \
        "Yes, it's a wise investment that can elevate you" \
        "Better not, you risk stretching yourself too thin" \
        "Yes, it's a strategic move that could boost your brand presence" \
        "Hold off: reconsider how to make the most of your resources"
    set reflection_questions \
        "How does this choice affect your core business goals?" \
        "Are you investing your time in the area with the highest leverage?" \
        "Could a simpler or more automated approach save you effort?" \
        "Is this decision aligned with your envisioned growth trajectory?" \
        "What measurable outcome do you hope to achieve?" \
        "Are you focusing on what truly drives revenue or just staying busy?" \
        "Could outsourcing or a short-term partnership provide better results?" \
        "What’s the opportunity cost of waiting versus acting now?"
    set combined_prompts \
        "Yes, but check if you have enough funds and time to see it through" \
        "No, yet consider a low-effort alternative to test this idea" \
        "Go for it, but set clear milestones to monitor progress" \
        "Pause: are there more pressing tasks that need attention first?" \
        "Proceed, but track results carefully to pivot if needed" \
        "Wait: gather more market data or user feedback before committing" \
        "Yes, but plan how you'll balance this with your daily operations" \
        "No, but use the insights gained to refine your overall strategy"
    set output_type (math (random) % 3)
    switch $output_type
        case 0
            set index (math (random) % (count $net_responses) + 1)
            echo $net_responses[$index]

        case 1
            set index (math (random) % (count $reflection_questions) + 1)
            echo $reflection_questions[$index]

        case 2
            set index (math (random) % (count $combined_prompts) + 1)
            echo $combined_prompts[$index]
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

