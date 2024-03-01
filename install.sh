#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master


if [ "$(uname)" == "Darwin" ]; then
    # install brew first
    . "$DOTFILES_DIR/install/brew.sh"
    . "$DOTFILES_DIR/install/brew-cask.sh"
    # post-brew installs
    . "$DOTFILES_DIR/install/node.sh"
    . "$DOTFILES_DIR/install/perlbrew.sh"
    . "$DOTFILES_DIR/install/pyenv.sh"
fi

ln -sfv "$DOTFILES_DIR/runcom/.profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.bashrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.vimrc" ~
# https://git-scm.com/docs/git-config
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
# https://docs.github.com/en/get-started/getting-started-with-git/ignoring-files
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

if ! git config --global --get core.excludesfile >/dev/null; then
    echo "Setting core.excludesfile in global Git configuration..."
    git config --global core.excludesfile ~/.gitignore_global
fi
