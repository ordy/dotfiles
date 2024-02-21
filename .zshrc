if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Removing '%' from partial line
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  npm
  dirhistory
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias cp="cp -i"      # confirm before overwriting something
alias df='df -h'      # human-readable sizes
alias free='free -m'  # show sizes in MB
alias more=less
alias vim=$EDITOR
alias svim=sudoedit
alias sf="cls && pfetch"
alias swaytree='swaymsg -t get_tree | grep "\"app_id\"\|\"name\"\|\"shell\""'
alias cls="clear"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias xbindkeys=xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config
alias unp='unp -U'
alias wifi-menu='sudo wifi-menu -o'

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias ls='eza --icons=auto'
alias ll='eza -alghF --octal-permissions --group-directories-first --icons=auto'
alias la='eza -a --group-directories-first --icons=auto'
alias l='eza -F --group-directories-first --icons=auto'
alias lss='eza -lr --sort=size'
alias lsm='eza -lr --sort=mod'
alias lst='eza --tree --level=2'

alias pacman="sudo pacman"
alias pacs="sudo pacman -S"
alias paci="pacman -Qi"
alias pacr="pacman -Rns"
alias pacro="pacman -Qtdq | pacman -Rns -"
# list unrequierd, not in base (run pacman first for sudo password)
alias pacru="comm -23 <(pacman -Qqt | sort) <(pacman -Qqg base | sort)"
alias pacu="pacman -Syu"
alias pacmu="sudo reflector --verbose --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
alias yas="yay -S --noconfirm"

alias ytl="yt-dlp -F"
alias yta="yt-dlp -x -f bestaudio --audio-quality 0 --audio-format mp3"
alias ytv="yt-dlp -f 302+bestaudio/247+bestaudio" #720p 60fps or 720p 30fps

# pfetch
export PF_INFO="ascii title os kernel pkgs shell wm theme palette"

# removing ls completion highlight color
_ls_colors=":ow=01;35"
zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"
LS_COLORS+=$_ls_colors

bindkey -M menuselect '\r' .accept-line

# NVM
source /usr/share/nvm/init-nvm.sh
# Load Angular CLI autocompletion.
# source <(ng completion script)

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `pipx` on 2023-06-07 10:44:46
export PATH="$PATH:/home/sano/.local/bin"

