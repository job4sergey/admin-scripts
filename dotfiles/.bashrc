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
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
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

alias s="/usr/bin/subl"
alias v=/usr/share/code/code 

_pyval() {
    local python_cmd="print $@"
    python -c "${python_cmd}"

    case "$shopts" in
        *noglob*) ;;
        *) set +f;;
    esac

    unset shopts
}

alias pyval='shopts="$SHELLOPTS"; set -f; _pyval'

alias clipit="$SCRIPTS_DIR/clipit.sh"
alias openit="$SCRIPTS_DIR/explorerit.sh"
alias cpcd="$SCRIPTS_DIR/cpcd.sh"
alias cpf="$SCRIPTS_DIR/cpf.sh" 
alias cpcl="$SCRIPTS_DIR/cpcl.sh" 
alias cpcat="$SCRIPTS_DIR/cpcat.sh"

alias piu="until git pull --rebase && git push; do echo 'Retrying...'; done"
alias cpiu="c 'until git pull --rebase && git push; do echo 'Retrying...'; done'"
alias cgits="c 'git status'"
alias gita="git add"
alias gits="git status"
alias gitl="git log"
alias gitb="git branch"
alias gitpr="git pull --rebase"
alias gitp="git pull"
alias gitpu="git push"
alias gitc="git commit -m"
alias gitcc="git commit"
alias gitco="git checkout"
alias gitcob="git checkout -b "
alias gitl="git log"
alias gitd="git diff"
alias gitds="git diff --staged"
alias gitcc="git clone"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias p3='python3'

SCRIPTS_DIR="$HOME/src/admin-scripts/mcl"

alias clipit="$SCRIPTS_DIR/clipit.sh"
alias openit="$SCRIPTS_DIR/explorerit.sh ."
alias openit2="$SCRIPTS_DIR/explorerit.sh"
alias cp2="$SCRIPTS_DIR/cp_to_cd.sh"
alias cpd2="$SCRIPTS_DIR/cp_dir_to_cd.sh"
alias mv2="$SCRIPTS_DIR/mv_to_cd.sh"
alias mv2d="$SCRIPTS_DIR/mvd_to_cd.sh"
alias mv2dy="$SCRIPTS_DIR/mvd_to_cd.sh y"
alias mvd="$SCRIPTS_DIR/mvd_to_cd.sh y"
alias cpf="$SCRIPTS_DIR/absolute_path_to_clipboard.sh" 
alias cpfl="ls -Art | tail -n 1 | xargs -0 $SCRIPTS_DIR/absolute_path_to_clipboard.sh" 
alias cn="$SCRIPTS_DIR/file_name_to_clipboard.sh" 
alias cdcp="$SCRIPTS_DIR/cd_to_clipboard.sh"
alias clcp="$SCRIPTS_DIR/command_line_to_clipboard.sh" 
alias catcp="$SCRIPTS_DIR/cat_file_to_clipboard.sh"

alias mc='EDITOR=subl mc'

alias vimp="$SCRIPTS_DIR/vimp.sh"
alias shh="perl ~/shh.pl"
alias tare='tar xfv'
alias tarc='tar cfvz'
alias uzi='unzip '
alias findn='find . -name'
alias fin="$SCRIPTS_DIR/find_by_ext.sh"
alias grswn='grep -Rswn '
alias k3='kdiff3'
alias send_ttyUSB0='cat $FFILE | pv -s `du -b -s $FFILE | cut -f1`  > /dev/ttyUSB0'
alias cd2='cd "`xclip -sel c -o`"'
alias md5='md5sum '
alias clipimg="$SCRIPTS_DIR/pasteimg.py"

alias ffprobe_json='ffprobe  -v quiet  -print_format json -show_format -show_streams '
alias meinf='mediainfo '
alias meee='mediainfo '

pawf() {
    perl -F"$1" -lan "$2"
}

pawfd() {
    perl -d -F"$1" -lan "$2"
}

pawk() {
    perl -F"$1" -lane "$2"
}

# START java stuff

export M2_HOME="$HOME/distr/dev/java/mvn/apache-maven-3.8.3/"
export MAVEN_HOME="$HOME/distr/dev/java/mvn/apache-maven-3.8.3/"

alias mvn="$M2_HOME/bin/mvn"

export GRADLE_HOME="$HOME/distr/dev/java/gradle/gradle-7.2"
alias gradle="$GRADLE_HOME/bin/gradle"
alias gitui="gitk > /dev/null 2>&1 &"

# END java stuff

tst_fn() {
   echo "<--$1-->"
}

vv() {
    nohup "vlc \"$1\""
}

export KN5SPACE=`cat ~/.kn5space`

set_ns() {
    if [ -n "$1" ]; then
        echo "$1" > ~/.kn5space
    fi
    export KN5SPACE=$(cat ~/.kn5space)
}

set_ns  

alias k="kubectl "

kpods() {
    if [ -z "$1" ]; then
        kubectl get pods -n $KN5SPACE
    else
        kubectl get pods -n $KN5SPACE | grep "$1"
    fi
}

kdeploys() {
    if [ -z "$1" ]; then
        kubectl get deployments -n $KN5SPACE
    else
        kubectl get deployments -n $KN5SPACE | grep "$1"
    fi
    
}

kobjs() {
    if [ -z "$1" ]; then
        echo "usage: kobs OBJ_KIND [filter expression]"
    else
        if [ -n "$2" ]; then
            kubectl get "$1" -n $KN5SPACE | grep -P "$2"
        else
            kubectl get "$1" -n $KN5SPACE
        fi    
    fi
}

kpodit() {
    if [ -z "$1" ]; then
        echo "usage: podit POD"
    else
        kubectl -n $KN5SPACE exec -it "$1" -- sh
    fi
}

kpodex() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "usage: kpodex POD COMMAND"
    else
        kubectl exec -n $KN5SPACE -it "$1" -- "$2"
    fi    
}

kpodlogf() {
    if [ -z "$1" ]; then
        echo "usage: kpodlogf POD"
    else
        kubectl -n $KN5SPACE logs -f "$1"
    fi
}

kpodlogle() {
    if [ -z "$1" ]; then
        echo "usage: kpodlogle POD"
    else
        kubectl -n $KN5SPACE logs "$1" | less
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
