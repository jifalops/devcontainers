#!/bin/bash
set -e
cd "$(dirname "$0")"
if ps -aux | grep '[n]pm run dev'; then
    echo "Server is already running."
    tail -f ../local/npm_run_dev.log
else
    npm install > /dev/null
    npm run dev -- --host 0.0.0.0 2>&1 | tee ../local/npm_run_dev.log
fi
