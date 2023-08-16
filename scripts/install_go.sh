#!/bin/sh

set -eu

VERSION=1.21.0

rm -rf /usr/local/go && tar -C /usr/local -xzf "go${VERSION}.linux-amd64.tar.gz"

