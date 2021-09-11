# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -F -s=type'
alias la='exa -F -a -s=type'
alias ll='exa -F -l -a -s=type'

alias tree='tree -F'
alias date='date -R'

alias vi='nvim'
alias vim='nvim'

# z.lua

_ZL_CMD='j' eval "$(lua $HOME/bin/z.lua --init bash enhanced once )"

# direnv

eval "$(direnv hook bash)"
