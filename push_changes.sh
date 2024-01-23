#!/bin/sh


host=coderazzi.net
user='coderazzi'
flocal=/Users/coderazzi/development/website/website/
fremote='/home/coderazzi/www/coderazzi.net/public/'

COMMAND="rsync --delete -acvrz -e 'ssh -l ${user}' ${flocal} ${host}:\"${fremote}\" "
echo $COMMAND
eval $COMMAND
