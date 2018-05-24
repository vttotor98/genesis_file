#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

if [ $1 = "ubuntu" ] ; then
	        os="sudo"
		else
			        os=""
				fi

#Installation des dépôts et paquest nécessaires
$os add-apt-repository -y ppa:ethereum/ethereum
$os add-apt-repository -y ppa:ethereum/ethereum-dev
$os apt-get update
$os apt-get install -y build-essential
$os apt-get install -y software-properties-common
$os apt-get install -y golang
$os apt-get install -y ethereum
$os apt-get install -y geth

#Finalisation de l'installation et initialistation de la blockchain
genesis_files/ether.sh

