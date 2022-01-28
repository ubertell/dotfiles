[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# PATH
paths=( \
	$HOME/bin \
	$HOME/.fzf/bin \
    $HOME/.node_modules/bin \
    $HOME/.roswell/bin \
    $HOME/opt/lfe/bin \
    /usr/lib/psql14/bin \
)

for p in "${paths[@]}"; do
   PATH=$p:$PATH
done

export PATH

export PGDATA=$HOME/database

# EDITOR
export EDITOR='nvim'

# pretty colors in terminal; exports LS_COLORS.
eval "$(dircolors $HOME/.dircolors)"

# firefox on wayland
export MOZ_ENABLE_WAYLAND=1

# no history in general
export HISTFILE=''
export LESSHISTFILE=''
