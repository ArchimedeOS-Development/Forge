#!/bin/bash

# Script de build et push pour Docker Hub
# Usage: ./docker-build.sh [version] [dockerhub-username]

set -e

# Configuration
IMAGE_NAME="archimedeos-base"
DEFAULT_VERSION="latest"
VERSION=${1:-$DEFAULT_VERSION}
DOCKERHUB_USER=${2:-"votre-username"}  # Remplacez par votre nom d'utilisateur Docker Hub

# Construction du nom complet de l'image
FULL_IMAGE_NAME="$DOCKERHUB_USER/$IMAGE_NAME"

echo "=== Construction et Push de l'image ArchimedeOS Base ==="
echo "Image: $FULL_IMAGE_NAME:$VERSION"
echo "Utilise Dockerfile.robust pour une meilleure fiabilité"
echo ""

# Vérification de la connexion Docker Hub
echo "Vérification de la connexion Docker Hub..."
if ! docker info >/dev/null 2>&1; then
    echo "❌ Docker n'est pas accessible. Assurez-vous que Docker est en cours d'exécution."
    exit 1
fi

# Vérification de la présence du Dockerfile.robust
if [ ! -f "Dockerfile.robust" ]; then
    echo "❌ Dockerfile.robust non trouvé! Utilisation du Dockerfile standard..."
    DOCKERFILE="Dockerfile"
else
    echo "✅ Utilisation du Dockerfile.robust"
    DOCKERFILE="Dockerfile.robust"
fi

# Construction de l'image
echo "Construction de l'image..."
docker build -f "$DOCKERFILE" -t "$FULL_IMAGE_NAME:$VERSION" .

if [ $? -eq 0 ]; then
    echo "✅ Image construite avec succès!"
else
    echo "❌ Erreur lors de la construction de l'image"
    exit 1
fi

# Tag pour latest si ce n'est pas déjà latest
if [ "$VERSION" != "latest" ]; then
    echo "Tagging comme latest..."
    docker tag "$FULL_IMAGE_NAME:$VERSION" "$FULL_IMAGE_NAME:latest"
fi

# Push vers Docker Hub
echo ""
echo "Pushing vers Docker Hub..."
echo "Assurez-vous d'être connecté avec: docker login"
echo ""

docker push "$FULL_IMAGE_NAME:$VERSION"

if [ "$VERSION" != "latest" ]; then
    docker push "$FULL_IMAGE_NAME:latest"
fi

echo ""
echo "✅ Image poussée avec succès sur Docker Hub!"
echo ""
echo "Pour utiliser cette image comme base dans vos autres containers:"
echo "  FROM $FULL_IMAGE_NAME:$VERSION"
echo ""
echo "Pour tester l'image:"
echo "  docker run -it --rm $FULL_IMAGE_NAME:$VERSION" 