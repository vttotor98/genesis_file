#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="./functions"

#Si il n'y a pas d'argument, c'est l'utilisateur qui choisit via l'entrée standard
if [ $# -eq 0 ]; then
	
	#Affichage des différents comptes enregistrés
	$doss/checkAllBalances.sh
	
	#Récupération des données
	echo "Veuillez choisir un compte débiteur :"
	read pc
	echo "Veuillez choisir un compte crediteur :"
	read dc
	echo "Veuillez entrer la valeur à transférer :"
        read val
        echo "Veuillez entrer la money :"
        read money

        pc="eth.accounts[$pc]"
	dc="eth.accounts[$dc]"

else
	#Sinon il l'utilise via des arguments
	pc="eth.accounts[$1]"
	dc="eth.accounts[$2]"
	val="$3"
	money="$4"
fi

#Demande de mot de passe
echo -n "Mot de passe de $pc:"
read -s pass
echo


#Exécution 
func='personal.unlockAccount('$pc',"'$pass'");'
func=$func'web3.eth.sendTransaction({from:'$pc',to:'$dc',value:web3.toWei('$val',"'$money'")});'
#Test
#echo $func
./order.sh $func
