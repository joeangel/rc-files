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
HISTSIZE=1000000
HISTFILESIZE=5000000
HISTTIMEFORMAT='<%F %T %z> : '
alias history.rank="awk '/^[^#]/ {print $1}' ~/.bash_history | sort | uniq -c | sort -nr | head -n 20"

# history file will be re-written and re-read each time bash shows the prompt
#PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
#PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
#PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n"
if [ -z “$(type -t update_terminal_cwd)” ] || [ “$(type -t update_terminal_cwd)” != “function” ]; then
	update_terminal_cwd() {
		true
	}
fi
PROMPT_COMMAND="update_terminal_cwd; history -a; history -n"

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
alias ls='ls -G'
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
alias gs='git status'
alias gshow='git show'
alias ga='git add'
alias gb='git branch'
alias gco='git commit'
alias gd='git diff'
alias ge='git checkout'
alias gf='git files'
alias gfH='git files HEAD'
alias gl='git lg'
alias gfe-p='git fetch -p'
alias gp='git push'
alias gp-u='git push-u'

# some docker aliases
alias d='docker'
alias dps='docker ps'

# coloer regexp
alias grep-color='/bin/grep -P --color=auto'


# for color
color_prompt=yes
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
CYAN="\[\033[01;36m\]"
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
    /usr/bin/ssh-add $HOME/.ssh/id_rsa #github
    /usr/bin/ssh-add $HOME/.ssh/newtalk_rsa
    /usr/bin/ssh-add $HOME/.ssh/gitlab_cto_rsa
    /usr/bin/ssh-add $HOME/.ssh/groowithyou_rsa
    /usr/bin/ssh-add $HOME/.ssh/gitlab_rsa
    /usr/bin/ssh-add $HOME/.ssh/fongyuan_rsa
    /usr/bin/ssh-add $HOME/.ssh/fongyuan_linode_rsa
    /usr/bin/ssh-add $HOME/.ssh/bitbucket_rsa
    /usr/bin/ssh-add $HOME/.ssh/bitbucket_infiniumone_rsa
    /usr/bin/ssh-add $HOME/.ssh/joe-test-20200415_rsa
    /usr/bin/ssh-add $HOME/.ssh/joe_ai_pc_fio_rsa #FiO AI PC
    /usr/bin/ssh-add $HOME/.ssh/fio_ai_pc_fio_rsa #FiO AI PC
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

  # alias
  alias brew-update-joeangel="brew outdated | grep -vE \"(node|mysql|pyenv|python|tesseract|tmux|tomcat)\" | xargs brew upgrade"
fi






# for PS1
if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    # PS1="${RED}\t ${YELLOW} MBPr ${debian_chroot:+($debian_chroot)}${LIGHT_GREEN}\u@\h${NO_COLOR}:${BLUE}\w${YELLOW}\$(parse_git_branch)$NO_COLOR\$ "
    PS1="${RED}\t ${LIGHT_GREEN}\u@JoeAngel.tw${debian_chroot:+($debian_chroot)}${NO_COLOR}\n${CYAN}\w${YELLOW}\$(parse_git_branch)$NO_COLOR\n\$ "
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
alias adb=~/library/Android/sdk/platform-tools/adb

# Nginx
alias nginx.start='sudo nginx'
alias nginx.stop='sudo nginx -s stop'
alias nginx.reload='sudo nginx -s reload'

# LANG
export LANGUAGE=
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_ALL=

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/joe/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/joe/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/joe/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/joe/Downloads/google-cloud-sdk/completion.bash.inc'
fi

export PATH="/usr/local/sbin:$PATH"

# npm
export PATH="$HOME/.npm-packages/bin:$PATH"

# Oracle for npm
export ORACLE_HOME=~/oracle
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME
export OCI_LIB_DIR=$ORACLE_HOME
export OCI_INC_DIR=$ORACLE_HOME/sdk/include

# Google Sources reps for git
eval 'set +o history' 2>/dev/null || setopt HIST_IGNORE_SPACE 2>/dev/null
 touch ~/.gitcookies
 chmod 0600 ~/.gitcookies

 git config --global http.cookiefile ~/.gitcookies

 tr , \\t <<\__END__ >>~/.gitcookies
source.developers.google.com,FALSE,/,TRUE,2147483647,o,git-joe.cto.tw=1/K9xe2F5fruQ_NWIH05AeXKihArIIOv6p3nurFjJpRxo
__END__
eval 'set -o history' 2>/dev/null || unsetopt HIST_IGNORE_SPACE 2>/dev/null


alias gcloud-config-list="gcloud config configurations list"

GOOGLE_APPLICATION_CREDENTIALS=~/fluted-set-132923-49508f6b703e.json
#export PATH="$PATH:$HOME/go/bin"
#export GOPATH="$GOPATH:$HOME/go"

export BASH_SILENCE_DEPRECATION_WARNING=1
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###


## GOLANG
#export GOROOT=$HOME/go
#export GOBIN=$GOROOT/bin
#export GOPATH=$HOME/golang
#export PATH=$PATH:$GOBIN

#金庸 Legend
alias legend="vi -b /Users/joe/Library/Application\ Support/Boxer/Gamebox\ States/DED694755166642CD8BFAB378116CC453CA4BD35/Current.boxerstate/C.harddisk/legend/R1.GRP"

#basher
export PATH="$HOME/.basher/bin:$PATH"   ##basher5ea843
eval "$(basher init - bash)"             ##basher5ea843
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# openjdk. ignore if you need to use java from macOS internal version
export PATH="/usr/local/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# ~/git/apicurio-studio
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

. "$HOME/.cargo/env"

# which kubectl
# - don't use Docker Desktop verison
# - use ~/Downloads/google-cloud-sdk/bin/kubectl
rm -f /usr/local/bin/kubectl

# Kubectl auto completion
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

# go ethereum
export PATH=~/downloads/geth-darwin-amd64-1.10.15-8be800ff:$PATH



# in the last
export PATH=$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')

# for node17+
#export NODE_OPTIONS=--openssl-legacy-provider

# install golang
# $ brew install go && \
#   bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) && \
#   gvm use go1.19 --default && \
#   brew uninstall go && \
#   echo "export GOROOT_BOOTSTRAP=$GOROOT" >> ~/.bashrc
export GOROOT_BOOTSTRAP=/Users/joe/.gvm/gos/go1.19
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

