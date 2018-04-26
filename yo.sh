#!/bin/bash

#Démarage du premier noeuds, vérifier les paramètres 
echo "Comment vous voulez appeller ce noeud ?"
read node_name

#Création du fichier start :
touch /blockchain/start.sh
cd /blockchain
echo geth --identity "$node_name" init /blockchain/genesis_folder/firstGenesis.json --datadir /blockchain/.ethereum_private/ACPrivateChain >start.sh
