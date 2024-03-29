#!/bin/bash

if [[ $1 == "" ]]
then
    FILEPATH="./"
else
    LASTLETTER=${1: -1}
    if [[ $LASTLETTER != "/" ]]
    then
        FILEPATH="$1/"
    else
        FILEPATH=$1
    fi
fi

if test -f "$FILEPATH/sample.fastq"
then
    logger -s "Sample FASTQ file already downloaded, skipping..."
else
    wget -q -O "$FILEPATH/sample.fastq" "https://zenodo.org/record/3736457/files/1_control_psbA3_2019_minq7.fastq?download=1" > /dev/null
    echo "Sample FASTQ file downloaded..." >&2
fi