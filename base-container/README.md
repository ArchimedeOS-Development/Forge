# ArchimedeOS Base Container

Image de base Arch Linux optimisée pour le développement et les containers personnalisés.

## 🚀 Caractéristiques

- **Base**: Arch Linux (dernière version)
- **Utilisateur**: `archimede` (non-root avec sudo)
- **Outils inclus**:
  - `base` et `base-devel` (outils de compilation)
  - `git` (gestion de versions)
  - `vim` (éditeur de texte)
  - `curl` et `wget` (téléchargements)
  - `sudo` (privilèges administrateur)

## 📦 Installation

### Construction locale

```bash
# Construction standard avec Podman
./build.sh

# Construction robuste (recommandée en cas de problèmes de connexion)
./build-robust.sh

# Construction avec Docker
./docker-build.sh [version] [dockerhub-username]
```

### Pull depuis Docker Hub

```bash
docker pull votre-username/archimedeos-base:latest
```

## 🔧 Utilisation

### Lancer le container

```bash
# Mode interactif
docker run -it --rm votre-username/archimedeos-base:latest

# Avec un volume monté
docker run -it --rm -v $(pwd):/workspace votre-username/archimedeos-base:latest
```

### Utiliser comme base dans vos Dockerfiles

```dockerfile
FROM votre-username/archimedeos-base:latest

# Vos personnalisations ici
RUN pacman -S --noconfirm votre-paquet

# Votre configuration
COPY . /workspace
WORKDIR /workspace

CMD ["/bin/bash"]
```

## 🏗️ Structure

```
/home/archimede/          # Répertoire utilisateur
├── .bashrc              # Configuration bash avec message de bienvenue
└── ...                  # Autres fichiers utilisateur
```

## 🔐 Sécurité

- Utilisateur non-root (`archimede`)
- Privilèges sudo configurés
- Image mise à jour régulièrement

## 📝 Exemples d'utilisation

### Container de développement Python

```dockerfile
FROM votre-username/archimedeos-base:latest

RUN pacman -S --noconfirm python python-pip
RUN pip install --user flask requests

WORKDIR /workspace
CMD ["python", "app.py"]
```

### Container de développement Node.js

```dockerfile
FROM votre-username/archimedeos-base:latest

RUN pacman -S --noconfirm nodejs npm
RUN npm install -g yarn

WORKDIR /workspace
CMD ["node", "app.js"]
```

## 🚀 Push vers Docker Hub

1. Connectez-vous à Docker Hub :
   ```bash
   docker login
   ```

2. Construisez et poussez :
   ```bash
   ./docker-build.sh v1.0 votre-username
   ```

## 🔧 Résolution des problèmes

### Problèmes de connexion lente

Si vous rencontrez des erreurs comme :
```
error: failed retrieving file '...' : Operation too slow
```

Utilisez la version robuste :
```bash
./build-robust.sh
```

Cette version utilise :
- Des miroirs plus fiables
- Un système de retry automatique
- Une gestion d'erreur améliorée

### Miroirs utilisés

La version robuste utilise ces miroirs fiables :
- `mirror.rackspace.com`
- `mirrors.kernel.org`
- `mirror.umd.edu`
- `mirror.csclub.uwaterloo.ca`

## 📋 Maintenance

- Mettez à jour régulièrement l'image de base Arch Linux
- Vérifiez les paquets installés pour la sécurité
- Testez l'image après chaque modification

## 🤝 Contribution

Pour contribuer à cette image de base :

1. Forkez le repository
2. Créez une branche pour votre fonctionnalité
3. Testez vos modifications
4. Soumettez une pull request

## 📄 Licence

Ce projet fait partie d'ArchimedeOS et suit la même licence. 