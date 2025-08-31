#! /bin/bash
# run in host 

if [ $# -ne 1 ]; then
	echo "Usage: $0 target_file"
	exit 1
fi

FILE=$1

while read -r num; do
	line=$(awk '$1 > 100' <<< "$num" | xargs -I{} grep -E '{}\.' "$FILE")
	grep -q '\[.*\] ' <<< "$line" && echo "$line" | grep -oE '\] .*#.* =' | sed 's/\] //; s/ =//'
done
