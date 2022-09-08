
# open, pbcopy, pbpaste and clip:

# Author: Grigorii Horos
# Source: https://github.com/zpm-zsh/clipboard
# License: GPL-3.0 license (https://www.gnu.org/licenses/gpl-3.0.en.html)

# TODO: Modify to be aliases?

function open () {
  # WSL 1 or 2
  if [[ $OSTYPE == linux* && -r /proc/version &&
      $(< /proc/version) == *[Mm]icrosoft* ]]; then
    explorer.exe $@
  elif (( ${+commands[xdg-open]} )); then
    xdg-open $@
  elif [[ $OSTYPE == darwin* ]]; then
    command open $@
  elif [[ $OSTYPE == cygwin* ]]; then
    cygstart $@
  elif [[ $OSTYPE == msys ]]; then
    explorer.exe $(cygpath -w $@)
  fi
}

function pbcopy () {
  # WSL 1 or 2
  if [[ $OSTYPE == linux* && -r /proc/version &&
      $(< /proc/version) == *[Mm]icrosoft* ]]; then
    if ! xclip -selection clipboard -in 2> /dev/null; then
      clip.exe
    fi
  elif (( ${+commands[xclip]} )); then
    xclip -selection clipboard -in
  elif (( ${+commands[xsel]} )); then
    xsel -b
  elif (( ${+commands[wl-copy]} )); then
    wl-copy
  elif [[ $OSTYPE == darwin* ]]; then
    command pbcopy
  elif [[ $OSTYPE == (cygwin*|msys) ]]; then
    tee > /dev/clipboard
  fi
}

function pbpaste () {
  # WSL 1 or 2
  if [[ $OSTYPE == linux* && -r /proc/version &&
      $(< /proc/version) == *[Mm]icrosoft* ]]; then
    if ! xclip -selection clipboard -out 2> /dev/null; then
      powershell.exe -NoProfile -NonInteractive -Command Get-Clipboard
    fi
  elif (( ${+commands[xclip]} )); then
    xclip -selection clipboard -out
  elif (( ${+commands[xsel]} )); then
    xsel -b
  elif (( ${+commands[wl-paste]} )); then
    wl-paste  
  elif [[ $OSTYPE == darwin* ]]; then
    command pbpaste
  elif [[ $OSTYPE == (cygwin*|msys) ]]; then
    print "$(< /dev/clipboard)"
  fi
}

function clip () {
  if [[ -t 0 ]]; then
    pbpaste
  else
    pbcopy
  fi
}
