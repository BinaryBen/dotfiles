# This file should be symlinked to ~/.zshrc

# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && source "$HOME/.fig/shell/zshrc.pre.zsh"

# Zsh specific config

export SHELL_TYPE='zsh'

# don't put duplicate lines or lines starting with space in the history.
# See https://zsh.sourceforge.io/Doc/Release/Options.html for more options
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space

# TODO: Figure out where $XDG_DOTFILES are

export XDG_DOTFILES="$HOME/.files"
source $XDG_DOTFILES/runcom/shared.sh

eval "$(direnv hook zsh)"

# Zsh plugins (say no to frameworks kids!)
# https://github.com/mattmc3/zsh_unplugged

ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.plugin.zsh

plugins=(
  zsh-users/zsh-completions
  # rupa/z # How does this compare with j?
  akash329d/zsh-alias-finder
  chrissicool/zsh-256color
  unixorn/fzf-zsh-plugin
  # jeffreytse/zsh-vi-mode # Broken?
  MichaelAquilina/zsh-auto-notify
  # michaelxmcbride/zsh-dircycle # Broken?
  reegnz/jq-zsh-plugin
  zshzoo/magic-enter
  changyuheng/zsh-interactive-cd
  jgogstad/passwordless-history
  momo-lab/zsh-smartinput # Auto adds closing brackets and other pairs
  idadzie/zsh-presenter-mode
  AdrieanKhisbe/diractions
  Aloxaf/fzf-tab

  # Plugins that MUST go last (do NOT change order):
  zdharma-continuum/fast-syntax-highlighting # > zsh-users/zsh-syntax-highlighting
  # zsh-users/zsh-history-substring-search #TODO: Learn how to use it
  zsh-users/zsh-autosuggestions
)

plugin-load $plugins

# What to run when told not to run a thing
function magic-enter-cmd {
  preamble="👋 Hello $(whoami)!\n📂 $PWD\n"
  echo "clear && echo \"$preamble\" | lolcat && l"
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && source "$HOME/.fig/shell/zshrc.post.zsh"
