#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=""
doss="/blockchain/functions"
file=$home$doss"/checkAllBalances.js"
func="checkAllBalances()"

#Exécution de l'ordre
~/order.sh "loadScript('$file');$func;"
