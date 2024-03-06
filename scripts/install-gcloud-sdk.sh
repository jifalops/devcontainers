#!/bin/bash
set -e
curl -fsSL https://sdk.cloud.google.com > gcloud-installer.sh
bash gcloud-installer.sh --disable-prompts
rm gcloud-installer.sh
