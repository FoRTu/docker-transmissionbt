FROM debian:stable-slim

LABEL maintainer="FoRTu" \
maintainet.email="mikelfortuna@gmail.com" \
maintainer.website="https://fortu.io/"

# Install Updates & transmission-daemon:
RUN apt update && \
apt upgrade -y && \
apt install -y transmission-daemon && \
apt-get -y autoclean && \
apt-get -y autoremove && \
rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*

# RPC port
EXPOSE 9091/tcp

# Peer port
EXPOSE 51413/udp
EXPOSE 51413/tcp

# Run transmission
CMD /usr/bin/transmission-daemon -f --config-dir /etc/transmission-daemon --log-error
