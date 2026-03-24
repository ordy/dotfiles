HISTFILE=$HOME/.local/share/zsh/history
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
export PS1="%{$(tput setaf 183)%}%n%{$(tput setaf 216)%}@%{$(tput setaf 216)%}%m %{$(tput setaf 111)%}%1~ %{$(tput sgr0)%}$ "

# Aliases
source ~/.aliases.zsh

# zcompdump
autoload -Uz compinit
zcomp=$XDG_CACHE_HOME/zsh/compdump/zcompdump

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
