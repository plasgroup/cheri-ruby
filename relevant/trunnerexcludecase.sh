#!/bin/sh

# TestException#test_too_many_args_in_eval
# exclude(:test_clone_under_gc_compact_stress, 'gets stuck somewhere')
base="../test/.excludes/"
failed="$1"
filename="${base}$(echo "$failed" | awk -F'#' '{print $1}').rb"
casename=$(echo "$failed" | awk -F'#' '{print $2}')
echo "Excluding test: $filename"
echo "Case name: $casename"
echo "exclude(:${casename}, 'gets stuck somewhere')" >> "$filename"
