FROM ghcr.io/archimedeos-development/archimedeos-base:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="Conteneur BlueTeam basé sur ArchimedeOS"

USER root

RUN userdel -r archimede || true

RUN useradd -m -s /bin/bash archytas && \
    echo "archytas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm volatility3 || true
RUN pacman -S --noconfirm logwatch || true
RUN pacman -S --noconfirm sleuthkit || true
RUN pacman -S --noconfirm foremost || true
RUN pacman -S --noconfirm testdisk || true
RUN pacman -S --noconfirm binwalk || true
RUN pacman -S --noconfirm exiftool || true
RUN pacman -S --noconfirm chkrootkit || true
RUN pacman -S --noconfirm rkhunter || true
RUN pacman -S --noconfirm clamav || true
RUN pacman -S --noconfirm yara || true
RUN pacman -S --noconfirm lynis || true
RUN pacman -S --noconfirm audit || true
RUN pacman -S --noconfirm hashdeep || true
RUN pacman -S --noconfirm gpg || true
RUN pacman -S --noconfirm wireshark-qt || true
RUN pacman -S --noconfirm tcpdump || true
RUN pacman -S --noconfirm tshark || true
RUN pacman -S --noconfirm iftop || true
RUN pacman -S --noconfirm iptraf-ng || true
RUN pacman -S --noconfirm logrotate || true
RUN pacman -S --noconfirm rsyslog || true
RUN pacman -Scc --noconfirm

USER archytas
WORKDIR /home/archytas

EXPOSE 22

CMD hostname aos && exec /bin/bash 