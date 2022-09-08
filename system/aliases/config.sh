# Dotfile shortcuts

alias zshconf="nano ~/.zshrc && source ~/.zshrc"
alias bashconf="nano ~/.bash_profile && source ~/.bash_profile"
alias saveconf="echo 'This needs to be made"

# Change default config locations to dotfiles repo

alias tmux="tmux -f $XDG_DOTFILES/config/tmux/conf"
# alias lsd="lsd --config-file $XDG_DOTFILES/config/lsd/config.yaml"

# Change default config locastions to $XDG_CONFIG_HOME/{package}

alias gpg="${aliases[gpg]:-gpg} --homedir \"\$GNUPGHOME\""
alias wget="${aliases[wget]:-wget} --hsts-file=\"\$XDG_CACHE_HOME/wget/wget-hsts\""