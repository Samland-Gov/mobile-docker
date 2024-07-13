FROM debian:stable-slim

# Install dependencies
RUN apt-get update && apt-get install -y extrepo telnet

# Install osmocom packages
RUN extrepo enable osmocom-latest
RUN apt update
RUN apt install -y \
    supervisor \
    osmo-bts-virtual \
    osmo-bsc


# Cleanup
RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Add script to copy default configs on container startup
COPY ./init.sh /init.sh
RUN chmod +x /init.sh

# Set working dirs
VOLUME [ "/data" ]
WORKDIR /data

# Copy default configs
RUN cp -rn /etc/osmocom/* /data

# Add supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 4242 4241

# Start init script
CMD ["/init.sh"]