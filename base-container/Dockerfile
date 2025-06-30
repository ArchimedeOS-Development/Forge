# Image Podman basique d'Arch Linux
# Basée sur l'image officielle d'Arch Linux
FROM archlinux:latest

# Configuration des miroirs plus fiables
RUN echo 'Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirror.umd.edu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

# Mise à jour du système et installation des paquets de base avec retry
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base \
    base-devel \
    git \
    vim \
    curl \
    wget \
    sudo \
    && pacman -Scc --noconfirm

RUN useradd -m -s /bin/bash archimede && \
    echo "archimede ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV HOME=/home/archimede
ENV USER=archimede

USER archimede
WORKDIR /home/archimede

RUN echo 'echo "=== ArchimedeOS Base Container ==="' >> ~/.bashrc && \
    echo 'echo "Container prêt pour le développement!"' >> ~/.bashrc

EXPOSE 22

CMD ["/bin/bash"] 