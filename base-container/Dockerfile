FROM archlinux:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"

RUN echo 'Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist && \
    echo 'Server = https://mirror.umd.edu/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base \
    base-devel \
    git \
    vim \
    curl \
    wget \
    sudo \
    bash \
    && pacman -Scc --noconfirm

RUN curl -O https://blackarch.org/strap.sh && \
    chmod +x strap.sh && \
    ./strap.sh && \
    rm strap.sh && \
    pacman -Syyu --noconfirm

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