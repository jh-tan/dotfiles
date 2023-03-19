function unlockGPG() {
  if [[ $(gpg-connect-agent "keyinfo --list" /bye | awk '/029A1/ {print $7}') != 1 ]]; then
    echo "GPG key is locked. Please enter passphrase to unlock."
    pass unlock
    clear
  fi
}
