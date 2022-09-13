
# Conform to XDG Base Directory:
# https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# https://wiki.archlinux.org/index.php/XDG_Base_Directory
# https://wiki.archlinux.org/index.php/XDG_user_directories

# export XDG_STATE_HOME=""

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.xdg}

# Non-standard additions:

export XDG_DOTFILES=${XDG_DOTFILES:-$HOME/.files}
export XDG_SYNC_HOME=${XDG_SYNC_ROOT:-$HOME/.files}
export XDG_SYNC_TMP=${XDG_SYNC_TMP}/Inbox

DEV_ROOT=$HOME/development
LIB_ROOT=$HOME/libraries
EDU_ROOT=$HOME/education

if [[ "$OSTYPE" == darwin* ]]; then
  export XDG_DESKTOP_DIR=${XDG_DESKTOP_DIR:-$HOME/Desktop}
  export XDG_DOCUMENTS_DIR=${XDG_DOCUMENTS_DIR:-$HOME/Documents}
  export XDG_DOWNLOAD_DIR=${XDG_DOWNLOAD_DIR:-$HOME/Downloads}
  export XDG_MUSIC_DIR=${XDG_MUSIC_DIR:-$HOME/Music}
  export XDG_PICTURES_DIR=${XDG_PICTURES_DIR:-$HOME/Pictures}
  export XDG_VIDEOS_DIR=${XDG_VIDEOS_DIR:-$HOME/Videos}
  export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Projects}
fi

# Correct apps that don't follow convention but should
# Thanks @mattmc3: https://github.com/mattmc3/zsh-xdg-basedir/blob/main/zsh-xdg-basedir.zsh (MIT License)

# gpg
export GNUPGHOME="${GNUPGHOME:-$XDG_DATA_HOME/gnupg}"
# jupyter
export JUPYTER_CONFIG_DIR="${JUPYTER_CONFIG_DIR:-$XDG_CONFIG_HOME/jupyter}"
# less
export LESSKEY="${LESSKEY:-$XDG_CONFIG_HOME/less/lesskey}"
export LESSHISTFILE="${LESSHISTFILE:-$XDG_CACHE_HOME/less/history}"
# nodejs
export NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG:-$XDG_CONFIG_HOME/npm/npmrc}"
export NODE_REPL_HISTORY="${NODE_REPL_HISTORY:-$XDG_DATA_HOME/nodejs/repl_history}"
# nuget
export NUGET_PACKAGES="${NUGET_PACKAGES:-$XDG_CACHE_HOME/NuGetPackages}"
# readline
export INPUTRC="${INPUTRC:-$XDG_CONFIG_HOME/readline/inputrc}"
# rust
export CARGO_HOME="${CARGO_HOME:-$XDG_DATA_HOME/cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$XDG_DATA_HOME/rustup}"
# wget
export WGETRC="${WGETRC:-$XDG_CONFIG_HOME/wget/wgetrc}"
# z
export _Z_DATA="${_Z_DATA:-$XDG_DATA_HOME/z/data}"
[[ -f $_Z_DATA ]] || { mkdir -p "$_Z_DATA:h" && touch "$_Z_DATA" }

# Git config

export GITPATH=${GITPATH:-$XDG_DATA_HOME/git}
export GIT_CONFIG_GLOBAL="$HOME/.files/config/git/config"
export GHQ_ROOT="$GITPATH" # Where to store git repos using ghq

# Change default $EDITOR based on personal preference and available options

if command -v micro &> /dev/null
then
  export EDITOR='micro'
elif command -v nano &> /dev/null
then
  export EDITOR='nano'
elif command -v vim &> /dev/null
then
  export EDITOR='vim'
elif command -v vi &> /dev/null
then
  export EDITOR='vi'
fi

# Load beeline icons
source $XDG_DOTFILES/modules/beeline/bin/beeline-icons
