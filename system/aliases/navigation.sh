
alias ~="cd $HOME"
alias cg='cd `git rev-parse --show-toplevel`' # Like cd but to git root
# Function `cl` which cd to directory and lists content
alias .="code ." # TODO: Check code command exists, else default to a file explorer
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias 1="cd -"
alias 2="cd -2"
alias 3="cd -3"
alias 4="cd -4"
alias 5="cd -5"

# TODO: Make work with lsd with ls as backup

if command -v lsd &> /dev/null
then
  alias ls='lsd --classic'
  alias l='lsd'
  alias ll='lsd -l'
  alias l.='lsd -a'
  alias lla='lsd -la'
  # TODO: Make this ignore .git, vendor, node_modules, etc.
  alias tree='lsd --tree --depth 2'
else
  alias ls="ls -G"
  alias ll="ls -lahG"	# TODO: See above
  alias l.="" # ls all instead of almost all
  alias ld="" # list directories only
  alias lf="" # list files only
  alias lt='ls --human-readable --size -1 -S --classify' # Sort by size
  alias lt='du -sh * | sort -h' # Sort by size (macOS)
fi

alias rm="rm -iv" # TODO: Write function to default to yes on ENTER
alias rmf="rm -fv"
# alias trash="mv --force -t ~/.local/share/Trash " # Instead of rm? Move to Trash/Recycle Bin?
# ALTERNATIVE: https://gitlab.com/trashy/trashy
# TODO: would be nice if `fuck` restored a accidentally trashed thing?
alias mv="mv -iv" # TODO: See above
alias mvf="mv -fv"
alias cp="cp -iv" # TODO: See above, also consider using rsync and showing copy bar ('rsync -ah --info=progress2')
alias cpf="cp -fv"
# alias ln=""

alias hist='history|grep'