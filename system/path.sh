# shellcheck shell=sh

# Construct the $PATH explicitly ...
# 💡 Tip: Comment out things you never use

export DEFAULT_PATH=$PATH
export PATH=

path() { # List $PATH line by line, or add argument to $PATH
  if [[ -z $1 ]]; then
    echo -e ${PATH//:/\\n}
  else # Add something to the path if it exists
    [ -d $1 ] && export PATH="$1:$PATH"
  fi
}

# Start with a minimal PATH
path /sbin
path /usr/sbin
path /usr/local/sbin
path /bin
path /usr/bin
path /usr/local/bin
path /opt/sbin
path /opt/bin

# Add Node Version Manager
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  # This loads nvm (and by extension Node and globally installed packages)
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  # This loads nvm bash_completion
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# As above, but if installed via Homebrew
elif [ -d /opt/homebrew/opt/nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi

# Homebrew
path /opt/homebrew/sbin
path /opt/homebrew/bin

# Language specific binaries
path $HOME/.composer/vendor/bin         # PHP / Composer
path $HOME/.nimble/bin                  # Nim
path $NIMBLEDIR/bin                     # Nim
path /usr/local/lib/ruby/gems/2.7.0/bin # Ruby
path $HOME/.deno/bin                    # Deno
path /usr/local/share/dotnet            # .NET

# GNU coreutils for macOS without g prefix
path "$(brew --prefix)/opt/coreutils/libexec/gnubin"

# Windows Subsystem for Linux:

# /mnt/c/Program Files (x86)/Common Files/Oracle/Java/javapath
# /mnt/c/Windows/system32
# /mnt/c/Windows
# /mnt/c/Windows/System32/Wbem
# /mnt/c/Windows/System32/WindowsPowerShell/v1.0/
# /mnt/c/Windows/System32/OpenSSH/
# /mnt/c/Program Files/Microsoft VS Code/bin
# /mnt/c/Program Files/Docker/Docker/resources/bin
# /mnt/c/ProgramData/DockerDesktop/version-bin
# /mnt/c/Program Files/dotnet/
# /mnt/c/Users/Ben/AppData/Local/Microsoft/WindowsApps

# Submodules from dotfiles
path ${XDG_DOTFILES}/modules/beeline/bin
path ${XDG_DOTFILES}/modules/gud/bin
path ${XDG_DOTFILES}/modules/tux/bin
path ${XDG_DOTFILES}/modules/sysadmin-util

# Add other functions from dotfiles
path $XDG_DOTFILES/bin

# Add my user-specific executable files in XDG Base Directory Spec
# https://specifications.freedesktop.org/basedir-spec/latest/index.html

path $HOME/.local/bin
path $HOME/bin # Added in case it exists, but prefer above!
