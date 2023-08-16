#!/bin/sh

set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"
GITHUB_USER_NAME="gtnao0219"
GITHUB_REPOSITORY_NAME="dotfiles-new"
GIT_HUB_URL="git@github.com:${GITHUB_USER_NAME}/${GITHUB_REPOSITORY_NAME}.git"
TARBALL="https://github.com/${GITHUB_USER_NAME}/${GITHUB_REPOSITORY_NAME}/archive/master.tar.gz"

if [ ! -d "${DOTFILES_DIR}" ]; then
  if command -v git >/dev/null 2>&1; then
    git clone "${GIT_HUB_URL}" "${DOTFILES_DIR}"
  elif command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
    if command -v curl >/dev/null 2>&1; then
      curl -L "${TARBALL}" -o master.tar.gz
    else
      wget "${TARBALL}"
    fi
    tar -zxvf master.tar.gz
    rm -f master.tar.gz
    mv "$GITHUB_REPOSITORY_NAME}-master" "${DOTFILES_DIR}"
  else
    echo "git, curl, wget is not found"
    exit 1
  fi
fi

