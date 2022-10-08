DISABLE_AUTO_TITLE="true"
NPM_PACKAGES="${HOME}/.npm-packages"
ZSH_THEME="eastwood"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PATH="$PATH:$NPM_PACKAGES/bin"
export ZSH="/home/m/.oh-my-zsh"
plugins=(git fzf)
source $ZSH/oh-my-zsh.sh

alias dotfiles="nvim ~/dotfiles"
alias open="xdg-open"
alias jn="jupyter notebook"
alias wn="cd ~/Code/WiNet"
alias ms="cd ~/Writing/MirkoSacchetti"
alias pr="cd ~/Projects"
alias vim="nvim"

killmyport(){
  sudo fuser -k -n tcp $1
}

downloadyoutubeaudio(){
  cd ~/Documents/synthMusic         
  youtube-dl -f 'bestaudio[ext=m4a]' $1
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

