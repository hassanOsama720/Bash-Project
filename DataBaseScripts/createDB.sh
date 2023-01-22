#!/bin/bash

clear -x;
read -rp "Enter database name: " newDB;

while ! [[ $newDB =~ ^([a-zA-Z])[a-zA-Z0-9\w_-]*([a-zA-Z0-9])$ ]]; do
    echo "$newDB is not a valid name";
    echo "database names should not contain any special characters, spaces";
    echo ""
    read -rp "Enter database name: " newDB;
done


if test -d Databases/$newDB; then
    echo "";
    echo "This database already exists!";
    ./DataBaseScripts/createDB.sh
else
    if mkdir -p Databases/$newDB 2>> Error.out; then
        echo "$newDB database created succesfully";
        echo ""
        ./DataBaseScripts/DBMenu.sh
    else
        echo "Falied to create $newDB. Refer to log.out for more details."
        echo ""
        ./DataBaseScripts/createDB.sh
    fi
fi
