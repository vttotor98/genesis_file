#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

if [ $# -eq 0 ]; then
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

func='eth.sendTransaction({from:$fc, to:$dc, value:web3.toWei($val,"$money"));'
