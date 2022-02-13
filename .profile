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

# export PGDATA=$HOME/database

# EDITOR
export EDITOR='nvim'

# pretty colors in terminal; exports LS_COLORS.
eval "$(dircolors $HOME/.dircolors)"

# no history in general
export HISTFILE=''
export LESSHISTFILE=''

# firefox on wayland
export MOZ_ENABLE_WAYLAND=1

# random wayland
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export _JAVA_AWT_WM_NONREPARENTING=1
export MOZ_DBUS_REMOTE=1
export GTK_USE_PORTAL=0
