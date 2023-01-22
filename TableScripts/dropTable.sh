#!/bin/bash
echo $currDB
read -rp "Enter Table Name: " table;

if [ -f  "$currDB/$table.data" ] && [ -f  "$currDB/.$table.meta" ]; then
    rm -r $currDB/$table.data
    rm -r $currDB/.$table.meta
    echo "$TableName Table  deleted Successfully"
  else
    echo "No such Table"
fi
