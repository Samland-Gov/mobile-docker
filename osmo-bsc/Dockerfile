FROM debian:stable-slim

# Install dependencies
RUN apt-get update && apt-get install -y extrepo

# Install osmocom packages
RUN extrepo enable osmocom-latest
RUN apt update
RUN apt install -y osmo-bsc

# Cleanup
RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Command to run osmo-bsc
CMD ["osmo-bsc"]
#, "-c", "/etc/osmocom/osmo-bsc.cfg"]
