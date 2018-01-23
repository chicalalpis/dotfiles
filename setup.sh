#!/bin/bash

DOTFILES=( zshrc zsh.func zsh.alias gitconfig vimrc)

for file in ${DOTFILES[@]}
do
  ln -sf ~/dotfiles/$file ~/.$file
done
