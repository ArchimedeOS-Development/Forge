#!/bin/bash

# Script de build pour l'image Podman basique d'ArchimedeOS
# Usage: ./build.sh [tag]

set -e

# Configuration
IMAGE_NAME="archimedeos-base"
DEFAULT_TAG="latest"
TAG=${1:-$DEFAULT_TAG}

echo "=== Construction de l'image Podman ArchimedeOS Base ==="
echo "Image: $IMAGE_NAME:$TAG"
echo ""

# Construction de l'image
echo "Construction en cours..."
podman build -t "$IMAGE_NAME:$TAG" .

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Image construite avec succès!"
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

podman login docker.io
podman tag archimedeos-base:latest docker.io/bouddha/archimedeos-base:latest
podman push docker.io/bouddha/archimedeos-base:latest 