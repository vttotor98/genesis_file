#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

#Dossiers
home=$HOME"/blockchain"
doss=$home"/.ethereum_private/ACPrivateChain"
csl="console"


#Exécution d'une requête passée en argument
if [ $1 = $csl ]; then
  geth attach $doss/geth.ipc $1
else
  geth --exec $1 attach $doss/geth.ipc
fi
