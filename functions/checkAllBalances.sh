#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
file=$home$doss"/checkAllBalances.js"
func="checkAllBalances()"

#Exécution de l'ordre
~/order.sh "loadScript('$file');$func;"
