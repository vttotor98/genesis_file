#!/bin/bash
#Author Victor TIREBAQUE for Agaetis



if [ $1 = "help" ]; then 
  echo "Il faut mettre le 
else
  a=$1
  a=`echo "$a" | tr '[:upper:]' '[:lower:]'`
  echo $a

fi
