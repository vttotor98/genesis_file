#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Création du dossier du fichier json 
mkdir -p ~/blockchain/genesis_folder
mv genesis.json ~/blockchain/genesis_folder/
#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir ~/blockchain/.ethereum_private init ~/blockchain/genesis_folder/firstGenesis.json 

#Démarage du premier noeuds, vérifier les paramètres 
echo "Comment vous voulez appeller ce noeud ?"
read node_name
geth --identity $node_name init ~/blockchain/genesis_folder/firstGenesis.json --datadir ~/blockchain/.ethereum_private/ACPrivateChain
echo “pour quitter faire Ctrl + C”
geth --datadir ~/blockchain/.ethereum_private/ACPrivateChain --networkid 988 &
