#!/bin/sh

set -eu

# Install essential packages
sudo apt update
sudo apt install -y build-essential zsh git curl

# Change default shell to zsh
sudo chsh -s `which zsh` `whoami`

