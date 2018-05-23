#!/bin/bash
#Author Victor TIREBAQUE for Agaetis

#Enregistrement du mot de passe 
echo -n "Veuillez entrer votre mot de passe :"
read -s password
echo

#Définition de la fonction à exécuter
func="personal.newAccount('"$password"');"

#Exécution
echo -n "Veuillez ne pas perdre votre mot de passe et votre n° de compte:"
~/order.sh $func 
