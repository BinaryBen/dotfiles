
# Load common

sourceDotfiles() {
  for DOTFILE in `find $DOTFILES/$1`
  do
    [ -f “$DOTFILE” ] && source “$DOTFILE”
  done
}

sourceDotfiles shell/common
sourceDotfiles shell/functions
sourceDotfiles shell/aliases

source $XDG_CONFIG_HOME/.aliases