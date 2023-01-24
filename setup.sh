#!/bin/bash

GITHUB_URL="https://github.com/chicalalpis/dotfiles"
DOTPATH=~/dotfiles

cd ~

if type git > /dev/null 2>&1; then
  if ls ~/dotfiles > /dev/null 2>&1; then
    cd ~/dotfiles
    git pull origin master
  else
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
    :
  fi
else
  echo "failed to do git command"
  exit 1
fi

# add dotfiles symbolic link
ln -sf $DOTPATH/.zshenv ~/.zshenv
mkdir -p ~/.config
find $DOTPATH/.config -type d | xargs -IXXX mkdir -p ~/XXX
find $DOTPATH/.config -type f | xargs -IXXX ln -sf $DOTPATH/XXX ~/XXX

# setup homebrew
if [ $(uname) = 'Darwin' ]; then
  command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew update --verbose
  brew upgrade --verbose
  brew bundle --file ~/.config/brewfile/Brewfile --verbose
  brew cleanup --verbose
fi
