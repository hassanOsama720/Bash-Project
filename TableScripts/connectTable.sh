#!/bin/bash



clear -x;
read -rp "Enter Table Name: " tableName;

# check if database exists
if [ -f  "$currDB/$tableName.data" ] && [ -f  "$currDB/.$tableName.meta" ]; then
    echo "$tableName is selected.";
    echo "************************************************"
    export  tableName;
    ./TableScripts/tableMenu.sh;
else
    echo "$tableName table does not exist.";
    echo "************************************************"
    ./TableScripts/tablesMenu.sh
fi
