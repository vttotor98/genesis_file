#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Demande du nom du noeud
echo "Comment vous voulez appeller ce noeud ?"
read node_name

#initialisation du noeud
geth --identity node_name init ~/blockchain/genesis_folder/firstGenesis.json --datadir ~/blockchain/.ethereum_private/AgaetisChain
