#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Création du dossier du fichier json 
mkdir -p /blockchain/genesis_folder
mv /genesis_files/genesis.json /blockchain/genesis_folder/
#Lors de l'exécution de la commande attention à l'id de la blockchain
geth --datadir /blockchain/.ethereum_private init /blockchain/genesis_folder/genesis.json 

#Démarage du premier noeuds, vérifier les paramètres 
echo "Comment vous voulez appeller ce noeud ?"
read node_name
echo "Quel sera l'idnetwork ?"
read idnet

#Création du fichier start :
touch /blockchain/start.sh
cd /blockchain
echo "geth --identity $node_name init /blockchain/genesis_folder/genesis.json --datadir /blockchain/.ethereum_private/AgaetisChain" >start.sh
echo "geth --datadir ~/blockchain/.ethereum_private/AgaetisChain --networkid $idnet" >>start.sh 
chmod 755 start.sh
exit
