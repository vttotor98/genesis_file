#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

if [ $1 = "help" ]; then 
  echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compiler dans un fichier .js"
else
  a=$1
  a=`echo "$a" | tr '[:upper:]' '[:lower:]'`
  echo $a

fi
