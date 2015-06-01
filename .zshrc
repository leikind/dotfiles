# <ZSH specific>

  ZSH=$HOME/.oh-my-zsh

  # Look in ~/.oh-my-zsh/themes/
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
  COMPLETION_WAITING_DOTS="true"

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
  # Example format: plugins=(rails git textmate ruby lighthouse)
  # plugins=(git bundler gemmacports osx ruby rbenv textmate rake)
  plugins=(git  osx rbenv bundler  rails zsh-syntax-highlighting)

  source $ZSH/oh-my-zsh.sh


  setopt histignorealldups
  setopt histverify
  setopt extendedhistory
  setopt incappendhistory
  unsetopt sharehistory
# </ZSH specific>


### <PROMPT>  ###

  git_prompt_info_mine () {
    ref=$(git symbolic-ref HEAD 2> /dev/null)  || return
    echo "$(echo $ref | sed 's/^.*\///' )"
  }

### </PROMPT>  ###

### <GETTING BACK TO THE PREVIOUS DIRECTORY>  ###

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

### </GETTING BACK TO THE PREVIOUS DIRECTORY>  ###

### <ALIASES>  ###

  alias rspec="rspec -c"
  alias ls="ls -G"
  alias gitx='gitx .'
  alias subl='subl -n'
  alias grepl='grep  --line-number'
  alias logd="tail -f log/development.log"
  alias logp="tail -f log/production.log"
  alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

  alias be='bundle exec'
  alias begm='bundle exec rails g migration'
  alias bem='bundle exec rake db:migrate'
  alias bes='bundle exec rake spec'
  alias bec='bundle exec rails c'
  alias ber='bundle exec rails r'

  alias bet="bundle exec thin start -p 3000"

  alias upgradebrew="brew outdated | awk '{print $1}' | xargs echo"

### </ALIASES>  ###

####  <VARS> ####

  export PATH="/Users/leikind/bin:/usr/local/sbin:/usr/local/bin:/Users/leikind/Library/Android/sdk/tools:/Users/leikind/Library/Android/sdk/platform-tools:$PATH"
  export LC_CTYPE=en_US.UTF-8
  export EDITOR="subl -n"
  export GREP_OPTIONS='--color=auto'
  export PAGER='less'
  export LESS='-R'
  export LESSOPEN='|~/.lessfilter %s'
  export LSCOLORS=""

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

####  </VARS> ####

eval "$(rbenv init -)"

