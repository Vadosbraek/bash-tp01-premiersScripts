#!/bin/bash

################################################################################
# Script : devine_nombre.sh
# Description : Jeu de devinette - trouver un nombre aléatoire
# Usage : ./devine_nombre.sh <min> <max> [difficile]
# Auteur : [Votre nom]
# Date : [Date]
################################################################################

# TODO: Vérifier que 2 paramètres sont fournis

read -p "Entrez la valeur minimale (min) : " min
read -p "Entrez la valeur maximale (max) : " max


# TODO: Valider que les paramètres sont des nombres

#!/bin/bash

if [[ ! "$min" =~ ^-?[0-9]+$ ]] || [[ ! "$max" =~ ^-?[0-9]+$ ]]; then
    echo "Erreur : min et max doivent être des nombres entiers." >&2
    exit 1
fi


# TODO: Valider que min < max

if (( min >= max )); then
    echo "Erreur : min doit être strictement inférieur à max." >&2
    exit 1
fi


# TODO: Générer un nombre aléatoire entre min et max

SECRET=$((RANDOM % (max - min + 1) + min))

# TODO: Initialiser le nombre d'essais (5 par défaut, 3 en mode difficile)

# Exemple de variable pour le mode (peut être "facile", "normal" ou "difficile")
read -p "Entree la dificulté (facile, normal ou difficile): " MODE

# Initialisation du nombre d'essais (5 par défaut, 3 en mode difficile)

if [ "$MODE" = "difficile" ]; then
    ESSAIS=3
else
    ESSAIS=5
fi

echo "Nombre d'essais configuré : $ESSAIS"


# TODO: Boucle de jeu avec 5 essais maximum

GAGNE=0
for (( i = 1; i <= ESSAIS; i++ )); do
    echo "--- Tentative $i sur $ESSAIS ---"
    read -p "Proposez un nombre : " GUESS

    # Validation de la saisie (vérifie si c'est un nombre entier)
    if [[ ! "$GUESS" =~ ^-?[0-9]+$ ]]; then
        echo "Erreur : veuillez entrer un nombre entier valide."
        (( i-- )) # Ne compte pas cette tentative invalide
        continue
    fi

    if [ "$GUESS" -eq "$SECRET" ]; then
        echo "Gagné ! Vous avez trouvé le nombre secret ($SECRET)."
        GAGNE=1
        break
    elif [ "$GUESS" -lt "$SECRET" ]; then
        echo "C'est plus !"
    else
        echo "C'est moins !"
    fi
done




# TODO: Afficher le message de fin (victoire ou défaite)

if [ "$GAGNE" -eq 0 ]; then
    echo "Perdu ! Le nombre secret était : $SECRET"
fi