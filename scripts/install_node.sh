#!/bin/sh

set -eu

VERSION=18

sudo apt update
sudo apt purge -y nodejs
curl -fsSL "https://deb.nodesource.com/setup_${VERSION}.x" | sudo -E sh -
sudo apt install -y nodejs

