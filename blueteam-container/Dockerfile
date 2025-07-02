FROM ghcr.io/archimedeos-development/archimedeos-base:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="Conteneur BlueTeam basé sur ArchimedeOS"

USER root

RUN userdel -r archimede || true

RUN useradd -m -s /bin/bash archytas && \
    echo "archytas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm volatility3 || true && \
    pacman -S --noconfirm logwatch || true && \
    pacman -S --noconfirm sleuthkit || true && \
    pacman -S --noconfirm foremost || true && \
    pacman -S --noconfirm testdisk || true && \
    pacman -S --noconfirm binwalk || true && \
    pacman -S --noconfirm exiftool || true && \
    pacman -S --noconfirm chkrootkit || true && \
    pacman -S --noconfirm rkhunter || true && \
    pacman -S --noconfirm clamav || true && \
    pacman -S --noconfirm yara || true && \
    pacman -S --noconfirm lynis || true && \
    pacman -S --noconfirm audit || true && \
    pacman -S --noconfirm hashdeep || true && \
    pacman -S --noconfirm gpg || true && \
    pacman -S --noconfirm wireshark-qt || true && \
    pacman -S --noconfirm tcpdump || true && \
    pacman -S --noconfirm tshark || true && \
    pacman -S --noconfirm iftop || true && \
    pacman -S --noconfirm iptraf-ng || true && \
    pacman -S --noconfirm logrotate || true && \
    pacman -S --noconfirm rsyslog && \
    pacman -Scc --noconfirm

USER archytas
WORKDIR /home/archytas

EXPOSE 22

CMD hostname aos && exec /bin/bash 