[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# PATH
paths=( $HOME/.mix/escripts \
	$HOME/.fzf/bin \
	$HOME/bin ) 

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

# opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
