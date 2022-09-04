# This file should be symlinked to ~/.zshrc

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && source "$HOME/.fig/shell/zshrc.pre.zsh"

# Zsh specific config

export SHELL_TYPE='zsh'

# TODO: Figure out where $XDG_DOTFILES are

export XDG_DOTFILES="$HOME/.files"
source $XDG_DOTFILES/runcom/shared.sh

eval "$(direnv hook zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && source "$HOME/.fig/shell/zshrc.post.zsh"
