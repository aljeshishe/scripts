#!/bin/bash
set -ex
chmod 777 -R .
git add --all .
git commit -m "Updated scripts"
git push