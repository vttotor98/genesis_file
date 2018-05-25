#!/bin/bash
#Author : Victor TIREBAQUE for Agaetis Clermont-Ferrand

home=~/blockchain/
gf=$home"genesis_folder/"
doss=genesis_files/
sousdoss=$doss"functions/"
req=request/

#Création du dossier de genèse 
#mkdir -p $gf

#cp $doss"genesis.json" $gf

#Copie du dossier contenant quelques fonctions
#cp -R $sousdoss $home

#Lors de l'exécution de la commande attention à l'id de la blockchain
#geth --datadir $home".ethereum_private" init $gf"genesis.json"

#Déplacement des fichiers d'exécution dans blockchain
echo $req
echo $home

#exe="cp $req* $home"
$exe

echo "Exécuter start_blch.sh pour démarrer la blockchain dans $home"
echo "Vous pouvez supprimer le dossier genesis_files"
