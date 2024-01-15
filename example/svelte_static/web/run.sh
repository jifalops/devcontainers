#!/bin/bash
set -e
npm install > /dev/null
npm run dev -- --host 0.0.0.0 > ../local/npm_run_dev.log 2>&1 &
tail -f ../local/npm_run_dev.log
