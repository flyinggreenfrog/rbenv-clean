#!/usr/bin/env bash
#
# Summary: Uninstall all non-default gems
#
# Usage: rbenv clean [opts]
#
# Options:
#    --rubies, -r                       optionally uninstall all rub
#    --install-ruby, -ir <version>      install a ruby after the clean process

set -e
[ -n "$RBENV_DEBUG" ] && set -x

uninstall() {
  ruby ~/.rbenv/rbenv_clean_gems.rb
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

# rbenv versions --bare
RBENVPATH=`rbenv root`
echo $RBENVPATH
RUBIES=`ls $RBENVPATH/versions`
for r in $RUBIES; do
    echo '---------------------------------------'
    echo $r
    rbenv local $r
    uninstall
done

for i in "$@"
do
case $i in
    -r|--rubies)
    rbenv global system
    remove_rubies
    shift
    ;;
    -ir=*|--install-ruby=*)
    rbenv install ${i#*=}
    shift
    ;;
    *)
            # unknown option
    ;;
esac
done


# Remove .ruby-version after clean is done;
rm -rf .ruby-version
