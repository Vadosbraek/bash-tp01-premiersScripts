#!/bin/bash

################################################################################
# Script : table_multiplication.sh
# Description : Affiche la table de multiplication d'un nombre
# Auteur : [Votre nom]
# Date : [Date]
################################################################################

# TODO: Demander un nombre à l'utilisateur

echo "Entrez un nombre" ":" $nb
read nb


# TODO: Valider que l'entrée est bien un nombre

if [[ ! "$nb" =~ ^-?[0-9]+$ ]]; then
    exit 1
fi

# TODO: Afficher la table de multiplication de 1 à 10

echo "Table de multiplication de" $nb ":"
    for ((i=1; i<=10; i++))
    do
        echo "$nb x $i = " $(($nb * $i))
    done
exit 0

