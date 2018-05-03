#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Installation des dépôts et paquest nécessaires
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
apt-get update
apt-get install -y build-essential
apt-get install -y golang 
apt-get install -y ethereum 
apt-get install -y geth

#Finalisation de l'installation et initialistation de la blockchain
genesis_files/ether.sh
