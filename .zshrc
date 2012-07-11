# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="leikind"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler gemmacports osx ruby rbenv textmate rake)

source $ZSH/oh-my-zsh.sh

## My settings

git_prompt_info_mine () {
  ref=$(git symbolic-ref HEAD 2> /dev/null)  || return
  echo "$(echo $ref | sed 's/^.*\///' )"
}

####

export CURRENT_PROJECT_PATH=$HOME/.current-project

function chpwd {
  echo $(pwd) >! $CURRENT_PROJECT_PATH
}

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}

current

### VARIABLES ###

export LC_CTYPE=en_US.UTF-8
export EDITOR="subl -n"
export GREP_OPTIONS='--color=auto'
export PAGER='less'
export LSCOLORS=""

alias rspec="rspec -c"
alias ls="ls -G"
alias gitx='gitx .'
alias subl='subl -n'
alias grepl='grep  --line-number'
alias logd="tail -f log/development.log"
alias logp="tail -f log/production.log"
alias mysqlstart='sudo /opt/local/share/mysql5/mysql/mysql.server start'
alias mysqlstop='sudo /opt/local/share/mysql5/mysql/mysql.server stop'
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
unalias ruby

# zsh settings from tren
setopt histignorealldups
setopt histverify
setopt extendedhistory
setopt incappendhistory
unsetopt sharehistory

####  PATHS ####

export PATH="/Users/leikind/bin:/Users/leikind/local/android-sdk-macosx/tools:/Users/leikind/local/android-sdk-macosx/platform-tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

eval "$(rbenv init -)"
