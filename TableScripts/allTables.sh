#!/bin/bash


clear -x;
echo "************ TABLES In Current DataBase ************";

DIR="./$currDB"
if [ -d "$DIR" ] && [ "$(ls -A $DIR)" ]; then
  echo "************************************************"
  ls $DIR
  echo "************************************************"
  ./TableScripts/tablesMenu.sh
else
    echo "No tables to show"
    echo ""
    ./TableScripts/tablesMenu.sh
fi
