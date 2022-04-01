# Construct the $PATH explicitly
# Tip: Comment out things you never use to speed up load time

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

# Composer binaries
path $HOME/.composer/vendor/bin 

# Add Node Version Manager
if [ -d $HOME/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  # This loads nvm (and by extension Node and globally installed packages)
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  # This loads nvm bash_completion
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
fi

# As above, but if installed via Homebrew
if [ -d /opt/homebrew/opt/nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
fi

# Homebrew
path /opt/homebrew/sbin
path /opt/homebrew/bin

# Deno binaries
path $HOME/.deno/bin

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

# Add functions from dotfiles
path $XDG_DOTFILES/bin

# Add my user-specific executable files in XDG Base Directory Spec
# https://specifications.freedesktop.org/basedir-spec/latest/index.html

path $HOME/.local/bin
path $HOME/bin            # Added in case it exists, but prefer above!
