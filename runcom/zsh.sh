# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

# This file should be symlinked to ~/.zshrc

# Bash specific config

export SHELL_TYPE='zsh'

# TODO: Figure out where $XDG_DOTFILES are

export XDG_DOTFILES="$HOME/.files"
source $XDG_DOTFILES/runcom/shared.sh



eval "$(direnv hook zsh)"

# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"

