FROM ghcr.io/archimedeos-development/archimedeos-base:latest

LABEL maintainer="Killian Prin-abeil <killian@archimedeos.org>"
LABEL description="Conteneur BlueTeam basé sur ArchimedeOS"

USER root

RUN userdel -r archimede || true

RUN useradd -m -s /bin/bash archytas && \
    echo "archytas ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN sudo pacman -Syu --noconfirm && \
sudo pacman -S --noconfirm volatility3 logwatch foremost binwalk tcpdump chkrootkit testdisk sleuthkit exiftool hashdeep logrotate liblognorm rkhunter gpgme && \
sudo pacman -Scc --noconfirm

USER archytas
WORKDIR /home/archytas

EXPOSE 22

CMD hostname aos && exec /bin/bash