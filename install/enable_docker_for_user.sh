#!/bin/bash
set -ex

sudo groupadd docker
sudo usermod -aG docker ${USER}

echo Please relogin