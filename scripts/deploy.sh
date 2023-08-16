#!/bin/sh

set -eu

ln -sf "${HOME}/dotfiles/.zshenv" "${HOME}/.zshenv"
ln -sf "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
mkdir -p "${HOME}/.config/nvim"
ln -sf "${HOME}/dotfiles/.config/nvim/init.lua" "${HOME}/.config/nvim/init.lua"

