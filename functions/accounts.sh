#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

home=$HOME
doss="/blockchain/functions"
file=$home$doss"/checkAllBalances.js"
func="checkAllBalances()"

#echo $file
#echo $func
#echo $#
~/order.sh "loadScript('"$file"');"$func";"
