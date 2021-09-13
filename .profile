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

# promt with Git
R=$(tput setaf 1)
G=$(tput setaf 2)
B=$(tput setaf 4)
Y=$(tput setaf 3)
GR=$(tput setaf 244)
RE=$(tput sgr0)

git_prompt() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  if [ ! -z $BRANCH ]; then
    GIT="\[$GR/\] \[$Y$BRANCH\] "
    if [ ! -z "$(git status --short)" ]; then
        GIT="$GIT \[$GR/\] \[${B}dirty\]"
    fi
    echo $GIT
    # tput cols
  fi
}

export PS1="\[$R\w\] \[$GR\]$(git_prompt)\n\[$G|\] \[$RE\]"
export PROMPT_COMMAND='echo && export PS1="\[$R\w\] \[$GR\]$(git_prompt)\n\[$G|\] \[$RE\]"'

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 
