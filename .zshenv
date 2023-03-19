typeset -U path PATH

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set the ZDOTDIR to $home/.config/zsh
# Warning: Using `export` may break it because :
# Whenever we open a terminal, it will first look into $ZDOTDIR/.zshenv. If ZDOTDIR is not set, it will failback to ~/.zshenv  
# If we export it, it will make it into system wide and the next time we open the terminal in the same environment, it will go 
# to the ZDOTDIR that we set to look for .zshenv, which obvioously isn't there. Without the export it's for the 'current shell' only.
# Every time I start a new shell, ZDOTDIR is not set yet which will make ZSH look for $HOME/.zshenv and $ZDOTDIR will be set again for this shell.
ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Set default Apps
export EDITOR='nvim'
export VISUAL="nvim"
export READER="zathura"
export TERMINAL="alacritty"
export VIDEO="mpv"
export COLORTERM="truecolor"

# Set path
path=("/bin" "/usr/bin" "/usr/local/bin" "$HOME/.local/bin" $path)
export PATH

fpath=($ZDOTDIR/plugins $fpath)
