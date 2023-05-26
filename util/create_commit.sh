#!/bin/bash
set -e

BRANCH_NAME=tmp4
REPO=git@gitlab.alberblanc.com:trading/mlrobot.git
WORK_PATH=/tmp/repo

git clone ${REPO} ${WORK_PATH} > /dev/null
cd ${WORK_PATH}

echo creating branch: ${BRANCH_NAME}
git branch ${BRANCH_NAME} > /dev/null
git checkout ${BRANCH_NAME} > /dev/null
git push --set-upstream origin ${BRANCH_NAME} > /dev/null

echo create fixes
echo -e \n > setup.py
git add setup.py > /dev/null
git commit -m "fixed formatting" > /dev/null
git push  > /dev/null

echo deleting branch ${BRANCH_NAME}
git checkout master > /dev/null
git branch -d ${BRANCH_NAME} > /dev/null
git push origin --delete ${BRANCH_NAME} > /dev/null

rm -rf $WORK_PATH

