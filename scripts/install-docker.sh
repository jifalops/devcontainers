#!/bin/bash
curl -fsSL https://get.docker.com | sudo bash
sudo usermod -aG docker $(whoami)
sudo su $(whoami)
