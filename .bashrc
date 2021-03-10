#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls="echo -ne '\033c'"

alias pacman="sudo pacman"
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -Rs"
alias pacu="sudo pacman -Syyu"
alias pacmu="sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"

alias ytl="youtube-dl -F"
alias yta="youtube-dl bestaudio"
alias ytv="youtube-dl bestvideo[height=720, ext=webm]"
alias yt="youtube-dl -f"

alias sf="screenfetch"

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Change the window title of X terminals
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
	PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
	;;
    screen*)
	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
	;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] && type -P dircolors >/dev/null && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

shortwd() {
    num_dirs=3
    newPWD=$(dirs +0)
    if [ $(echo -n $newPWD | awk -F '/' '{print NF}') -gt $num_dirs ]; then
	newPWD=$(echo -n $newPWD | awk -F '/' '{print $1 ".../" $(NF-1) "/" $(NF)}')
    fi 
    echo -n $newPWD
}

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ ⎇ (\1)/'
}

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
    if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
	    eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
	    eval $(dircolors -b /etc/DIR_COLORS)
	fi
    fi

    if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    else
	PS1='\e[1;30m[ \e[32m$(shortwd) \e[1;30m]\e[31m$(git_branch) \e[1;30m>\e[1;34m>\e[0m '
    fi

    CLICOLOR="YES";    export CLICOLOR
    LSCOLORS="ExGxFxdxCxDxDxhbadExEx";    export LSCOLORS
    LS_COLORS=$LS_COLORS:'ow=32;47'
    export LS_COLORS

    alias ls='ls --color=auto'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
else
    if [[ ${EUID} == 0 ]] ; then
	# show root@ when we don't have colors
	PS1='\u@\h \W \$ '
    else
	PS1='\u@\h \w \$ '
    fi
fi

unset use_color safe_term match_lhs sh

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

# ex - archive extractor
# usage: ex <file>
ex ()
{
    if [ -f $1 ] ; then
	case $1 in
	    *.tar.bz2)   tar xjf $1   ;;
	    *.tar.gz)    tar xzf $1   ;;
	    *.bz2)       bunzip2 $1   ;;
	    *.rar)       unrar x $1     ;;
	    *.gz)        gunzip $1    ;;
	    *.tar)       tar xf $1    ;;
	    *.tbz2)      tar xjf $1   ;;
	    *.tgz)       tar xzf $1   ;;
	    *.zip)       unzip $1     ;;
	    *.Z)         uncompress $1;;
	    *.7z)        7z x $1      ;;
	    *)           echo "'$1' cannot be extracted via ex()" ;;
	esac
    else
	echo "'$1' is not a valid file"
    fi
}

export PATH="$HOME/.bin:$PATH"

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
