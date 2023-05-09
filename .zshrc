if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
HISTSIZE=1000
SAVEHIST=1000

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
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias cp="cp -i"      # confirm before overwriting something
alias df='df -h'      # human-readable sizes
alias free='free -m'  # show sizes in MB
alias more=less
alias vim=$EDITOR
alias svim=sudoedit
alias sf="pfetch"
alias swaytree='swaymsg -t get_tree | grep "\"app_id\"\|\"name\"\|\"shell\""'
alias cls="clear"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias xbindkeys=xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config
alias unp='unp -U'

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias ls='exa --icons'
alias ll='exa -alghF --octal-permissions --group-directories-first --icons'
alias la='exa -a --group-directories-first --icons'
alias l='exa -F --group-directories-first --icons'

alias pacman="sudo pacman"
alias pacs="pacman -S"
alias paci="pacman -Qi"
alias pacr="pacman -Rns"
alias pacro="pacman -Qtdq | pacman -Rns -"
alias pacu="pacman -Syu"
alias pacmu="sudo reflector --verbose -c be,nl,fr,de --latest 10 --sort rate --save /etc/pacman.d/mirrorlist"
alias yas="yay -S --noconfirm"

alias ytl="yt-dlp -F"
alias yta="yt-dlp -x -f bestaudio --audio-quality 0 --audio-format mp3"
alias ytv="yt-dlp -f 302+bestaudio/247+bestaudio" #720p 60fps or 720p 30fps

# pfetch
export PF_INFO="ascii title os kernel pkgs shell wm theme palette"

# nmtui colors
export NEWT_COLORS='root=,color5 shadow=white,black title=black,white label=white,black actsellistbox=black,blue actlistbox=white,black button=black,blue'

# removing ls completion highlight color
_ls_colors=":ow=01;35" 
zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"
LS_COLORS+=$_ls_colors

# NVM
# source /usr/share/nvm/init-nvm.sh

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#     source /etc/profile.d/vte.sh
# fi

# Load Angular CLI autocompletion.
# source <(ng completion script)
