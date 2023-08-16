#!/bin/sh

set -eu

mkdir -p "${HOME}/dotfiles/.config/nvim"
ln -sf "${HOME}/dotfiles/.config/nvim/init.lua" "${HOME}/.config/nvim/init.lua"

