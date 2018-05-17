#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Création du dossier du fichier json 
mkdir -p /blockchain/genesis_folder
mv /genesis_files/genesis.json /blockchain/genesis_folder/

#Création du dossier avec quelques fonctions
mkdir /blockchain/functions
mv ./functions.js /blockchain/functions

#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir /blockchain/.ethereum_private init /blockchain/genesis_folder/genesis.json 

#Déplacement des fichiers d'exécution dans blockchain
mv /genesis_files/order.sh /blockchain
mv /genesis_files/start_blch.sh /blockchain

chmod +x /blockchain/*.sh

echo "Exécuter start_blch.sh pour démarrer la blockchain dans blockchain"
echo "Vous pouvez supprimer le dossier genesis_files"
