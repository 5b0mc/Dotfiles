DISABLE_AUTO_TITLE="true"
ZSH_THEME="robbyrussell"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="/opt/homebrew/bin":$PATH
export PATH="$PATH:/Users/m/Library/flutter/bin"
export PATH="$PATH:/Users/m/.local/bin"
export PATH="$PATH:/opt/homebrew/Cellar/llvm/12.0.1/bin"
export GOPATH="/Users/m/Code/go"
export PATH="$PATH:$GOPATH/bin"
export ZSH="/Users/m/.oh-my-zsh"
plugins=(git fzf )
source $ZSH/oh-my-zsh.sh

alias nvimconfig="nvim ~/.config/nvim"
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias python="python3"
alias smerge='/Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias mypi="ssh pi@192.168.2.8"
alias mypc="ssh 192.168.2.10"
alias syncMS=" rsync -avzu m@192.168.2.10:~/Writing/MirkoSacchetti/ ~/Writing/MirkoSacchetti/; rsync -avzu ~/Writing/MirkoSacchetti/ m@192.168.2.10:~/Writing/MirkoSacchetti/"
alias jn="jupyter notebook"
alias wn="cd ~/Code/WiNet"
alias ms="cd ~/Writing/MirkoSacchetti"
alias vi=vim
alias vim=nvim

todo(){
  vim ~/Writing/notes/TODO
}

todow(){
  vim ~/Code/WiNet/TODO
}

qn(){
  if [[ $1 = 'rand' ]]; then
    vi ~/Writing/notes/rand_$(date +'%Y_%m_%d__%H_%M')
  elif [[ $1 ]]; then
    vi ~/Writing/notes/$1
  else
    vi -c "cd ~/Writing/notes"
  fi
}

newpassword (){
  if [ -z "$1" ]; then
     openssl rand -base64 8
  else
    openssl rand -base64 $1
  fi
}

killmyport(){
  sudo fuser -k -n tcp $1
}

downloadyoutubeaudio(){
  cd ~/Documents/synthMusic         
  youtube-dl --audio-quality 5 -v --extract-audio  --audio-format mp3 $1
}

dsstorefucker(){
  sudo find ~/Code -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Projects -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Documents -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Writing -name .DS_Store -depth -exec rm {} \;
  defaults write com.apple.desktopservices DSDontWriteNetworkStores true
}

listenvideo() {
  mpv $1 --no-video
}

aj() {
  mpv https://live-hls-aje-ak.getaj.net/AJE/04.m3u8 &>/dev/null &
}

condainit(){ 
  __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
      . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
      export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

nvmload(){
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
}

haskellload(){
# learn You a Haskell for Great Good!
[ -f "/Users/m/.ghcup/env" ] && source "/Users/m/.ghcup/env" # ghcup-env
}

source /Users/m/.config/broot/launcher/bash/br
