[ -f $HOME/.bashrc ] && . $HOME/.bashrc

paths=( $HOME/.mix/escripts \
	$HOME/.fzf/bin \
	$HOME/bin ) 

for p in "${paths[@]}"; do
   PATH=$p:$PATH
done

export PATH

export EDITOR='nvim'

export PS1='\[\e[0;91m\]\w\n\[\e[0;32m\]| \[\e[0m\]'

# pretty colors in terminal; exports LS_COLORS.
eval "$(dircolors $HOME/.dircolors)"

# space after each cmd, before next prompt.
export PROMPT_COMMAND='echo'

# firefox on wayland
export MOZ_ENABLE_WAYLAND=1

# no history in general
export HISTFILE=''
export LESSHISTFILE=''

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 
