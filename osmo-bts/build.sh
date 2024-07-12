#!/bin/bash

cd /tmp

# Clone and build libosmocore
git clone git://git.osmocom.org/libosmocore.git
cd libosmocore
autoupdate --force
autoreconf -i
./configure
make -j4
make install
ldconfig -i
cd ..

# Clone and build osmo-bts
git clone git://git.osmocom.org/osmo-bts.git
cd osmo-bts
autoupdate --force
autoreconf -i
./configure
make -j4
make install
ldconfig -i
cd ..

# # Clean up
# rm -rf libosmocore osmo-bts
