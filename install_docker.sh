#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Installation des dépôts et paquest nécessaires
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-dev
apt-get update
apt-get install -y build-essential golang ethereum eth

#Finalisation de l'installation et initialistation de la blockchain
cd /
git clone https://github.com/vttotor98/genesis_files/
chmod 755 genesis_files/ether.sh
genesis_files/ether.sh
