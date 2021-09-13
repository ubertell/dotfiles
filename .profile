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

. $HOME/.prompt

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 
