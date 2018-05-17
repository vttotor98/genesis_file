#!/bin/bash
#Author Victor TIREBAQUE for Agaetis
  
  #Aide
if [ $1 = "help" ] || [ $1 = "" ]; then 
  echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compiler dans un fichier .js"
else
  #Prérequis
 #$func_file="/blockchain/functions/functions.js"
 #~/order.sh "loadScript('/home/ether/blockchain/functions/functions.js');
  
  #La chaîne de caractère qui est le nom du fichier monFichier.sol devient monfichier.js
  fct=$1
  fct=`echo ${fct%%.*}`
  fch=`echo "$fct" | tr '[:upper:]' '[:lower:]'`
  output=$fct"Output"
  file_name=$fch".js"
  
  #Compilation du contract
  solc --optimize --gas --abi --bin $1 >$file_name
  
  #Extraction du code binaire et de l'abi
  bin=`sed -n '12'p $file_name`
  abi=`sed -n '14'p $file_name`
  #Abi call & Bin call variables
  abic=$fct"Abi"
  binc=$fct"BinCode"
  

  #Choix du compte à partir duquel nous déployons le contrat
  ~/order.sh "loadScript('/home/ether/blockchain/functions/functions.js');checkAllBalances();"
  echo "Quel est le compte à partir duquel vous voulez déployer le contrat ?"
  read $account
  echo -n "Veuillez entrer le mot-de-passe :"
  read -s password
  echo

  #Dépoiement du contrat
  ~/order.sh "var myAccount = web3.eth.accounts["$account"];
  web3.personal.unlockAccount(myAccount,"$password", 10000);
  var addContract = web3.eth.contract("$abi");"                                         
  #"var binary = '0x"<content/of/binary>"';"                                                          
  #"var estimatedGas = web3.eth.estimateGas({data: binary});"                                       
  #"var addContractInstance = addContract.new({data: binary, from: myAccount, gas: estimatedGas});"
  
fi
