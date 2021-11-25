
# Conform to XDG Base Directory
# https://wiki.archlinux.org/index.php/XDG_Base_Directory

# export XDG_CONFIG_HOME=""
# export XDG_CACHE_HOME=""
# export XDG_DATA_HOME=""
# export XDG_STATE_HOME=""
# export XDG_RUNTIME_DIR=""

# Change default $EDITOR

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

# Load common personal directories

DEV_ROOT=$HOME/development
TMP_ROOT=$HOME/inbox
LIB_ROOT=$HOME/libraries
EDU_ROOT=$HOME/education
