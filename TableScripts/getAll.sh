#!/bin/bash

# for debugging
# currDB="Databases/iti"
# tableName="emp";

clear -x;
tableData="$currDB/$tableName.data"
tableFormat="$currDB/.$tableName.meta"

awk -F: 'BEGIN { ORS=":" }; { print $1 }' $tableFormat | sed 's/.$//'
printf "\n"
cat $tableData

echo ""
./TableScripts/tableMenu.sh
