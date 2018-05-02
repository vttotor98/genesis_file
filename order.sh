#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

#Exécution d'une requête
geth --exec $1 attach ~/blockchain/.ethereum_private/AgaetisChain/geth.ipc
