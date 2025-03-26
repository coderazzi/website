#!/bin/sh

die () {
  echo "$*"
  exit 1
}

CODERAZZI_GITHUB_IO_FOLDER=/Users/coderazzi/development/coderazzi.github.io/
OWN_HOST=ludwig.coderazzi.net

if [ ! -d "$CODERAZZI_GITHUB_IO_FOLDER" ]; then
  CODERAZZI_GITHUB_IO_FOLDER=/home/coderazzi/development/coderazzi.github.io/
fi

cd ${CODERAZZI_GITHUB_IO_FOLDER} 2> /dev/null || die "Cannot access $CODERAZZI_GITHUB_IO_FOLDER"

if  true ; then
  # push to own server
  echo Pushing changes to $OWN_HOST
  host=$OWN_HOST
  user='coderazzi'
  REMOTE='/home/coderazzi/www/coderazzi.net/public/'

  COMMAND="rsync --delete -acvrz --exclude .git -e 'ssh -l ${user}' . ${host}:\"${REMOTE}\" "
  echo "$COMMAND"
  eval "$COMMAND"
fi

[ -z "$(git status --porcelain)" ] && die "There are no uncommited changes in $(pwd) folder"
DATE=$(git log  2> /dev/null | head -n 3 | tail -n 1 | cut -d: -f2-)
[ -z "$DATE" ] && die "$CODERAZZI_GITHUB_IO_FOLDER is not in git, unexpected, cannot continue"

cd ../website || die "cannot access ${CODERAZZI_GITHUB_IO_FOLDER}/../website"
[ -z "$(git status --porcelain)" ] || die "There are uncommited changes in $(pwd) folder"

MESSAGE=$(git log --since="$DATE" --pretty=%s  | sort -u | paste -sd "|" -)
[ -z "$MESSAGE" ] && echo No message in commit folder, nothing commited lately in $CODERAZZI_GITHUB_IO_FOLDER

cd ${CODERAZZI_GITHUB_IO_FOLDER}
git add -A
git commit -m "$MESSAGE"
git push
echo Changes pushed, commited with message $MESSAGE
