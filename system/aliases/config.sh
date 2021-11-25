# Dotfile shortcuts

alias zshconf="nano ~/.zshrc && source ~/.zshrc"
alias bashconf="nano ~/.bash_profile && source ~/.bash_profile"
alias saveconf="echo 'This needs to be made"

# Change default config locations to dotfiles repo

alias tmux="tmux -f $XDG_DOTFILES/config/tmux/conf"
# alias lsd="lsd --config-file $XDG_DOTFILES/config/lsd/config.yaml"