if [ ! -d "$HOME/.dotfiles" ]; then
  echo "Installing dotfiles for the first time!"
  git clone git@github.com:chankaward/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
  [ "$1" = "ask" ] && export ASk="true"
  rake install
else
  echo "You already have dotfiles!"
fi
