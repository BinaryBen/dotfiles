
alias ~="cd $HOME"
alias cg='cd `git rev-parse --show-toplevel`' # Like cd but to git root
# Function `cl` which cd to directory and lists content
# I like . opening code. So many files use . as source though. Other options?
# alias .="code ." # TODO: Check code command exists, else default to a file explorer
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"

function cdl () {
  cd "$1" && l;
}

if command -v lsd &> /dev/null
then
  alias ls='lsd --classic'
  alias l='lsd --config-file ~/.files/config/lsd/config.yaml'
  alias ll='lsd -l --config-file ~/.files/config/lsd/config.yaml'
  alias l.='lsd -a --config-file ~/.files/config/lsd/config.yaml'
  alias lla='lsd -la --config-file ~/.files/config/lsd/config.yaml'
  # TODO: Make this ignore .git, vendor, node_modules, etc.
  alias tree='lsd --tree --depth 2 --config-file ~/.files/config/lsd/config.yaml'
else
  alias ls="ls -G"
  alias l="echo 'LSD is not installed. You should install it.'"
  alias ll="ls -lahG"	# TODO: See above
  alias l.="" # ls all instead of almost all
  alias ld="" # list directories only
  alias lf="" # list files only
  alias lt='ls --human-readable --size -1 -S --classify' # Sort by size
  alias lt='du -sh * | sort -h' # Sort by size (macOS)
fi

# Inspiration: https://github.com/MikeDacre/careful_rm
if command -v trash &> /dev/null
then
  alias rm="trash"
else
  alias rm="rm -iv" # TODO: Write function to default to yes on ENTER
  alias rmf="rm -fv"
fi

# TODO: would be nice if `fuck` restored a accidentally trashed thing?
alias mv="mv -iv" # TODO: See above
alias mvf="mv -fv"
alias cp="cp -iv" # TODO: See above, also consider using rsync and showing copy bar ('rsync -ah --info=progress2')
alias cpf="cp -fv"
# alias ln=""

alias hist='history|grep'