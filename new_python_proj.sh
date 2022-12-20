#!/usr/bin/env bash
set -ex
pip install tox cookiecutter jinja2-git lice
gh repo create $1 --public
gh repo clone $1
cookiecutter -f --no-input https://github.com/wemake-services/wemake-python-package  project_name=$1
cd $1
git add .
git commit -m "Initial commit"
git push
