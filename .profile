### PROMPT ###
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

export PS1="\u:\w\$(parse_git_branch)$ "
# export PS1="\u:\w\$ "


### ALIASES ###

alias ls="ls -G"
alias filt="grep -vE 'log|.svn'"
alias logd="tail -f log/development.log"
alias logp="tail -f log/production.log"
alias grepl='grep  --line-number'

alias svnlog="svn log  -r HEAD:1"
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

alias startmysql="launchctl load -w /Users/leikind/Library/LaunchAgents/com.mysql.mysqld.plist"
alias stopmysql="launchctl unload -w /Users/leikind/Library/LaunchAgents/com.mysql.mysqld.plist"

### VARIABLES ###

export HISTCONTROL=erasedups
export HISTSIZE=10000
export LC_CTYPE=en_US.UTF-8
export EDITOR="mate -w"
export GREP_OPTIONS='--color=auto'
export PAGER='less'


####  PATHS ####

export PATH="/Users/leikind/bin:/Users/leikind/local/android-sdk-macosx/tools:/Users/leikind/local/android-sdk-macosx/platform-tools:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"

eval "$(rbenv init -)"

