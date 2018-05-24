#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
err="Err"

#Nous nous assurons que les fichiers sont bien exécutables
chmod +x function/*.sh

#Les différentes fonctions existantes
f=( "checkAllBalances" "make_transaction" "addAccount" "check_tx" )

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

#Condition d'erreur
if [ $x -lt ${#f[@]} ] && [ $x -ge 0 ]; then
	file="./functions/${f[$x]}.sh"
else		
	x=$err
fi		

#Fonction d'erreur
if [ $x = $err ]; then
	echo "Désolé cette fonction n'est pas encore implémentée"
else
	#if [[ $file =~ [*.js] ]];
	#Exécution du choix
	$file
	#echo "Sera exécuté : $file"
fi
