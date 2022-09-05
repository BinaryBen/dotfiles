# $1 = direction 
# content
# final
# prior colour
# current colour
# next colour

function generate-divider() {
  LEADER=${BEELINE_ICON_POWERLINE_R_LEADER}
  CAP=${BEELINE_ICON_POWERLINE_R_CAP}
  
  echo "${LEADER} $1 ${CAP} "
}