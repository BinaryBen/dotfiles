# This file should be symlinked to ~/.bashrc

# Bash specific config

export SHELL_TYPE='bash'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# TODO: Figure out where $XDG_DOTFILES are

export XDG_DOTFILES="$HOME/.files"
source $XDG_DOTFILES/runcom/shared.sh
