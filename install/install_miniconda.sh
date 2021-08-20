#!/bin/bash
set -ex

wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/miniconda3
rm ~/miniconda.sh
echo "export PATH=$PATH:~/miniconda3/bin" >> ~/.bashrc