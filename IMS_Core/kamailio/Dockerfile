FROM ghcr.io/kamailio/kamailio:6.0.1-noble

USER root

# Install FreeRADIUS client
RUN if [ -f /etc/debian_version ]; then \
      apt-get update && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y freeradius-client && \
      rm -rf /var/lib/apt/lists/*; \
    else \
      apk add --no-cache radiusclient-ng; \
    fi

# Copy Kamailio + RADIUS‑client configs
COPY kamailio.cfg                     /etc/kamailio/kamailio.cfg
COPY radius/servers                   /etc/radiusclient-ng/servers
COPY radius/radiusclient.conf         /etc/radiusclient-ng/radiusclient.conf

RUN chown root:root /etc/kamailio/kamailio.cfg \
    && chown root:root /etc/radiusclient-ng/servers \
    && chown root:root /etc/radiusclient-ng/radiusclient.conf

USER kamailio
