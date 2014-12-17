#!/usr/bin/env sh

#
# rbenv-clean.sh(1) - Shell script to clean up rbenv installed gems and versions.
# Released under the MIT License
#
# https://github.com/sableloki/rbenv-clean
#

VERSION="0.1.0"
TEST=1

usage() {
      cat <<-EOF
  Usage: rbenv-clean [options] [command]

  Options:
    -h, --help           output help information
    -v, --version        display version number
    -r, --restore        restore installed versions

  Commands:
    all                  clean everything
    rubies               clean just rubies
    gems                 clean just gems
EOF
}
