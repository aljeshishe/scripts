#!/bin/bash
# set -ex
FILES=100000
FILE_SIZE=100k

# set -ex
rm -rf out
rm -rf files
rm -rf arcs
mkdir -p files
mkdir -p out
mkdir -p arcs

echo "Creating files $FILES of size $FILE_SIZE"
for (( i = 0; i <= $FILES; i++ ))
do
	head -c $FILE_SIZE </dev/urandom > files/file$i
done
TIME_CMD='/usr/bin/time -f \ttime:%E'
echo "Creating arcs/files.tar.gz"
$TIME_CMD tar czf  arcs/files.tar.gz files
echo "Unpacking arcs/files.tar.gz 1 file"
$TIME_CMD tar -C out -xf arcs/files.tar.gz files/file50
rm -rf out/*
echo "Unpacking arcs/files.tar.gz"
$TIME_CMD tar -C out -xzf arcs/files.tar.gz 
rm -rf out/*

echo
echo "Creating arcs/files.tar"
$TIME_CMD tar cf arcs/files.tar files
echo "Unpacking arcs/files.tar 1 file"
$TIME_CMD tar -C out -xf arcs/files.tar files/file50
rm -rf out/*
echo "Unpacking arcs/files.tar"
$TIME_CMD tar -C out -xf arcs/files.tar
rm -rf out/*


echo
echo "Creating arcs/files.zip"
$TIME_CMD zip -rq -0 arcs/files.zip files
echo "Unpacking arcs/files.zip 1 file"
$TIME_CMD unzip -q arcs/files.zip  files/file50 -d out
rm -rf out/*
echo "Unpacking arcs/files.zip"
$TIME_CMD unzip -q arcs/files.zip -d out 
rm -rf out/*

echo
echo "Creating arcs/files.7z"
$TIME_CMD 7za a -mx=0 arcs/files.7z files > /dev/null
echo "Unpacking arcs/files.7z 1 file"
$TIME_CMD 7za x -oout arcs/files.7z files/file50 > /dev/null 
rm -rf out/*
echo "Unpacking arcs/files.7z"
$TIME_CMD 7za x -oout arcs/files.7z  > /dev/null
rm -rf out/*
