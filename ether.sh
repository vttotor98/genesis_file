#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

home=~/blockchain/
gf=$home"genesis_folder/"
doss=./genesis_files/

#Création du dossier du fichier json 
mkdir -p $gf

cp $doss"genesis.json" $home"genesis_folder/"

#Création du dossier avec quelques fonctions
mkdir $home"functions"
cp $doss"functions/functions.js" $home"functions"

#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir /blockchain/.ethereum_private init /blockchain/genesis_folder/genesis.json 

#Déplacement des fichiers d'exécution dans blockchain
cp $doss"order.sh" $home
cp $doss"start_blch.sh" $home

echo "Exécuter start_blch.sh pour démarrer la blockchain dans $home"
echo "Vous pouvez supprimer le dossier genesis_files"
