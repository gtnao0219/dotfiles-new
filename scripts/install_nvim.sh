#!/bin/zsh

set -eu

sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt install -y neovim

