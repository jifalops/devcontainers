#!/bin/bash
set -e

if [ ! -d "local" ]; then
    cp -r local.default local
fi
