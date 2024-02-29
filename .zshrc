# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# Aliases
source ~/.aliases.zsh

# Lazy load nvm
lazy_load_nvm() {
  unset -f npm node nvm
	export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
# Load Angular CLI autocompletion.
	source <(ng completion script)
}

npm() {
	lazy_load_nvm
	npm $@
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  nvm $@
}

# zcompdump
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.cache/zsh/compdump/zcompdump-${ZSH_VERSION} 2>/dev/null || stat -f '%Sm' -t '%j' ~/.cache/zsh/compdump/zcompdump-${ZSH_VERSION} 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i -d ~/.cache/zsh/compdump/zcompdump-${ZSH_VERSION}
else
  compinit -C -i -d ~/.cache/zsh/compdump/zcompdump-${ZSH_VERSION}
fi

# Plugins
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/key-bindings.zsh
source ~/.zsh/completion.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# autocompletion menu
zmodload -i zsh/complist
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
