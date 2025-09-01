#! /bin/bash

# analyze log run in host 
FILE=$1
grep -oE '= [0-9]+\.[0-9]+ s' $FILE | awk -F' ' '{print $2}' | awk -F. '{print $1}' | sort -nu 
# grep -oE '= [0-9]+\.[0-9]+ s' $FILE | sort -nu | awk -F. '{print $1}' | sed 's/ //g'
