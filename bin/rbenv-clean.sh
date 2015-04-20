#!/usr/bin/env bash
#
# Summary: clean out all gems for each installed ruby version
#
# Usage: rbenv clean [opts]
#
# Options:
#    --rubies, -r                       optionally clean up installed rubies aswell
#    --install-ruby, -ir <version>      install a ruby after the clean process

set -e
[ -n "$RBENV_DEBUG" ] && set -x

uninstall() {
  for i in `gem list --no-versions`; do gem uninstall -aIx $i; done
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

for i in "$@"
do
case $i in
    -r=*|--rubies=*)
    rbenv local system
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

# Remove .ruby-version after clean is done;
rm -rf .ruby-version
