# Systemd container
FROM jrei/systemd-fedora:latest

STOPSIGNAL SIGRTMIN+3
USER root
# Exposes TCP/UDP Ports on the container
EXPOSE 53

# Install BIND packages
RUN dnf -y install bind bind-utils && dnf clean all

# Enable BIND service
RUN systemctl enable named.service

# Copy in default zone content
COPY --chown=named:named db.* /var/named/dynamic/
RUN chmod 644 /var/named/dynamic/db.*
