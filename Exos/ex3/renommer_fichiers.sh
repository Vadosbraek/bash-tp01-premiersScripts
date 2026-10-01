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
if [ $# -lt 1 ]; then
	echo "Erreur : veuillez fournir un dossier en argument."
	exit 1
fi

# TODO: Vérifier que le dossier existe
if [ ! -d "$1" ]; then
	echo "Erreur : le Dossier '$1' n'existe pas."
	exit 1
fi

echo "Dossier Valide : $1"

# TODO: Récupérer la date du jour au format AAAAMMJJ
date_du_jour=$(date +%Y%m%d)

# TODO: Initialiser les compteurs
compteur=0

# TODO: Boucler sur tous les fichiers .txt du dossier
for fichier in "$1"/*.txt; do
	if [ -f "$fichier" ]; then
		echo "Traitement de : $fichier"
		
		# TODO: Pour chaque fichier :
		# Extraire le nom du fichier sans le chemin
		nom_fichier=$(basename "$fichier")
		
		# - Extraire le nom sans extension
		nom_sans_extension="${nom_fichier%.*}"
		
		# - Remplacer les espaces par des underscores
		nom_sans_espaces="${nom_sans_extension// /_}"
		
		# - Convertir en minuscules
		nom_minuscules="${nom_sans_espaces,,}"
		
		# - Créer le nouveau nom avec le préfixe de la date
		nouveau_nom="${date_du_jour}_${nom_minuscules}.txt"
		
		# ACTION : Renommer physiquement le fichier dans son dossier d'origine
		mv "$fichier" "$1/$nouveau_nom"

		# Incrémenter le compteur pour chaque fichier renommé
		compteur=$((compteur + 1))
	fi
done

# TODO: Afficher le résumé des opérations
echo "----------------------------------------"
echo "Résumé du traitement :"
echo "Nombre de fichiers traités : $compteur"
echo "----------------------------------------"