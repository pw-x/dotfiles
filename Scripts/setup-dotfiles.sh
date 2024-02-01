#!/usr/bin/env bash
git clone --bare git@github.com:pw-x/dotfiles.git $HOME/.dotfiles

# Define the config alias locally since the dotfiles aren't installed on the system yet.
function config {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# Create a directory to backup existing dotfiles to.
mkdir -p .dotfiles-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles from git@github.com:pw-x/dotfiles.git";
  else
    echo "Moving existing dotfiles to ~/.dotfiles-backup";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi

# Checkout the dotfiles from our repo.
config checkout
config config status.showUntrackedFiles no
