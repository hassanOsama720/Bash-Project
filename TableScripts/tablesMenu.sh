#!/bin/bash
tables_menu(){
    options=("Get All Tables" "Create New Table" "Connect to Table" "Drop Table" "Back To DataBase Menu");

    select option in "${options[@]}"
    do
        case $option in
            "Get All Tables") ./TableScripts/allTables.sh;;
            "Create New Table") ./TableScripts/createTable.sh;;
            "Connect to Table") ./TableScripts/connectTable.sh;;
            "Drop Table") ./TableScripts/dropTable.sh;;
            "Back To DataBase Menu") . ./DataBaseScripts/DBMenu.sh;;
            *) echo "No Such Option $REPLY";;
        esac
    done
}

tables_menu
