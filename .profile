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
BLUE=$(tput setaf 4)
GRAY=$(tput setaf 244)
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

git_prompt() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "\[$YELLOW$BRANCH\]"

    if [ ! -z "$(git status --short)" ]; then
      echo "  \[${BLUE}dirty\]"
    fi
  fi
}

export PS1="\[$RED\w\] \[$GRAY\]$(git_prompt)\n\[$GREEN|\] \[$RESET\]"
export PROMPT_COMMAND='echo && export PS1="\[$RED\w\] \[$GRAY\]$(git_prompt)\n\[$GREEN|\] \[$RESET\]"'

# added by Nix installer
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 
