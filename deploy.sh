#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

if [ $1 = "help" ]; then 
  echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compiler dans un fichier .js"
else
  file_name=$1
  file_name=`echo "$file_name" | tr '[:upper:]' '[:lower:]'`
  file_name=`echo ${file_name%%.*}`
  output=$file_name
  file_name="$file_name.js"
#  echo $file_name

  output="$outputOutput"
  echo "var $output=`solc --optimize --combined-json abi,bin,interface $1`" > $file_name
  
fi
