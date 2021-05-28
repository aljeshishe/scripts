#!/bin/bash
set -ex
pip3 install --upgrade pip 
pip3 install -r requirements.txt
echo 
python3 check_cuda.py