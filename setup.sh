#!/bin/bash

GITHUB_URL="https://github.com/chicalalpis/dotfiles"
DOTPATH=~/dotfiles

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

cd ~/dotfiles

DOTFILES=( zshrc zsh.func zsh.alias gitconfig vimrc)

for file in ${DOTFILES[@]}
do
  ln -sf ~/dotfiles/$file ~/.$file
done
