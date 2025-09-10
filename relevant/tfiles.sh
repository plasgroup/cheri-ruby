#!/usr/bin/env bash

# Usage: ./tfiles.sh <input_file>
# Example: ./tfiles.sh tests.log

if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>" >&2
    exit 1
fi

target_dir=../test/
input_file=$1
output_file=tfiles.txt

# Validate inputs
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found" >&2
    exit 1
fi

if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory not found" >&2
    exit 1
fi

# Read input file line by line
while IFS= read -r line; do
    # Process only lines matching pattern
    if [[ "$line" =~ \[.+\]\ (.+)#(.+)(#.*)*\ = ]]; then
# 	No file found for: class TestSprintfComb#"test_format_integer(% #+-0B)"
# test: class TestSprintfComb#"test_format_integer(% 
        test="${BASH_REMATCH[1]}" | sed 's/(/\\(/g; s/)/\\)/g; s/\[/\\[/g; s/\]/\\]/g; s/\+/\\+/g; s/\*/\\*/g; s/\./\\\./g; s/\$/\\\$/g; s/\^/\\^/g; s/\{/\\\{/g; s/\}/\\}/g; s/\|/\\|/g; s/\\/\\\\/g; s/\?/\\?/g; s/\-/\\-/g; s/\&/\\\&/g; s/\!/\\\!/g; s/\%/\\%/g;'
        case_name="${BASH_REMATCH[2]}"
		test="class\ ${test}\ "

		last=""
        if [[ "$test" == *::* ]]; then
            last=${test##*::}
			last="class\ ${last}\ "
        fi

        # 1. Try searching for case
        files=$(egrep -rl -- "$case_name" "$target_dir")
        if [[ -n "$files" ]]; then
            while IFS= read -r file; do
                if egrep -q -- "$last" "$file" || egrep -q -- "$test" "$file"; then
                    echo "$file" 
                    # echo "$file" >> tfiles.txt
                    continue 2
                fi
            done <<< "$files"
        fi

        # 2. Try searching for test
        files=$(egrep -rl -- "$test" "$target_dir")
        if [[ -n "$files" ]] && [ "$(echo "$files" | wc -l)" -eq 1 ]; then
            echo "$files"
            # echo "$files" >> tfiles.txt
            continue
        fi

        # 3. If test has "::", try last element
        if [[ "$test" == *::* ]]; then
            files=$(egrep -rl -- "$last" "$target_dir")
            if [[ -n "$files" ]] && [ "$(echo "$files" | wc -l)" -eq 1 ]; then
                # echo "$files" >> tfiles.txt
                continue
            fi
        fi

        # 4. If still nothing, print to stderr
        echo "No file found for: $test#$case_name" >> tnofindfile.txt 
		echo "test: $test" >> tnofindfile.txt
        echo "case: $case_name" >> tnofindfile.txt
		echo "last: $last" >> tnofindfile.txt
		echo "" >> tnofindfile.txt
    fi
done < "$input_file"

# full=$(egrep -E '^\[.*\] .*#.*' ${LOG} | egrep -oE '\] .*#.*' | sed 's/] //; s/ .*//')
# case=$(echo "$full" | awk -F'#' '{print $2}')
# test=$(echo "$full" | awk -F'#' '{print $1}')
# echo "$test"

# | awk -F' ' '{print $3}' | awk -F'#' '{print $1}'

# while IFS= read -r line; do
  	# res=$(egrep -q '\[.*\] .*#.*' <<< "$line" && echo "$line" | awk -F' ' '{print $3}' | awk -F'#' '{print $1}')
	# echo "$case"
  	# case=$(egrep -q '\[.*\] .*#.*' <<< "$line" && echo "$line" | awk -F' ' '{print $3}' | awk -F'#' '{print $2}')

	# [ -z "$case" ] && continue
	# file=$(egrep -rl ${case} ${DIR})
	# if [ -n "$file" ]; then
	# 	echo "$file" >> tfiles.txt
	# else
	# 	echo "No test file found for case: $case"
	# fi
# done < "$LOG" # | sort -u >> tfiles.txt

# sed -i '/.excludes/d' tfiles.txt
