#!/usr/bin/env bash
sudo apt-get install -y --no-install-recommends xxd
sudo mkdir -p /usr/local/src
pushd /usr/local/src > /dev/null
sudo git clone https://github.com/elasticdog/transcrypt.git
pushd transcrypt > /dev/null
sudo make install
popd > /dev/null
popd > /dev/null

