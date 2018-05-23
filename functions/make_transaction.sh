#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="./functions"

if [ $# -eq 0 ]; then
	#$doss/checkAllBalances.sh
	#echo "Veuillez choisir un compte débiteur :"
	#read pc
	#echo "Veuillez choisir un compte crediteur :"
	#read dc
	#echo "Veuillez entrer la valeur à transférer :"
        #read val
        #echo "Veuillez entrer la money :"
        #read money
	
	
	pc="0"
	dc="1"
	pass="eth"
	val="1000000000000"
	money="wei"

        pc="eth.accounts[$pc]"
	dc="eth.accounts[$dc]"

	#echo -n "Mot de passe de $pc:" 
	#read -s pass
	#echo
	
else
	pc="eth.accounts[$1]"
	dc="eth.accounts[$2]"
	val="$3"
	money="$4"
fi

func='personal.unlockAccount('$pc',"'$pass'");'
func=$func' web3.eth.sendTransaction({from: '$pc', to: '$dc', value: web3.toWei('$val',"'$money'")});'
#echo $func
$doss/../order.sh $func

