#!/bin/bash

# This script splits a csv file into multiple files.
#
# 1. Copy the script file in the same directory as the csv file
# 2. Run sh split.sh filename.csv line_count

FILENAME=$1
HDR=$(head -1 $FILENAME)
split -l $2 $FILENAME xyz
n=1
for f in xyz*
do
     if [ $n -gt 1 ]; then 
          echo $HDR > Part${n}.csv
     fi
     cat $f >> Part${n}.csv
     rm $f
     ((n++))
done
