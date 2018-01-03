# Build a minimal distribution container

#FROM arm64v8/debian:stretch
FROM debian:stretch

RUN packages='dnsmasq apache2 vsftpd' \
    && apt-get -y update \
    && apt-get install -y $packages \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/tftp"]
EXPOSE 53 80 21 69/udp

RUN useradd -d /tftp -s /bin/bash linaro; \
    echo 'linaro:linaro' | chpasswd

COPY d05_preseed.cfg /var/www/html/
COPY dnsmasq.conf /etc/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
