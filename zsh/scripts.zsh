function unlockGPG() {
  if [[ $(gpg-connect-agent "keyinfo --list" /bye | awk '/029A1/ {print $7}') != 1 ]]; then
    echo "GPG key is locked. Please enter passphrase to unlock."
    pass unlock
    clear
  fi
}

function zathura_background() {
  zathura "$@" &
}

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}

function pacman_install() {
  sudo pacman -S "$@"
}
