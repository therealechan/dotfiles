#!/bin/sh
if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing dotfiles for the first time!"
  git clone git@github.com:chankaward/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
  rake install
else
  echo "You already have dotfiles!"
fi
