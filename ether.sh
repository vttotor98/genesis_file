#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Création du dossier du fichier json 
mkdir -p /blockchain/genesis_folder
mv /genesis_files/genesis.json /blockchain/genesis_folder/
#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir /blockchain/.ethereum_private init /blockchain/genesis_folder/genesis.json 

echo "Exécuter start_blch.sh pour démarrer la blockchain"
