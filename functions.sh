#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME/blockchain
doss=$home/functions
err="Err"

#Nous nous assurons que les fichiers sont bien exécutables
chmod +x $doss/*.sh

#Récupération des différentes fonctions existantes dans $doss
j=0
for i in `ls $doss`
do
	#Seules les fonctions *.sh conviennent
	if [[ $i =~ .sh$ ]]; then
		tmp=$i
		f[$j]=${tmp%%.*}
		j=`expr $j + 1`
	fi 
done

#Choix en fonction du fait que ce soit exécuter en script ou par un utilisateur
if [ $# -eq 0 ]; then 
	echo "Quel fonction voulez-vous exécuter ?"

	#Affichage des fonctions
	for i in ${!f[*]}  
	do
		echo -n " $i : ${f[$i]},"
	done
	echo
	
	read x
else
	#Si un argument valide est passé en argument alors il sera exécuter
	x=$1
fi

#Condition d'erreur
if [ $x -lt ${#f[@]} ] && [ $x -ge 0 ]; then
	file="$doss/${f[$x]}.sh"
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
