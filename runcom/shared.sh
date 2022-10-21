# All source files are loaded from here

# Confirm $XDG_DOTFILES is set
if [[ -z "${XDG_DOTFILES}" ]]; then
  echo "\$XDG_DOTFILES is not set. Exiting..."
  exit 1
fi

reload() { # Helper to (re)load source files

  # TODO: Should I implement a way to reload .zshrc and .bashrc files?

  if [[ -z $1 ]]; then # Load all dotfiles by default

    # Note: The order matters! Don't change it...

    reload utilities # Utility fn to help the rest of the setup
    reload env
    reload path
    reload functions # Simple fn that don't need their own script
    reload aliases

    # Load beeline (TODO: Find a better way)
    . b6 init # Here so prompt can access the set env

    reload prompt

  else
    # Load scope from ...

    # $HOME/.local first in case there are any local overrides ...

    if [ -d $HOME/.local/system/$1 ]; then
      for FILE in $(find $HOME/.local/system/$1); do
        [ -f “$FILE” ] && source “$FILE”
      done
    fi

    [ -f $HOME/.local/system/$1.sh ] && source $HOME/.local/system/$1.sh

    # ... and then $XDG_DOTFILES

    if [ -d $XDG_DOTFILES/system/$1 ]; then
      for FILE in $(find $XDG_DOTFILES/system/$1); do
        [ -f $FILE ] && source $FILE
      done
    fi

    [ -f $XDG_DOTFILES/system/$1.sh ] && source $XDG_DOTFILES/system/$1.sh

  fi

}
reload

# Display the welcome animation
if [[ -z "${B7N_NO_SPLASH}" ]]; then
  sysport
fi
