[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export EDITOR='nvim'

paths=( $HOME/.mix/escripts \
	$HOME/.fzf/bin \
	$HOME/bin ) 

for p in "${paths[@]}"; do
   PATH=$p:$PATH
done

export PATH

export PS1='\[\e[0;91m\]\w\n\[\e[0;32m\]| \[\e[0m\]'

export PROMPT_COMMAND='echo'

eval "$(dircolors $HOME/.dircolors)"

export HISTFILE=''
export LESSHISTFILE=''

