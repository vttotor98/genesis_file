#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
err="Err"


#Exécution de la fonction qui donne le détails
func="txpool.inspect;"
./order.sh $func

#Exécution de la fonction qui donne un résumé
func="txpool.status;"
./order.sh $func
