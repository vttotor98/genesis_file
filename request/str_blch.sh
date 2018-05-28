#!/bin/bash
#Author Victor TIREBAQUE for Agaetis Clermont-Ferrand

home="~/blockchain/"
doss=$home".ethereum_private/"
gl=$doss"geth.log"
fichier=$doss".param_blch"

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
	touch "$fichier"
	chmod 755 $fichier
	echo $nom_d > $fichier
	echo $node_name >> $fichier
	echo $idnet >> $fichier
else
	#Comme il existe nous récupérons les données
	declare -a tab
	i=0

	#Lecture dans le fichier $fichier
	while IFS='' read -r line || [[ -n "$line" ]]; do
		tab[i]=$line
		i=`expr $i + 1`
	done < $fichier
	
	node_name=${tab[0]}
	idnet=${tab[1]}

fi


#Initialisation de démarrage et redirection du fichier nohup.out dans geth.log
geth --identity $node_name init ~/blockchain/genesis_folder/genesis.json --datadir ~/blockchain/.ethereum_private/ACPrivateChain
nohup geth --datadir ~/blockchain/.ethereum_private/ACPrivateChain --networkid $idnet --nodiscover &>>$gl &


#Don des droits en lecture
chmod +r $gl
