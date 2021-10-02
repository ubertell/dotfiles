# if not running interactively, don't do anything.
[[ $- != *i* ]] && return

source "$HOME/.alias"

source "$HOME/.prompt"

# make z.lua work.
_ZL_CMD='j' eval "$(lua $HOME/bin/z.lua --init bash enhanced once )"

# make direnv work.
eval "$(direnv hook bash)"
