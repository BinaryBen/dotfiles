setopt PROMPT_SUBST

export PS0="$ "       # Super minimalist prompt
export PS9="${PS1}"   # Save the default prompt

export ICON_APPLE=""
export ICON_USER=""
export ICON_FOLDER=""

# Semi-circles
export L_PAD=""
export R_PAD=""
export LEFT_SOFT=""

export NEL=$'\n'

# export LS_BLACK="\e[0;30m"
# export LS_RED="\e[0;31m"
# export LS_GREEN="\e[0;32m"
# export LS_YELLOW="\e[0;33m"
# export LS_BLUE="\e[0;34m"
# export LS_PURPLE="\e[0;35m"
# export LS_CYAN="\e[0;36m"
# export LS_WHITE="\e[0;37m"

export LS_BLACK="%F{black}"
export LS_RED="%F{red}"
export LS_GREEN="%F{green}"
export LS_YELLOW="%F{yellow}"
export LS_BLUE="%F{blue}"
export LS_PURPLE="%F{magenta}"
export LS_CYAN="%F{cyan}"
export LS_WHITE="%F{white}"

export LS_RESET=$'\e[m'

function t() {
  x=0
  c=$(($COLUMNS-21))
  LINE='\e[38;5;236m'
  while [ $x -lt $c ]
  do
    LINE="${LINE}•"
    x=$(( $x + 1 ))
  done
  echo "${NEL}••   $LINE${LS_RESET}   18:23:03 ••${NEL}"
}

PROMPT='$(tput dim)$(t)${NEL}${NEL} ╭──'

# Host information
PROMPT+='${L_PAD}${ICON_APPLE}  %m ${R_PAD}'

# Username
PROMPT+='──${L_PAD}${ICON_USER}  %n ${R_PAD}'

# Present Working Directory
PROMPT+='──${L_PAD}${ICON_FOLDER}  ${PWD} ${R_PAD}'

# LGBT Pride!
LGBT_PROMPT="${LS_RED}❯${LS_YELLOW}❯${LS_GREEN}❯${LS_CYAN}❯${LS_PURPLE}❯ ${LS_RESET}"
DEMI_PROMPT=" 🏳️‍🌈  \e[38;5;236m\❯\e[38;5;248m\❯\e[38;5;8m\❯\e[38;5;5m\❯${LS_RESET}"

PROMPT+='${NEL} │ ${NEL} ╰─ ${LGBT_PROMPT}'

export PS2="        ❯ "

preexec () {
  tput el1; tput cuu1; tput el; tput cuu1; tput el; tput cuu1; tput el; tput cuu1; tput el;
  print "${NEL} ${DEMI_PROMPT} $1${NEL}"
}