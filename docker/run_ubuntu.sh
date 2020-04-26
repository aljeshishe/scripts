#!/bin/bash
set -ex

docker run -it -v $(pwd):/app -w /app ubuntu bash 