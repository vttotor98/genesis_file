#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

doss="/blockchain/functions"

#nb_acc=7
nb_acc=`ls $doss | grep '.sh$' | wc -l`

#Si il n'y a pas d'argument, c'est l'utilisateur qui choisit via l'entrée standard
if [ $# -eq 0 ]; then
	
	#Affichage des différents comptes enregistrés
	$doss/checkAllBalances.sh
	
	#Récupération des données
	#Variables initialisées pour le while
	pc=-1
	dc=-1
	val=0
	while [ $pc -eq $dc ] ; do
		echo "hello"
		while [ $pc -lt 0 ] || [ $pc -ge $nb_acc ] ; do
			echo "Veuillez choisir un compte débiteur :"
			read pc
		done
		while [ $dc -lt 0 ] || [ $dc -ge $nb_acc ] ; do
			echo "Veuillez choisir un compte crediteur :"
			read dc
		done
	done
	
	while [ $val -le 0 ]; do
		echo "Veuillez entrer la valeur à transférer :"
        	read val
	done
        echo "Veuillez entrer la money (Wei par défaut) :"
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

if [[ $money = "" ]]; then
	money="wei"
fi


#Exécution 
func='personal.unlockAccount('$pc',"'$pass'");'
func=$func'web3.eth.sendTransaction({from:'$pc',to:'$dc',value:web3.toWei('$val',"'$money'")});'
#Test
#echo $func
./order.sh $func
