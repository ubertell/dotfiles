# if not running interactively, don't do anything.
[[ $- != *i* ]] && return

source "$HOME/.alias"
source "$HOME/.prompt"

# make z.lua work.
_ZL_CMD='j' eval "$(lua $HOME/bin/z.lua --init bash enhanced once )"

# make direnv work.
# eval "$(direnv hook bash)"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
