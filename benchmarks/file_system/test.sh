#!/bin/bash


OUTPUTFILE=${1:-.}/test.tmp
COUNT=1000
for FLAGS in  ""  "direct"
do
    for OPERATION in "write" "read"
    do
        echo ---------------------
        for BS in 128k 512k 1M 2M 4M 8M 16M
        do

            if [[ $OPERATION == "read" ]]; then
                COMMAND="dd if=${OUTPUTFILE} of=/dev/null bs=$BS count=$COUNT"
                FLAG_NAME="iflag"
            else
                COMMAND="dd if=/dev/zero of=${OUTPUTFILE} bs=$BS count=$COUNT"
                FLAG_NAME="oflag"
            fi
            if [[ -n $FLAGS ]]; then
                COMMAND="$COMMAND $FLAG_NAME=$FLAGS"
            fi

            LINE=$($COMMAND  2>&1 | awk '/copied/ {print $10, $11}')
            echo "$OPERATION block size $BS $FLAGS: $LINE ($COMMAND)"
        done
    done
done
rm $OUTPUTFILE