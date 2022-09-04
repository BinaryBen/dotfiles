# $1 = direction 
# content
# final
# prior colour
# current colour
# next colour

function generate-divider() {
  LEADER=${D6S_ICON_POWERLINE_R_LEADER}
  CAP=${D6S_ICON_POWERLINE_R_CAP}
  
  echo "${LEADER} $1 ${CAP} "
}