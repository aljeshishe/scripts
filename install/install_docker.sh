#!/bin/bash
set -ex

curl -fsSL https://get.docker.com -o /tmp/get-docker.sh && \
  sudo sh /tmp/get-docker.sh && \
  sudo systemctl start docker && \
  sudo systemctl enable docker