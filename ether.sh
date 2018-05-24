#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

home=~/blockchain/
gf=$home"genesis_folder/"

#Création du dossier du fichier json 
mkdir -p $gf

cp ./genesis.json $home"genesis_folder/"

#Création du dossier avec quelques fonctions
mkdir $home"functions"
cp ./functions/functions.js $home"functions"

#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir /blockchain/.ethereum_private init /blockchain/genesis_folder/genesis.json 

#Déplacement des fichiers d'exécution dans blockchain
cp ./order.sh $home
cp ./start_blch.sh $home

echo "Exécuter start_blch.sh pour démarrer la blockchain dans $home"
echo "Vous pouvez supprimer le dossier genesis_files"
