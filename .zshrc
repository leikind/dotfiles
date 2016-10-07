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
  # plugins=(git osx rbenv bundler  rails zsh-syntax-highlighting)
  plugins=(git osx rbenv bundler zsh-syntax-highlighting)

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
  alias less="less -N"
  alias gitx='gitx .'
  # alias subl='subl -n'
  alias grepl='grep  --line-number'
  alias logd="tail -f log/development.log"
  alias logp="tail -f log/production.log"
  alias logt="tail -f log/test.log"
  alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
  alias openports='lsof -i -P | grep -i "listen"'
  alias be='bundle exec'

  alias allover='dropdb frontback_test && dropdb frontback_development && createdb frontback_test && createdb frontback_development && bundle exec rake db:migrate && RAILS_ENV=test  bundle exec rake db:migrate && bundle exec annotate'

### <HEROKU ALIASES>  ###

  # Run psql on the default Heroku app
  alias hsql='heroku pg:psql'

  # Run psql on the FB master
  alias hsqlm='heroku pg:psql -a frontback HEROKU_POSTGRESQL_BRONZE'

  # Run psql on the FB slave
  alias hsqls='heroku pg:psql -a frontback HEROKU_POSTGRESQL_IVORY'

  # Run psql on the FB staging
  alias hsqlst='heroku pg:psql -a frontback-staging'

  # Run irb in FB production
  alias hirbp="heroku run 'rails c' -a frontback"

  # Run irb in FB staging
  alias hirbs="heroku run 'rails c' -a frontback-staging"

  # Stream FB production logs
  alias hlogp="heroku logs -t -d web -a frontback"

  # Stream FB staging logs
  alias hlogs="heroku logs -t -d web -a frontback-staging"

  # Migrate FB production DB
  alias hmigp='heroku run "rake db:migrate" -a frontback'

  # Migrate FB staging DB
  alias hmigs='heroku run "rake db:migrate" -a frontback-staging'

### </HEROKU ALIASES>  ###

####  <VARS> ####

  export PATH="/Users/leikind/bin:/usr/local/sbin:/usr/local/bin:/Users/leikind/projects/android/tools:/Users/leikind/projects/android/platform-tools:/Users/leikind/projects/golang/bin:$PATH"
  export LC_CTYPE=en_US.UTF-8
  export EDITOR="subl -n"
  export GREP_OPTIONS='--color=auto'
  export PAGER='less'
  export LESS='-R'
  export LESSOPEN='|~/.lessfilter %s'
  export LSCOLORS=""

  export GOPATH=/Users/leikind/projects/golang

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

####  </VARS> ####

eval "$(rbenv init -)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


