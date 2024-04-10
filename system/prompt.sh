setopt PROMPT_SUBST

export PS9="${PS1}" # Save the default prompt

export STARSHIP_CONFIG=${XDG_DOTFILES}/config/starship/starship.toml
eval "$(starship init zsh)"

function t() {
  echo "${NEL}$(beeline-history divider 2) $(beeline-history status) $(beeline-history divider $(($COLUMNS - 23)))  ${LS_DIM}${B6_ICON_GENERIC_STOPWATCH}236 ms $(beeline-history divider 2)${NEL}"
}

DEMI_PROMPT=" \e[38;5;236m\\e[38;5;248m\\e[38;5;8m\\e[38;5;5m\${LS_RESET}"

preexec() {
  if [[ "${1}" == *"shellfirm pre-command"* ]]; then
    return
  fi
  shellfirm pre-command --command "${1}"
  tput el1
  tput cuu1
  tput el
  tput cuu1
  tput el
  tput cuu1
  tput el
  tput cuu1
  tput el
  print "${NEL} $(beeline-history meta)"
  print "${DEMI_PROMPT} $1${NEL}"
}

# precmd() {
#   . beeline-hooks precmd --source
# }
