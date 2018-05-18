#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
err="Err"

#Nous nous assurons que les fichiers sont bien exécutables
chmod +x function/*.sh

#Les différentes fonctions existantes
f[0]="checkAllBalances"
f[1]="make_transaction"
f[2]="addAccount"


echo "Quel fonction voulez-vous exécuter ?"
for i in ${!f[*]}  
do
	echo -n " $i : ${f[$i]},"
done
echo
read x


case $x in
	0)
		func=${f[$x]}"()"
		file=$home$doss${f[$x]}".js"
		;;
	1)
		file=$home$doss${f[$x]}
		./functions/accounts.sh > ret
		echo ret
		t[0]="eth.accounts[${ret[0]}]"
		t[1]="eth.accounts[${ret[1]}]"
		t[2]='web3.toWei(${ret[2]},"${ret[3]}")'
		echo ${t[0]} ${t[1]} ${t[2]} ${t[3]} 
		func="eth.sendTransaction({from:${t[0]}, to:${t[1]}, value:${t[2]}})"
		;;
	2)
		func=""
		;;
	*)
		x=$err
		func="Désolé cette fonction n'est pas encore implémentée"
		;;
esac

if [ $x = $err ]; then
	echo $func
else
	echo $func
	#~/order.sh "loadScript('"$home$doss$file"');"$func";"
fi
