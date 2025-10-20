# syntax=docker/dockerfile:1.6

ARG DEBIAN_FRONTEND=noninteractive
ARG KAMAILIO_VERSION=5.7.4

FROM debian:12-slim AS build

ARG DEBIAN_FRONTEND
ARG KAMAILIO_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        flex \
        bison \
        git \
        pkg-config \
        libssl-dev \
        libcurl4-openssl-dev \
        libxml2-dev \
        libunistring-dev \
        libjansson-dev \
        libevent-dev \
        libmnl-dev \
        libpcre3-dev \
        libreadline-dev \
        libsystemd-dev \
        libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone --depth 1 --branch ${KAMAILIO_VERSION} https://github.com/kamailio/kamailio.git
WORKDIR /usr/src/kamailio

RUN make cfg \
    && make include_modules="presence ims_usrloc_pcscf ims_registrar_pcscf ims_auth ims_charging ims_icscf ims_isc ims_qos ims_registrar_scscf ims_usrloc_scscf cdp cdp_avp sl tm tmx rr pv maxfwd textops siputils sdpops xlog pike" q=0 all q=0 all \
    && make install

FROM debian:12-slim AS icscf

ARG DEBIAN_FRONTEND

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        iproute2 \
        libcurl4 \
        libevent-2.1-7 \
        libjansson4 \
        libpcre3 \
        libreadline8 \
        libssl3 \
        libmnl0 \
        libunistring2 \
        libxml2 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local /usr/local

RUN mkdir -p /usr/local/etc/kamailio/ims

COPY icscf.kamailio.cfg /usr/local/etc/kamailio/kamailio.cfg
COPY icscf.diameter.xml /usr/local/etc/kamailio/ims/diameter.xml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 5060/udp 5060/tcp 5062/udp 5062/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

FROM debian:12-slim AS pcscf

ARG DEBIAN_FRONTEND

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        iproute2 \
        libcurl4 \
        libevent-2.1-7 \
        libjansson4 \
        libpcre3 \
        libreadline8 \
        libssl3 \
        libmnl0 \
        libunistring2 \
        libxml2 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local /usr/local

RUN mkdir -p /usr/local/etc/kamailio/ims

COPY pcscf.kamailio.cfg /usr/local/etc/kamailio/kamailio.cfg
COPY pcscf.diameter.xml /usr/local/etc/kamailio/ims/diameter.xml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 5060/udp 5060/tcp 5062/udp 5062/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

FROM debian:12-slim AS scscf

ARG DEBIAN_FRONTEND

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        iproute2 \
        libcurl4 \
        libevent-2.1-7 \
        libjansson4 \
        libpcre3 \
        libreadline8 \
        libssl3 \
        libmnl0 \
        libunistring2 \
        libxml2 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /usr/local /usr/local

RUN mkdir -p /usr/local/etc/kamailio/ims

COPY scscf.kamailio.cfg /usr/local/etc/kamailio/kamailio.cfg
COPY scscf.diameter.xml /usr/local/etc/kamailio/ims/diameter.xml
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 5060/udp 5060/tcp 5062/udp 5062/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]