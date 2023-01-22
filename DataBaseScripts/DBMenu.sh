#!/bin/bash
echo "************************************************************************"
echo "Welcome to our Bash DataBase Mangement Sysytem OS Track"
echo "************************************************************************"

options=("Get All DataBases" "Create New DataBase" "Connect to DataBase" "Drop DataBase" "Exit")

select option in "${options[@]}"
do
    case $option in
        "Get All DataBases") ./DataBaseScripts/allDB.sh;;
        "Create New DataBase") ./DataBaseScripts/createDB.sh;;
        "Connect to DataBase") ./DataBaseScripts/connectDB.sh;;
        "Drop DataBase") ./DataBaseScripts/dropDB.sh;;
        "Exit") break;;
        *) echo "No Such Option $REPLY";;
    esac
done
