DISABLE_AUTO_TITLE="true"
NPM_PACKAGES="${HOME}/.npm-packages"
ZSH_THEME="eastwood"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="$PATH:$NPM_PACKAGES/bin"
export ZSH="/home/m/.oh-my-zsh"
plugins=(git fzf)
source $ZSH/oh-my-zsh.sh

alias nvimconfig="nvim ~/.config/nvim"
alias open="xdg-open"
alias jn="jupyter notebook"
alias wn="cd ~/Code/WiNet"
alias ms="cd ~/Writing/MirkoSacchetti"
alias pr="cd ~/Projects"
alias vim="nvim"

todo(){
  vim ~/Writing/notes/TODO
}

qn(){
  if [[ $1 = '-l' ]]; then
    ls -l ~/Writing/notes
  elif [[ $1 ]]; then
    vim ~/Writing/notes/$1
  else
    vim ~/Writing/notes/random_note_$(date +'%Y_%m_%d__%H_%M')
  fi
}

passwordrandom (){
  if [ -z "$1" ]; then
     openssl rand -base64 6
  else
    openssl rand -base64 $1
  fi
}

killmyport(){
  sudo fuser -k -n tcp $1
}

downloadyoutubeaudio(){
  cd ~/Documents/synthMusic         
  youtube-dl -f 'bestaudio[ext=m4a]' $1
}

dsstorefucker(){
  sudo find ~/Code -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Projects -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Documents -name .DS_Store -depth -exec rm {} \;
  sudo find ~/Writing -name .DS_Store -depth -exec rm {} \;
  defaults write com.apple.desktopservices DSDontWriteNetworkStores true
}

listenvideoaudio() {
  mpv $1 --no-video
}

watch(){
  mpv --ytdl-format="[height <=? 720]" $1
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

gitignore() { 
  curl -sLw n https://www.toptal.com/developers/gitignore/api/$@
}


# learn You a Haskell for Great Good!
[ -f "/Users/m/.ghcup/env" ] && source "/Users/m/.ghcup/env" # ghcup-env

