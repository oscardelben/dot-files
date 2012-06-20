# Colors
autoload -U colors
colors

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

# Set the prompt.
source ~/.zsh/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Completion
autoload -U compinit
compinit

# Automatically cd to dir
setopt AUTO_CD

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export EDITOR="vim"

# Use vim key bindings
bindkey -v

# Re-map ^R
bindkey '^R' history-incremental-search-backward

alias be='bundle exec'
alias migrate='be rake db:migrate && be rake db:test:prepare'
alias vi='vim'
alias g='git'
alias gg='git grep'
alias gs='g st'
alias b='bundle'
alias reset_db='be rake db:drop; be rake db:create; be rake db:migrate; be rake db:seed; be rake db:test:prepare'

# colors (again!)
export CLICOLOR=1
export LSCOLORS="gxex"
export GREP_OPTIONS="--color"
export ACK_COLOR_MATCH='red'

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/X11/bin:/usr/texbin

export PATH=$HOME/bin:$PATH

# Git stuff
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias gpull='git pull origin $(current_branch)'
alias gpush='git push origin $(current_branch)'

function mkcdir() {
  mkdir $1
  cd $1
}

# rbenv
eval "$(rbenv init -)"
