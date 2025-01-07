#!/bin/sh

die () {
  echo "$*"
  exit 1
}

LOCAL=/Users/coderazzi/development/coderazzi.github.io/
if [ ! -d "$LOCAL" ]; then
  LOCAL=/home/coderazzi/development/coderazzi.github.io/
fi

cd ${LOCAL} 2> /dev/null || die "Cannot access $LOCAL"

if  false ; then
  # push to own server
  host=coderazzi.net
  user='coderazzi'
  REMOTE='/home/coderazzi/www/coderazzi.net/public/'

  COMMAND="rsync --delete -acvrz --exclude .git -e 'ssh -l ${user}' . ${host}:\"${REMOTE}\" "
  echo "$COMMAND"
  eval "$COMMAND"
fi

echo GOING
DATE=$(git log  2> /dev/null | head -n 3 | tail -n 1 | cut -d: -f2-)
[ -z "$DATE" ] && die "$LOCAL is not in git, unexpected, cannot continue"

cd ../website || die "cannot access ${LOCAL}/../website"
[ -z "$(git status --porcelain)" ] || die "There are uncommited changes in $(pwd) folder"


