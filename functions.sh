#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
err="Err"

#Nous nous assurons que les fichiers sont bien exécutables
chmod +x function/*.sh

#Les différentes fonctions existantes
f=( "checkAllBalances" "make_transaction" "addAccount" )

#Choix en fonction du fait que ce soit exécuter en script ou par un utilisateur
if [ $# -eq 0 ]; then 
	echo "Quel fonction voulez-vous exécuter ?"
	for i in ${!f[*]}  
		do
		echo -n " $i : ${f[$i]},"
	done
	echo
	read x
else
	x=$1
fi

#Exécution du choix
case $x in
	0)
		file="./functions/${f[$x]}.sh"
		;;
	1)
		file="./functions/${f[$x]}.sh"
		;;
	2)
		file="./functions/${f[$x]}.sh"
		;;
	*)
		x=$err
		func="Désolé cette fonction n'est pas encore implémentée"
		;;
esac

#Fonction d'erreur
if [ $x = $err ]; then
	echo $func
else
	#Si le fichier finit en .js
	if [[ $file =~ [*.js] ]]; then
		echo "Sera exécuté : ~/order.sh \"loadScript('$file');$func;\""
		#~/order.sh "loadScript('$file');$func;"
	else
		#file finit par .sh
		#$file
		echo "Sera exécuté : $file"
	fi
fi
