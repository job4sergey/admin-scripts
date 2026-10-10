# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

# bindkey -v

#ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶️"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="meine"
#ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jsontools dirhistory zsh-completions)

source $ZSH/oh-my-zsh.sh

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R ' 

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias s="/usr/bin/subl"
alias v="/home/slapukhov/distr/dev/vs_code/VSCode-linux-x64/code"

_pyval() {
    local python_cmd="print($@)"
    python3 -c "${python_cmd}"

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
alias gitclo="git clone"
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
alias gitgre="git grep -n -i"
alias gitgre0="git grep -n"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias p3='python3'
alias p2='python2'

export SCRIPTS_DIR="$HOME/src/admin-scripts/mcl"
VS_CODE_DIR=/home/slapukhov/distr/dev/vs_code/VSCode-linux-x64

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
alias sublrc='subl ~/.bashrc'

alias vimp="$SCRIPTS_DIR/vimp.sh"
alias shh="perl ~/shh.pl"
alias tare='tar xfv'

tarc () {
    ARCH=`basename "$1"`."tgz"
    tar cvfz "$ARCH" $1
    cpfl
}


alias uzi='unzip '
alias findn='find . -name'
alias fin="$SCRIPTS_DIR/find_by_ext.sh"
alias grswn='grep -Rswn '
alias grsn='grep -Risn '
alias gg='git grep '
alias ggn='git grep -n'
alias k3='kdiff3'
alias send_ttyUSB0='cat $FFILE | pv -s `du -b -s $FFILE | cut -f1`  > /dev/ttyUSB0'
# alias cd2='AAAA=`xclip -sel c -o`; cd `$SCRIPTS_DIR/get_dirname.py $AAAA`'
alias cd2='AAAA=$1; cd `$SCRIPTS_DIR/cd2_dst.py $AAAA`'
alias md5='md5sum '
alias xop='fff123(){xdg-open "$1";  unset -f fff123; }; fff123'
alias clipimg="python3 $SCRIPTS_DIR/pasteimg.py"

alias ffprobe_json='ffprobe  -v quiet  -print_format json -show_format -show_streams '
alias meinf='mediainfo '
alias meee='mediainfo '

alias v="start_app code ."

alias h1='hstr'
function cv () {
           cdargs "$1" && cd "`cat "$HOME/.cdargsresult"`" ;
       }

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

export M2_HOME="$HOME/distr/dev/java/mvn/apache-maven-3.8.6"
export MAVEN_HOME="$HOME/distr/dev/java/mvn/apache-maven-3.8.6"

alias mvn="$M2_HOME/bin/mvn"
alias mvnDebug="$M2_HOME/bin/mvnDebug"

export GRADLE_HOME="$HOME/distr/dev/java/gradle/gradle-7.2"
alias gradle="$GRADLE_HOME/bin/gradle"
alias gitui="gitk > /dev/null 2>&1 &"
alias xo="xdg-open"
alias paste_img="xclip -selection clipboard -t image/png -o > ~/clipboard_image.png"

start_app() {
    "$@" > /dev/null 2>&1 &
}

alias sap="start_app"
export ZNAMESPACE="-n default"



set_ns() {
    export ZNAMESPACE="$@"
}

pods09() {
    kubectl get pods
}

pods0() {
    kubectl get pods -n default
}

pods9() {
    kubectl get pods | grep "$@"
}

deployments9() {
    kubectl get deployments | grep "$@"
}

pods() {
    kubectl get pods -n default | grep "$@"
}

deployments() {
    kubectl get deployments -n default | grep "$@"
}

objs_get0() {
    kubectl get "$1" -n default
}

objs_get09() {
    kubectl get "$1" 
}

objs_get9() {
    kubectl get "$1" | grep "$2"
}

objs_get() {
    kubectl get "$1" -n default | grep "$2"
}

podit9() {
    kubectl exec -it "$@" -- bash
}

podit() {
    kubectl -n default exec -it "$@" -- bash
}

podex9() {
    kubectl exec -it "$1" -- "$2"
}

podex() {
    kubectl -n default exec -it "$1" -- "$2"
}

podit_sh() {
    kubectl -n default exec -it "$@" -- sh
}

podlogf9() {
   kubectl logs -f "$@"
}

podlog9() {
   kubectl logs "$@"
}

podlogle9() {
   kubectl logs "$@" | less
}

podlogf() {
   kubectl -n default logs -f "$@"
}

podlog() {
   kubectl -n default logs "$@"
}   

podlogle() {
   kubectl -n default logs "$@" | less
}

# END java stuff

refresh_pwd() {
    export PGSSLMODE=require;
    export PGPASSWORD=$(my_passwor_getter);
}

database_live() {                echo -e "\e[1;32m # DB NAME :\e[0m" && psql -h my.db.our.network.org -p 5432 -d our_pg_db -U slapukhov -c "$@";}
# -U slapukhov -f "$@"; } - with file

source <(kubectl completion zsh)


    
export PATH=$PATH:/usr/local/go/bin:$VS_CODE_DIR

# bindkey '"\ew": vi-forward-bigword'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# mc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
