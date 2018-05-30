#!/bin/bash
#Author Victor TIREBAQUE for Agaetis Clermont-Ferrand

home="~/blockchain/"
doss=$home".ethereum_private/"
gl=$doss"geth.log"
fichier="~/.param_blch"

cat "~/.param_blch"
cat $fichier

#Démarage du premier noeuds, vérifier les paramètres
#Est-ce que le fichier de paramètre existe, et est-il vide
if [ ! -s $fichier ]; then
	#Comme il n'existe pas de fichier de paramètrage
	#Nous le créons en demandant les paramètres à l'utilisateur
	echo "Comment voulez-vous appeller le dossier ?"
	read nom_d
	echo "Comment voulez-vous appeller ce noeud ?"
	read node_name
	echo "Quel sera l'idnetwork ?"
	read idnet
	
	#Création du fichier $fichier
	echo $nom_d > $fichier
	echo $node_name >> $fichier
	echo $idnet >> $fichier
        chmod 755 $fichier

else
	#Comme il existe nous récupérons les données
	declare -a tab
	i=0

	#Lecture dans le fichier $fichier
	while IFS='' read -r line || [[ -n "$line" ]]; do
		tab[i]=$line
		i=`expr $i + 1`
	done < $fichier
	
	datadir=$doss${tab[0]}
	node_name=${tab[1]}
	idnet=${tab[2]}

fi


#Initialisation de démarrage et redirection du fichier nohup.out dans geth.log
#geth --identity $node_name init $doss/genesis_folder/genesis.json --datadir $datadir
#nohup geth --datadir $datadir --networkid $idnet --nodiscover &>>$gl &


#Don des droits en lecture
chmod +r $gl
