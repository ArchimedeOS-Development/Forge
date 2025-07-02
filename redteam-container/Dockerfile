FROM ghcr.io/archimedeos-development/archimedeos-base:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="Conteneur RedTeam basé sur ArchimedeOS"

USER root

RUN userdel -r archimede || true

RUN useradd -m -s /bin/bash claw && \
    echo "claw ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN sudo pacman -Syu --noconfirm && \
    sudo pacman -S --noconfirm nmap metasploit aircrack-ng john hydra && \
    sudo pacman -Scc --noconfirm

USER claw
WORKDIR /home/claw

EXPOSE 22

CMD hostname aos && exec /bin/bash 