#!/bin/bash
set -ex
chmod -R 777 *.sh
git add --all .
git commit -m "Updated scripts"
git push