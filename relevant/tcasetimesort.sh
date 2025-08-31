#! /bin/bash

# analyze log run in host 
FILE=$1
grep -oE '[0-9]+\.' $FILE | sort -nu | awk -F. '{print $1}'
