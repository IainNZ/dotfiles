#############################################################################
# Iain's Customized bashrc
#############################################################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#############################################################################
# HISTORY OPTIONS
#############################################################################
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Number of lines to keep in memory and in the file respectively
HISTSIZE=10000
HISTFILESIZE=10000

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#############################################################################
# WINDOW OPTIONS
#############################################################################
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#############################################################################
# VISUAL OPTIONS
#############################################################################
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Prompt config
#export PS1='\e[1;30m\u@\h:\e[m \e[1;31m\w\e[m$ '
#export PS1='\u@\h: \w$ '
export PS1="\[$(tput bold)\]\[$(tput setaf 0)\]\u@\h:\[$(tput setaf 1)\]\w\$ \[$(tput sgr0)\]"
# Reduce size of current working directory
PROMPT_DIRTRIM=2
# Set the title of the window
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

#############################################################################
# ALIASES
#############################################################################
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#############################################################################
# EXPORTS
#############################################################################
export GUROBI_LIB=/opt/gurobi550/linux64/lib/libgurobi55.so
