#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

depl="~/blockchain/functions/deploy.js"

function ins_depl() {
  echo $1 >> $depl
}

if [ $1 = "help" ] || [ $1 = "" ]; then
  #Aide
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
  lof='deploy.log'
  echo "" >$lof
  ~/order.sh "loadScript('/home/ether/blockchain/functions/functions.js');checkAllBalances();"

  #Si le fichier est vide, l'exécution du script sera possible
  test=`tail -n 2 $lof | sed -n '1'p | cut -d " " -f 1`
  if [ "$test" = "ReferenceError:" ]; then
    echo "Problème avec LoadScript"
  else
    echo "Quel est le compte à partir duquel vous voulez déployer le contrat ?"
    read $account
    echo -n "Veuillez entrer le mot-de-passe :"
    read -s password
    echo

    #Dépoiement du contrat
    if [ ! -s $depl ]; then
      echo "" > $depl
    fi
    ins_depl "var myAccount = web3.eth.accounts["$account"];"
    ins_depl "web3.personal.unlockAccount(myAccount,"$password", 10000);"
    ins_depl "var addContract = web3.eth.contract("$abi");"
    ins_depl "var binary = '"$bin"';"
    ins_depl "var estimatedGas = web3.eth.estimateGas({data: binary});"
    ins_depl "var addContractInstance = addContract.new({data: binary, from: myAccount, gas: estimatedGas});"

    ~/order.sh "loadScript('~/blockchain/functions/deploy.js');"
  fi
fi
