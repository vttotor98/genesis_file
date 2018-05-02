#!/bin/bash
#Author Victor TIREBAQUE for Agaetis Clermont-Ferrand

geth --identity node1 init ~/blockchain/genesis_folder/firstGenesis.json --datadir ~/blockchain/.ethereum_private/ACPrivateChain
chmod +r geth.log
nohup geth --datadir ~/blockchain/.ethereum_private/ACPrivateChain --networkid 988 --nodiscover &>geth.log &
