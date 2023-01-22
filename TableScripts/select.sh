#!/bin/bash

echo "************ $tableName ************";
echo "************************************";

options=("Get All" "By Column" "Return To Tables Menu");

select option in "${options[@]}"
do
    case $option in
        "Get All") ./TableScripts/getAll.sh;;
        "By Column") ./TableScripts/selectByColumn.sh;;
        "Return To Tables Menu") ./TableScripts/tableMenu.sh;;
        *) echo "No Such option $REPLY";;
    esac
done
