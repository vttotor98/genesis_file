#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

if [ $# -eq 0 ]; then
<<<<<<< HEAD
	./functions/checkAllBalances.sh
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
	pc="eth.accounts[$1]"
	dc="eth.accounts[$2]"
	val="$3"
	money="$4"
fi

func='eth.sendTransaction({from:$fc, to:$dc, value:web3.toWei($3,"$4"));'
=======
        ./functions/checkAllBalances.sh
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
        pc="eth.accounts[$1]"
        dc="eth.accounts[$2]"
        val="$3"
        money="$4"
fi
>>>>>>> faef4fcba99d0698bfa96c7169415d4786a4912d

func='eth.sendTransaction({from:$fc, to:$dc, value:web3.toWei($val,"$money"));'
