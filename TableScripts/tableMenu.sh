#!/bin/bash

echo "************ $tableName ************";
echo "************************************";

options=("Insert" "Select" "Update" "Delete" "Return To Previous Menu");

select option in "${options[@]}"
do
    case $option in
        "Insert") ./TableScripts/insert.sh;;
        "Select") ./TableScripts/select.sh;;
        "Update") ./TableScripts/updateByColumn.sh;;
        "Delete") ./TableScripts/delete.sh;;
        "Return To Previous Menu") ./TableScripts/tablesMenu.sh;;
        *) echo "Invalid option $REPLY";;
    esac
done
