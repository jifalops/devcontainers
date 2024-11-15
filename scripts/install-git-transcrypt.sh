#!/usr/bin/env bash
sudo apt-get install -y --no-install-recommends xxd
sudo mkdir -p /usr/local/src
sudo git clone https://github.com/elasticdog/transcrypt.git /usr/local/src/transcrypt
sudo ln -s /usr/local/src/transcrypt/transcrypt /usr/local/bin/transcrypt

