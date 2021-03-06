#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

home="/blockchain/"
gf=$home"genesis_folder/"
doss="genesis_files/"
sousdoss=$doss"functions/"
req=$doss"request/"

#Préparation de l'environnement 
#Si l'installation se fait sur ubuntu, alors nous interprétons avec sudo
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
$os apt-get install -y solc

if [ $1 = "ubuntu" ]; then
	$os apt autoremove -y
fi


#Finalisation de l'installation de la blockchain
#Création du dossier de genèse 
mkdir -p $gf

cp $doss"genesis.json" $gf

#Copie du dossier contenant quelques fonctions
cp -R $sousdoss $home

#Initialistation de la blockchain
#GoEthereum se lance
geth='geth --datadir '$home".ethereum_private"' init '$gf"genesis.json"
echo $geth
#$geth

#Déplacement des fichiers d'exécution dans blockchain
exe="cp $req* $home"
$exe

#chmod -R +x $home

str=$home"str_blch.sh"
$str


echo "Exécuter strt_blch.sh pour démarrer la blockchain dans $home""strt_blch.sh"
echo "Vous pouvez supprimer le dossier genesis_files"

