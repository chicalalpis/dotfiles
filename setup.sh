#!/bin/bash

GITHUB_URL="https://github.com/chicalalpis/dotfiles"
DOTPATH=~/.dotfiles

if has "git"; then
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
else
  die "failed to do git command"
fi

cd ~/.dotfiles

DOTFILES=( zshrc zsh.func zsh.alias gitconfig vimrc)

for file in ${DOTFILES[@]}
do
  ln -sf ~/dotfiles/$file ~/.$file
done
