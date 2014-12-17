#!/usr/bin/env bash

# Summary: Cleanup gems for all versions
#
# Usage: rbenv clean
#
# rbenv-clean(1) cleans up all gems from all versions of installed rubies

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
