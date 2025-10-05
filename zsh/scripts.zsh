function unlockGPG() {
  if [[ $(gpg-connect-agent "keyinfo --list" /bye | awk '/029A1/ {print $7}') != 1 ]]; then
    echo "GPG key is locked. Please enter passphrase to unlock."
    pass unlock
    sleep 2
    clear
  fi
}

function setup_ssh_agent {
  local SSH_ENV="$HOME/.ssh/agent-env"

  local PERSONAL_KEY="$HOME/.ssh/{personal_ssh_pk}" # Change to your personal key filename
  local PERSONAL_ASKPASS="$HOME/.ssh/{script_for_password}.sh"
  local PERSONAL_IDENTIFIER="personal@email.com" # Change to your personal key comment/email

  local WORK_KEY="$HOME/.ssh/{work_ssh_pk}" # Change to your work key filename
  local WORK_ASKPASS="$HOME/.ssh/{script_for_password}.sh"
  local WORK_IDENTIFIER="work@email.com" # Change to your work key comment/email

  function start_agent {
    echo "Starting new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" >/dev/null
  }

  # Check if agent-env file exists
  if [ -f "${SSH_ENV}" ]; then
    source "${SSH_ENV}" >/dev/null
    # Check if the agent is actually running
    if ! kill -0 ${SSH_AGENT_PID} 2>/dev/null; then
      start_agent
    fi
  else
    start_agent
  fi

  # Auto-load personal SSH key if not already loaded
  if [ -f "${PERSONAL_ASKPASS}" ]; then
    if ! ssh-add -l 2>/dev/null | grep -q "${PERSONAL_IDENTIFIER}"; then
      DISPLAY=:0 SSH_ASKPASS="${PERSONAL_ASKPASS}" SSH_ASKPASS_REQUIRE=force \
        setsid ssh-add -t 86400 "${PERSONAL_KEY}" </dev/null >/dev/null 2>&1

      sleep 0.3

      if ssh-add -l 2>/dev/null | grep -q "${PERSONAL_IDENTIFIER}"; then
        echo "Personal SSH key loaded (valid for 24 hours)"
      fi
    fi
  fi

  # Auto-load work SSH key if askpass script exists and key not already loaded
  if [ -f "${WORK_ASKPASS}" ]; then
    if ! ssh-add -l 2>/dev/null | grep -q "${WORK_IDENTIFIER}"; then
      DISPLAY=:0 SSH_ASKPASS="${WORK_ASKPASS}" SSH_ASKPASS_REQUIRE=force \
        setsid ssh-add -t 86400 "${WORK_KEY}" </dev/null >/dev/null 2>&1

      sleep 0.3

      if ssh-add -l 2>/dev/null | grep -q "${WORK_IDENTIFIER}"; then
        echo "Work SSH key loaded (valid for 24 hours)"
      fi
    fi
  fi
}

function zathura_background() {
  zathura "$@" &
}

function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1))
}

function pacman_install() {
  sudo pacman -S "$@"
}

open_and_run_command() {
  local cmd=$1

  # Open Alacritty and run the command with nohup
  nohup alacritty -e zsh -c "$cmd; exec zsh" >/dev/null 2>&1 &
}
