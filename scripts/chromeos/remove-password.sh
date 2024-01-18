#!/bin/bash
sudo passwd -d $(whoami)

# This was needed because installing homebrew asked for the password but it was not set.
