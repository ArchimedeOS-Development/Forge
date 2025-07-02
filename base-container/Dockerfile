FROM archlinux:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="ArchimedeOS Base Container optimisée avec miroirs dynamiques"

RUN pacman -Syu --noconfirm python-pip || pacman -Syu --noconfirm reflector

RUN if command -v pip >/dev/null 2>&1; then \
      pip install rate-mirrors && \
      rate-mirrors --concurrency 40 --disable-comments --allow-root --save /etc/pacman.d/mirrorlist arch; \
    else \
      reflector --country France,Germany,Netherlands --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist; \
    fi

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
    echo 'echo "Container prêt pour le développement !"' >> ~/.bashrc

EXPOSE 22

CMD ["/bin/bash"] 