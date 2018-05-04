#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

csl="console"
#Exécution d'une requête passée en argument
if [ $1 = $csl ]; then
  geth attach ~/blockchain/.ethereum_private/AgaetisChain/geth.ipc $1
else
  geth --exec $1 attach ~/blockchain/.ethereum_private/AgaetisChain/geth.ipc
fi
