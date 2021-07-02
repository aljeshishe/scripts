#!/bin/bash
docker run --gpus all -it -v $PWD:/app  -v $PWD/.cache:/root/.cache nvidia/cuda:11.0.3-cudnn8-devel-ubuntu18.04 bash -c "apt update && apt install python3-pip -y && cd /app && ./run.sh"