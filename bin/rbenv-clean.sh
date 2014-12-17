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

  Commands:
    help                 display usage
    all                  clean everything
    rubies               clean just rubies
    gems                 clean just gems
EOF
}

#

# Output version.
#

version() {
    echo $VERSION
}

gems() {
    uninstall() {
        list=`gem list --no-versions`
        for gem in $list; do
            gem uninstall $gem -aIx
        done
        gem list
        gem install bundler
    }

    #rbenv versions --bare
    RBENVPATH=`rbenv root`
    echo $RBENVPATH
    RUBIES=`ls $RBENVPATH/versions`
    for ruby in $RUBIES; do
        echo '---------------------------------------'
        echo $ruby
        rbenv local $ruby
        uninstall
    done
}

rubies() {
    list=`rbenv versions`
    for rb in $list; do
        rbenv uninstall $rb
    done
    rbenv versions
}

all() {
    echo "Coming Soon"
}
