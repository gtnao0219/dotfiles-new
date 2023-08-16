#!/bin/zsh

set -euo pipefail

VERSION=18

sudo apt update
sudo apt purge -y nodejs
curl -sSL "https://deb.nodesource.com/setup_${VERSION}.x" | sudo -E zsh -
sudo apt install -y nodejs

