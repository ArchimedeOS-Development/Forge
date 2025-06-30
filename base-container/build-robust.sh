#!/bin/bash

# Script de build pour la version robuste de l'image Podman ArchimedeOS
# Usage: ./build-robust.sh [tag]

set -e

# Configuration
IMAGE_NAME="archimedeos-base-robust"
DEFAULT_TAG="latest"
TAG=${1:-$DEFAULT_TAG}

echo "=== Construction de l'image Podman ArchimedeOS Base (Robust) ==="
echo "Image: $IMAGE_NAME:$TAG"
echo "Utilise Dockerfile.robust avec gestion d'erreur"
echo ""

# Vérification de la présence du Dockerfile.robust
if [ ! -f "Dockerfile.robust" ]; then
    echo "❌ Dockerfile.robust non trouvé!"
    exit 1
fi

# Construction de l'image avec le Dockerfile robuste
echo "Construction en cours avec gestion d'erreur..."
podman build -f Dockerfile.robust -t "$IMAGE_NAME:$TAG" .

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Image robuste construite avec succès!"
    echo "Pour lancer le container:"
    echo "  podman run -it --rm $IMAGE_NAME:$TAG"
    echo ""
    echo "Pour voir les images disponibles:"
    echo "  podman images | grep $IMAGE_NAME"
else
    echo ""
    echo "❌ Erreur lors de la construction de l'image"
    exit 1
fi 