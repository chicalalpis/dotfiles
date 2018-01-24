#!/bin/bash

GITHUB_URL="https://github.com/chicalalpis/dotfiles"
DOTPATH=~/dotfiles

i
if type git > /dev/null 2>&1; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
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
