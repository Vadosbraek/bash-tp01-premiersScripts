#!/bin/bash

################################################################################
# Script : renommer_fichiers.sh
# Description : Renomme les fichiers .txt d'un dossier
#               - Remplace les espaces par des underscores
#               - Convertit en minuscules
#               - Ajoute un préfixe avec la date
# Usage : ./renommer_fichiers.sh <dossier> [--dry-run]
# Auteur : [Votre nom]
# Date : [Date]
################################################################################

# TODO: Vérifier qu'un dossier est fourni en paramètre

#!/bin/bash

# Vérifie si le premier paramètre est un dossier existant

if [ -d "$1" ]; then
    echo "Le dossier '$1' existe."
else
    echo "Erreur : Veuillez fournir un dossier valide en paramètre." >&2
    echo "Usage : $0 /chemin/vers/dossier" >&2
    exit 1
fi


# TODO: Vérifier que le dossier existe


# TODO: Récupérer la date du jour au format AAAAMMJJ


# TODO: Initialiser les compteurs


# TODO: Boucler sur tous les fichiers .txt du dossier


# TODO: Pour chaque fichier :
#       - Extraire le nom sans extension
#       - Remplacer les espaces par des underscores
#       - Convertir en minuscules
#       - Créer le nouveau nom avec le préfixe


# TODO: Afficher le résumé des opérations

