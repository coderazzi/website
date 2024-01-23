#!/bin/sh


host=coderazzi.net
user='coderazzi'
flocal=/Users/coderazzi/development/website/website/
if [ ! -d "$flocal" ]; then
  flocal=/home/coderazzi/development/website/website/
fi
fremote='/home/coderazzi/www/coderazzi.net/public/'

COMMAND="rsync --delete -acvrz -e 'ssh -l ${user}' ${flocal} ${host}:\"${fremote}\" "
echo $COMMAND
eval $COMMAND
