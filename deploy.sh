#!/bin/bash
#Author Victor TIREBAQUE for Agaetis
  
  #Aide
if [ $1 = "help" ]; then 
  echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compiler dans un fichier .js"
else
  #La chaîne de caractère qui est le nom du fichier monFichier.sol devient monfichier.js
  fct=$1
  fct=`echo ${fct%%.*}`
  fch=`echo "$fct" | tr '[:upper:]' '[:lower:]'`
  output=$fct"Output"
  file_name=$fch".js"
  
  solc --optimize --gas --abi --bin $1 >$file_name
  
  bin=`sed -n '12'p $file_name`
  abi=`sed -n '14'p $file_name`
  abic=$fct"Abi"
  
  reqst="var $abic = $output.contracts['$1:$fct'].abi"
  reqst=$reqst'"'$abi'"'
  
#  ./order.sh $reqst
  
  var account = web3.eth.accounts[0];                                                          
  var addContract = web3.eth.contract(<content/of/ABI>);                                         
  var binary = '0x<content/of/binary>';                                                          
  var estimatedGas = web3.eth.estimateGas({data: binary});                                       
  var addContractInstance = addContract.new({data: binary, from: myAccount, gas: estimatedGas}); 
  
fi
