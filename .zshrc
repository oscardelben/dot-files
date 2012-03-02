# setopt promptsubst
# autoload -U promptinit
# promptinit
# prompt grb

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

# Colors
autoload -U colors
colors
setopt prompt_subst

local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info)%{$reset_color%}'

autoload -U compinit
compinit

export EDITOR="vim"

alias be='bundle exec'
alias migrate='be rake db:migrate && be rake db:test:prepare'
alias vi='vim'
# alias vim='mvim'
alias g='git'
alias gaci='g add .; g ci'
alias b='bundle'
alias reset_db='be rake db:drop; be rake db:create; be rake db:migrate; be rake db:seed; be rake db:test:prepare'

# colors
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export ACK_COLOR_MATCH='red'

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/X11/bin:/usr/X11/bin:/usr/texbin

export PATH=/Users/oscardelben/bin:$PATH

export CC=gcc-4.2

# Git stuff
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'

function wf_setup {
  osascript ~/bin/wf_setup.applescript
}

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
