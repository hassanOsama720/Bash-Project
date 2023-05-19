#!/bin/bash

clear -x;
if [ -d "./Databases" ] && [ "$(ls -A "./Databases")" ]; then
   echo "Available Databases"
   echo "************************************************************"
  ls ./Databases
  echo "************************************************************"
  ./DataBaseScripts/DBMenu.sh
else 
    echo "Their is no Databases"
    echo "************************************************************"
    ./DataBaseScripts/DBMenu.sh
fi
