#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# install Perl components
## install cpanminus locally
curl -L https://cpanmin.us | perl - App::cpanminus
## add local perl5 bin to PATH
PATH=$PATH:$HOME/perl5/bin
## Add local lib run it
cpanm --local-lib=~/perl5 local::lib
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"


if [ "$(uname)" == "Darwin" ]; then
    . "$DOTFILES_DIR/install/brew.sh"
    . "$DOTFILES_DIR/install/brew-cask.sh"
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
git config --global core.excludesfile ~/.gitignore_global
