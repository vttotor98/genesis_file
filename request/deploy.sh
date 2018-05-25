#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME/blockchain
doss=$home/functions
depl=$doss/deploy.js

#Fonction qui permet d'écrire le contrat dans un fichier
function ins_depl() {
	echo $1 >> $depl
	#echo $1
}

#Si l'argument est vide ou est "help"
if [ -z $1 ] || [ $1 = "help" ] ; then 

	#Aide
	echo "Il faut mettre le nom du fichier du contrat en argument, et vous obtenez le fichier compilé dans un fichier .js"

else
  	#L'argument n'est pas vide ni est "help"
	#La chaîne de caractère qui est le nom du fichier monFichier.sol devient monfichier.js
	fct=$1
	fct=`echo ${fct%%.*}`
	fch=`echo "$fct" | tr '[:upper:]' '[:lower:]'`
	file_name=$fch".js"
  
	#Compilation du contract
	solc --optimize --gas --abi --bin $1 >$file_name

	#Extraction du code binaire et de l'abi
	bin=`sed -n '12'p $file_name`
	abi=`sed -n '14'p $file_name`

	#Choix du compte à partir duquel nous déployons le contrat
	$doss/checkAllBalance.sh
		
	echo -n "Quel est le compte à partir duquel vous voulez déployer le contrat ? "
	read account
	echo 
	echo -n "Veuillez entrer le mot de passe :"
	read -s password
	echo

	#Dépoiement du contrat, nous insérons chaque ligne dans le fichier deploy.js
	echo "" >$depl
	ins_depl "var myAccount = web3.eth.accounts["$account"];"
	ins_depl "web3.personal.unlockAccount(myAccount,'$password',10000);"
	ins_depl "var addContract = web3.eth.contract("$abi");"                                       
	ins_depl 'var binary = "0x'$bin'";'                                                          
	ins_depl "var estimatedGas = web3.eth.estimateGas({data: binary});"                                       
	ins_depl "var addContractInstance = addContract.new({data: binary, from: myAccount, gas: estimatedGas})"

	#Purge du fichier log avant l'utiliser
	lof='log_deploy.log'
	echo "" >$lof

	#Déploiement du contrat dans la blockchain
	~/order.sh "loadScript('"$home$depl"');" >>$lof

	
	#Si le fichier log possède l'erreur
	test=`tail -n 2 $lof 2>/dev/null | sed -n '1'p | cut -d " " -f 1`
		        
	if [ "$test" = "ReferenceError:" ]; then
		echo "Problème avec LoadScript"
	fi
fi
