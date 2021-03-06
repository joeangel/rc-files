# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# A value of ignoreboth is shorthand for ignorespace and ignoredups.
HISTCONTROL=ignoreboth
#HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=50000
HISTTIMEFORMAT='<%F %T %z> : '
alias history.rank="awk '/^[^#]/ {print $1}' ~/.bash_history | sort | uniq -c | sort -nr | head -n 20"

# history file will be re-written and re-read each time bash shows the prompt
#PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
#PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
if [ ! -z "$PROMPT_COMMAND" ]; then
	PROMPT_COMMAND="$PROMPT_COMMAND; "
fi
PROMPT_COMMAND="history -a; history -n"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lt='ls -alFrth'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# some other aliases
alias netstat='netstat -antp'

# some more rm aliases
# alias rm='rm -i --preserve-root'
alias rm='rm -i'

# some git aliases
#alias 'git-log'='git log --pretty=format:"%h : %s" --graph'
alias 'git-log'="git log --color --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
#alias 'git-log'='git log --pretty=format:"%h(%ar, %ad) : %s" --graph --color'
alias 'git-log-color'='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)"'
#alias 'git-log-topo'='git log --pretty=format:"%h : %s" --topo-order --graph'
alias 'git-log-topo'='git log --pretty=format:"%h(%ar, %ad) : %s" --topo-order --graph --color'
#alias 'git-log-date'='git log --pretty=format:"%h : %s" --date-order --graph'
alias 'git-log-date'='git log --pretty=format:"%h(%ar, %ad) : %s" --date-order --graph --color'
#alias gs='git status'
alias gshow='git show'
#alias ga='git add'
alias gb='git branch'
#alias go='git commit'
#alias gd='git diff'
#alias ge='git checkout'
#alias gf='git files'
alias gl='git lg'

# coloer regexp
alias grep-color='/bin/grep -P --color=auto'


# for color
color_prompt=yes
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
NO_COLOR="\[\033[00m\]"





# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# define custom funtion
exists() { [ ! -z `which "$1"` ]; }
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
# TODO
#     /usr/bin/ssh-add $HOME/.ssh/joeangel_git_rsa
#     /usr/bin/ssh-add $HOME/.ssh/newtalk_rsa
#     /usr/bin/ssh-add $HOME/.ssh/bitbucket_rsa
#     /usr/bin/ssh-add $HOME/.ssh/gitlab_cto_rsa
#     /usr/bin/ssh-add $HOME/.ssh/whosdiary-ec2-host1.pem
#     /usr/bin/ssh-add $HOME/.ssh/groowithyou_rsa
    #ssh-keyscan -t rsa github.com
}
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Source SSH settings, if applicable
# ssh-agent ssh-add
SSH_ENV="$HOME/.ssh/environment"
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Bash git completion for OS X
if exists brew; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
	if [ -f $(brew --prefix nvm)/nvm.sh ]; then
		. "$(brew --prefix nvm)/nvm.sh"
	fi
fi






# for PS1
if [ "$color_prompt" = yes ]; then
    # PS1="${RED}\t ${LIGHT_GREEN}\u@JoeAngel.tw${debian_chroot:+($debian_chroot)}${NO_COLOR}\n${BLUE}\w${YELLOW}\$(parse_git_branch)$NO_COLOR\n\$ "
    PS1="${RED}\t ${LIGHT_GREEN}\u@\h${debian_chroot:+($debian_chroot)}${NO_COLOR}\n${BLUE}\w${YELLOW}\$(parse_git_branch)$NO_COLOR\n\$ "
else
    PS1='\t ${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# for gcin
#export QT4_IM_MODULE=gcin

# for nvm
# TODO
# export NVM_DIR="$HOME/.nvm"

# golang
#export GOPATH=$HOME/gopath
#export PATH=$GOPATH/bin:$PATH

# Add RVM to PATH for scripting
#export PATH="$PATH:$HOME/.rvm/bin"

# Android adb
# TODO
# alias adb=~/library/Android/sdk/platform-tools/adb

# LANG
export LANGUAGE=
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL=

# The next line updates PATH for the Google Cloud SDK.
# TODO
#source '/Users/joe/Downloads/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
# TODO
#source '/Users/joe/Downloads/google-cloud-sdk/completion.bash.inc'

export PATH="/usr/local/sbin:$PATH"
