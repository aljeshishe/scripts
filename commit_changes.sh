#!/bin/bash
set -ex

git status
chmod 777 -R .
git add --all .
git commit -m "$1"
git push