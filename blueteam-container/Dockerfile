FROM ghcr.io/archimedeos-development/archimedeos-base:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="Conteneur BlueTeam basé sur ArchimedeOS"

USER root

RUN userdel -r archimede || true

RUN useradd -m -s /bin/bash archytas && \
    echo "archytas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    wireshark-qt \
    tcpdump \
    nmap \
    tshark \
    iftop \
    iptraf-ng \
    exiftool \
    binwalk \
    sleuthkit \
    foremost \
    testdisk \
    chkrootkit \
    rkhunter \
    clamav \
    yara \
    lynis \
    audit \
    hashdeep \
    gpg \
    logrotate \
    rsyslog \
    volatility3 \
    logwatch \
    && pacman -Scc --noconfirm

USER archytas
WORKDIR /home/archytas

EXPOSE 22

CMD hostname aos && exec /bin/bash 