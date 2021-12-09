[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# PATH
paths=( \
	$HOME/bin \
	$HOME/.fzf/bin \
    $HOME/.node_modules/bin \
    $HOME/.roswell/bin \
)

for p in "${paths[@]}"; do
   PATH=$p:$PATH
done

export PATH

# EDITOR
export EDITOR='nvim'

# pretty colors in terminal; exports LS_COLORS.
eval "$(dircolors $HOME/.dircolors)"

# firefox on wayland
export MOZ_ENABLE_WAYLAND=1

# no history in general
export HISTFILE=''
export LESSHISTFILE=''
