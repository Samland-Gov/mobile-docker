FROM ghcr.io/kamailio/kamailio:6.0.1-noble

USER root

COPY kamailio.cfg                     /etc/kamailio/kamailio.cfg

RUN chown root:root /etc/kamailio/kamailio.cfg
USER kamailio
