#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Installation des dépôts et paquest nécessaires
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get update
sudo apt-get install -y build-essential golang software-properties-common ethereum eth

#Finalisation de l'installation et initialistation de la blockchain
genesis_files/ether.sh
