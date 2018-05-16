#!/bin/bash
#Author Victor TIREBAQUE for Agaetis
  
  #Aide
if [ $1 = "help" ]; then 
  echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compiler dans un fichier .js"
else
  #La chaîne de caractère qui est le nom du fichier monFichier.sol devient monfichier.js
  file_name=$1
  file_name=`echo "$file_name" | tr '[:upper:]' '[:lower:]'`
  file_name=`echo ${file_name%%.*}`
  output=$file_name
  file_name=$file_name".js"

  output="$outputOutput"
  echo "var $output=`solc --optimize --combined-json abi,bin,interface $1`" > $file_name
  
fi
