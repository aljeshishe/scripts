#!/bin/bash
set -ex
pip3 install --upgrade pip && pip3 install -r requirements.txt
python3 check_cuda.py