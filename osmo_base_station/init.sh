#!/bin/bash

# Copy default configs from /etc/osmocom to /data if /data is empty
if [ ! "$(ls -A /data)" ]; then
  cp -rn /etc/osmocom/* /data/
fi

# Run supervisor in the foreground
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
