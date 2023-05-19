#!/bin/bash

clear -x;
read -rp "Enter Database name: " dataBase;


if [ -d  "Databases/$dataBase" ]; then
    rm -r Databases/$dataBase
    echo "$dataBase deleted Successfully"
    echo "************************************************************"
    ./DataBaseScripts/DBMenu.sh
  else
    echo "No DataBase With This Name"
    echo "************************************************************"
    ./DataBaseScripts/DBMenu.sh
fi
