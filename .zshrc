
source ~/.zsh/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

export EDITOR="mvim -v"
export PAGER="less"

# Re-map ^R
bindkey '^R' history-incremental-search-backward

alias be='bundle exec'
alias vim='mvim -v' # Mac only. Use mac vim in terminal mode
alias vi='vim'
alias g='git'
alias gg='git grep'
alias b='bundle'

alias bison=/usr/local/Cellar/bison/3.0.2/bin/bison

# colors
export CLICOLOR=1
export GREP_OPTIONS="--color"
export ACK_COLOR_MATCH='red'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/bin:$PATH

# rbenv
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export JRUBY_OPTS=--1.9

bindkey -v
