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
if [ $# -lt 1 ]; then
	echo "Erreur : veuiller fournir un dossier en argument."
	exit 1
fi
# Vérifie si le premier paramètre est un dossier existant

if [ ! -d "$1" ]; then
	echo "Erreur : '$1' n'est pas un dossier existant"
	exit 1
fi

echo "Dossier Valide : $1"


# TODO: Vérifier que le dossier existe
if [ ! -d "$1" ]; then
	echo "Erreur : le Dossier '$1' n'existe pas."
	exit 1
fi

# TODO: Récupérer la date du jour au format AAAAMMJJ
date_du_jour=$(date +%Y%m%d)

# TODO: Initialiser les compteurs
compteur=0
total_fichiers=0

# TODO: Boucler sur tous les fichiers .txt du dossier
for fichier in "$1"/*.txt; do
	if [ -f "$fichier" ]; then
		echo "Traitement de : $fichier"
		compteur=$((compteur + 1 ))
	fi
done
# TODO: Pour chaque fichier :
nom_fichier=$(basename "$fichier")
#       - Extraire le nom sans extension
nom_sans_extension="${nom_fichier%.*}"
#       - Remplacer les espaces par des underscores
nom_sans_espaces="${nom_sans_extension// /_}"
#       - Convertir en minuscules
nom_minuscules="${nom_sans_espaces,,}"
#       - Créer le nouveau nom avec le préfixe
nouveau_nom="${prefixe}_${nom_minuscules}.txt"

compteur=$((compteur + 1))
# TODO: Afficher le résumé des opérations

echo "----------------------------------------"
echo "Résumé du traitement :"
echo "Nombre de fichiers traités : $compteur"
echo "----------------------------------------"

