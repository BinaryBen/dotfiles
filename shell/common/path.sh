# Start with an explicit minimal PATH
export PATH=/bin:/usr/bin:/usr/local/bin

# Note: The sudo command can still access /sbin:/usr/sbin:/usr/local/sbin

# Add functions from dotfiles
export PATH=$DOTFILES/shell/bin:$PATH

# Add my user-specific executable files in XDG Base Directory Spec
# https://specifications.freedesktop.org/basedir-spec/latest/index.html
export PATH=$HOME/.local/bin:$PATH

# /home/ben/.deno/bin
# /home/ben/.nvm/versions/node/v16.10.0/bin
# /usr/games
# /usr/local/games

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