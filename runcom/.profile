# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/profile.pre.bash" ]] && builtin source "$HOME/.fig/shell/profile.pre.bash"
# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink 2>/dev/null || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$HOME/go/bin:$PATH"
PATH="$PATH:/opt/homebrew/bin"

# * order matters
for DOTFILE in "$DOTFILES_DIR"/system/.{alias,env,functions,source}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Hook for extra/custom stuff
DOTFILES_LOCAL_DIR="$HOME/.local"

if [ -d "$DOTFILES_LOCAL_DIR" ]; then
  for LOCAL_DOTFILE in "$DOTFILES_LOCAL_DIR"/system/*.sh; do
    [ -f "$LOCAL_DOTFILE" ] && . "$LOCAL_DOTFILE"
  done
fi

if [ "$(uname)" == "Darwin" ]; then
  export PS1="[%n@%m %1~]$ "
else
  export PS1="[\u@\h \W]\\$ "
fi

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE EXTRAFILE DOTFILES_LOCAL_DIR

# Export
export DOTFILES_DIR DOTFILES_LOCAL_DIR

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/profile.post.bash" ]] && builtin source "$HOME/.fig/shell/profile.post.bash"
