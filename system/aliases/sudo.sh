
# If user is not root, pass common privliged commands via sudo

if [ $UID -ne 0 ]; then
  alias reboot='sudo reboot'
  alias update='sudo apt-get upgrade'
fi