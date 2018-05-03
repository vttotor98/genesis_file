#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

#Exécution d'une requête passée en argument
geth --exec $1 attach ~/blockchain/.ethereum_private/AgaetisChain/geth.ipc
