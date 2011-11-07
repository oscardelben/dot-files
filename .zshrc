setopt promptsubst
autoload -U promptinit
promptinit
prompt grb

autoload -U compinit
compinit

export EDITOR="vim"

alias be='bundle exec'
alias migrate='be rake db:migrate && be rake db:test:prepare'
alias vi='vim'
alias g='git'

# colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export ACK_COLOR_MATCH='red'

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/X11/bin:/usr/texbin

# Add Valgrind installation
export PATH=/Users/oscar/trunk/inst/bin:$PATH

# Git stuff
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
