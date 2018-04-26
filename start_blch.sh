#!/bin/bash
#Author Victor TIREBAQUE for Agaetis Clermont-Ferrand

#Démarage du premier noeuds, vérifier les paramètres
$file=./.param_blch
#Est-ce que le fichier de paramètre existe, et est-il vide
if [ ! -s $file] then
  #Comme il n'existe pas de fichier de paramètrage 
  #Nous le créons en demandant les paramètres à l'utilisateur
  echo "Comment vous voulez appeller ce noeud ?"
  read node_name
  echo "Quel sera l'idnetwork ?"
  read idnet

  #Création du fichier .param_blch
  touch ./.param_blch
  chmod +x .param_blch
  echo $node_name >.param_blch
  echo $idnet >>.param_blch
else
  #Comme il existe nous récupérons les données
  declare -a tab
  i=0
  while IFS='' read -r line || [[ -n "$line" ]]; do
    tab[i]=$line
    i++
  done < .param_blch
  
  $node_name=tab[0]
  $idnet=tab[1]
  
fi

geth --identity $node_name init /blockchain/genesis_folder/genesis.json --datadir /blockchain/.ethereum_private/AgaetisChain

if [ $# -gt 1 ] then
  geth --datadir ~/blockchain/.ethereum_private/AgaetisChain --networkid $idnet $@
else
 geth --datadir ~/blockchain/.ethereum_private/AgaetisChain --networkid $idnet &
fi
