#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master



if [ "$(uname)" == "Darwin" ]; then
    . "$DOTFILES_DIR/install/brew.sh"
    . "$DOTFILES_DIR/install/brew-cask.sh"
fi

ln -sv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sv "$DOTFILES_DIR/runcom/.inputrc" ~
# https://git-scm.com/docs/git-config
ln -sv "$DOTFILES_DIR/git/.gitconfig" ~
# https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files
ln -sv "$DOTFILES_DIR/git/.gitignore_global" ~
git config --global core.excludesfile ~/.gitignore_global