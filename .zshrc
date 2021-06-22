if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Path to your oh-my-zsh installation.
export ZSH="/home/ordnas/.oh-my-zsh"

plugins=(
  git
  npm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias vim=nvim

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls="echo -ne '\033c'"

alias pacman="sudo pacman"
alias pacs="pacman -S"
alias paci="pacman -Qi"
alias pacr="pacman -Rs"
alias pacu="pacman -Syyu"
alias pacmu="sudo reflector --verbose --latest 7 --sort rate --save /etc/pacman.d/mirrorlist"
alias yas="yay -S --noconfirm"
alias yar="yay -R"

alias ytl="youtube-dl -F"
alias yta="youtube-dl -x -f bestaudio --audio-quality 0 --audio-format mp3"
alias ytv="youtube-dl -f 302+bestaudio/247+bestaudio" #720p 60fps or 720p 30fps
alias yt="youtube-dl -f"

alias sf="neofetch"

# Enable colors for ls, etc. Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]] ; then
    eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

CLICOLOR="YES";    
LSCOLORS="ExGxFxdxCxDxDxhbadExEx";
LS_COLORS=$LS_COLORS:'ow=1;37;45'
export CLICOLOR
export LS_COLORS
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
