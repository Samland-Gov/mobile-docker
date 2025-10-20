#!/bin/sh
set -e

mkdir -p /var/run/kamailio /var/log/kamailio

: "${KAMAILIO_LOG_LEVEL:=3}"

exec kamailio -DD -E -m 512 -M 16 -f /usr/local/etc/kamailio/kamailio.cfg -l udp:0.0.0.0:5060 -l tcp:0.0.0.0:5060 -L /usr/local/lib/kamailio/modules/ -Y /var/run/kamailio
