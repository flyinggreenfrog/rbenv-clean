#!/usr/bin/env bash
#
# Summary: clean out all gems for each installed ruby version
#
# Usage: rbenv clean [--rubies]
#
# Options:
#    --rubies, -r                       optionally clean up installed rubies aswell
#    --install-ruby, -ir <version>      install a ruby after the clean process (note: this will only work when called after --rubies i.e rbenv clean --rubies --install-ruby 2.2.0)

set -e
[ -n "$RBENV_DEBUG" ] && set -x

uninstall() {
    list=`gem list --no-versions`
    for gem in $list; do
        gem uninstall $gem -aIx
    done
    gem list
    gem install bundler
}

remove_rubies() {
    list=`rbenv versions`
    for rb in $list; do
        rbenv uninstall $rb
    done
    rbenv versions
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

if [[ $2 == "--rubies" || "-r" ]]; then
    rbenv local system
    remove_rubies
fi
if [[ $3 == "--install-ruby" || "-ir" ]]; then
    rbenv install $4
fi

# Remove .ruby-version after clean is done;
rm -rf .ruby-version
