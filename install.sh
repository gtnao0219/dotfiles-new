#!/bin/sh

set -eu

DOTFILES_DIR="${HOME}/dotfiles"
GITHUB_USER_NAME="gtnao0219"
GITHUB_REPOSITORY_NAME="dotfiles-new"
BRANCH_NAME="main"
TARBALL="https://github.com/${GITHUB_USER_NAME}/${GITHUB_REPOSITORY_NAME}/archive/${BRANCH_NAME}.tar.gz"

if [ ! -d "${DOTFILES_DIR}" ]; then
  if command -v curl >/dev/null 2>&1 || command -v wget >/dev/null 2>&1; then
    if command -v curl >/dev/null 2>&1; then
      curl -L "${TARBALL}" -o "${BRANCH_NAME}.tar.gz"
    else
      wget "${TARBALL}"
    fi
    tar -zxvf "${BRANCH_NAME}.tar.gz"
    rm -f "${BRANCH_NAME}.tar.gz"
    mv "${GITHUB_REPOSITORY_NAME}-${BRANCH_NAME}" "${DOTFILES_DIR}"
  else
    echo "curl or wget required" >&2
    exit 1
  fi

  if ! command -v make >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y build-essential
  fi
  make -C "${DOTFILES_DIR}" deploy
  make -C "${DOTFILES_DIR}" init
fi

