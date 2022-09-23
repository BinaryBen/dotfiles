setopt PROMPT_SUBST

export PS9="${PS1}"   # Save the default prompt

# Semi-circles
export LEFT_SOFT=""

export NEL=$'\n'

# export LS_BLACK="\e[0;30m"
# export LS_RED="\e[0;31m"
# export LS_GREEN="\e[0;32m"
# export LS_YELLOW="\e[0;33m"
# export LS_BLUE="\e[0;34m"
# export LS_PURPLE="\e[0;35m"ƒ
# export LS_CYAN="\e[0;36m"
# export LS_WHITE="\e[0;37m"

function t() {
  echo "${NEL}$(beeline-history divider 2) $(beeline-history status) $(beeline-history divider $(($COLUMNS-23)))  ${LS_DIM}${B6_ICON_GENERIC_STOPWATCH}236 ms $(beeline-history divider 2)${NEL}"
}

PROMPT='$(tput dim)$(t)${NEL}${NEL} ╭──'

# Host information
PROMPT+='${${B6_ICON_POWERLINE_R_LEADER}}$(beeline-system host) ${B6_ICON_POWERLINE_R_SOFT_SEP}'

# Username
PROMPT+=' ${B6_ICON_GENERIC_USER}  %n ${B6_ICON_POWERLINE_R_HARD_SEP}${B6_ICON_POWERLINE_R_HARD_SEP}'

# Present Working Directory
PROMPT+=' $(beeline-pwd print) ${B6_ICON_POWERLINE_R_CAP}'

# LGBT Pride!
# LGBT_PROMPT="${LS_RED}${LS_YELLOW}${LS_GREEN}${LS_CYAN}${LS_PURPLE} ${LS_RESET}"
DEMI_PROMPT=" \e[38;5;236m\\e[38;5;248m\\e[38;5;8m\\e[38;5;5m\${LS_RESET}"

PS0_PROMPT="${LS_YELLOW}${B6_ICON_POWERLINE_R_LEADER} $(beeline-prompt icon) ${B6_ICON_POWERLINE_R_CAP}  ${LS_RESET}"
PROMPT+="${NEL} │ ${NEL} ╰─ ${PS0_PROMPT}"

export PS2="        ❯ "

preexec () {
  if [[ "${1}" == *"shellfirm pre-command"* ]]; then
      return
  fi
  shellfirm pre-command --command "${1}"
  tput el1; tput cuu1; tput el; tput cuu1; tput el; tput cuu1; tput el; tput cuu1; tput el;
  print "${NEL} $(beeline-history meta)"
  print "${DEMI_PROMPT} $1${NEL}"
}

precmd() {
  . beeline-hooks precmd --source
}

# RPROMPT='$(__printSimpleWeather)'