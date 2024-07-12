FROM debian:stable-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    autoconf \
    automake \
    libtool \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the build script
COPY build.sh /build.sh
RUN chmod +x /build.sh

# Run the build script
RUN /build.sh

# Expose necessary ports
EXPOSE 4242

# Copy the start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD [ "/start.sh" ]

# Command to run osmo-bsc
# CMD ["osmo-bsc", "-c", "/etc/osmocom/osmo-bsc.cfg"]
