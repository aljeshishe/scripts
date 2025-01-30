#!/bin/bash
set -ex


trap 'echo "Last command exit code: $?"' EXIT
get_message() {
	ALL_MESSAGES=("removed commented code" "added verbose" "update version" "renamed methods" "refactoring" "using other data" "fixed style" "format" "fixed lines" "updated style")
	MESSAGES_COUNT=${#ALL_MESSAGES[@]}
	MESSAGE=${ALL_MESSAGES[ $RANDOM % ${MESSAGES_COUNT}  ]}
	echo ${MESSAGE}
}

BRANCH_NAME=${1:-139_distrib__}
REPO=git@gitlab.alberblanc.com:trading/mlrobot.git
WORK_PATH=/tmp/repo_$(uuidgen)

echo installing autopep8
python3 -m pip install autopep8

echo cloning repo ${REPO} to ${WORK_PATH}
git clone ${REPO} ${WORK_PATH} > /dev/null
cd ${WORK_PATH}

echo creating branch: ${BRANCH_NAME}
git branch ${BRANCH_NAME} > /dev/null
git checkout ${BRANCH_NAME} > /dev/null
git push --set-upstream origin ${BRANCH_NAME} > /dev/null

ALL_COMMIT_MESSAGES=("removed commented code" "added verbose" "update version" "renamed methods" "refactoring" "using other data")
COMMIT_MESSAGE=${strings[RANDOM % ${#ALL_COMMIT_MESSAGES[@]}]}
echo ${COMMIT_MESSAGE}

NUMBER_OF_FILES=$((RANDOM % 3 + 3))
for i in $( seq 0 ${NUMBER_OF_FILES} )
do
	FILE_TO_CHANGE=$(find . -type f -name "*.py" -size +1k -print0 | shuf -n 1 -z | xargs -0 echo)
	echo fixing file ${FILE_TO_CHANGE}
	python3 -m autopep8 -i --max-line-length 50 -a ${FILE_TO_CHANGE}
	git add ${FILE_TO_CHANGE}
	git commit -m "$(get_message)"
	git push  > /dev/null
	# sleep 83
done

# exit 0

echo deleting branch ${BRANCH_NAME}
git checkout master > /dev/null
git branch -d ${BRANCH_NAME} > /dev/null
git push origin --delete ${BRANCH_NAME} > /dev/null

rm -rf $WORK_PATH

