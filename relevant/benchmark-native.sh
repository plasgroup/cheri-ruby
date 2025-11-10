#!/bin/sh 
# in cheri-ruby/build  

# # check if libyaml is installed
# pkg64c list | grep libyaml > /dev/null 2>&1
# if [ $? -ne 0 ]; then
#   echo "libyaml package is not installed. Please install it before running this script." >&2
#   exit 1
# fi

# pkg64 list | grep ruby-gems > /dev/null 2>&1
# if [ $? -ne 0 ]; then
#   echo "ruby-gems package is not installed. Please install it before running this script." >&2
#   exit 1
# fi

mkdir benchmark-results

# compile 
make clean
make 
make miniruby

# test 
make btest > benchmark-results/btest-native.txt 2> benchmark-results/btest-native-err.txt
make test-all > benchmark-results/test-all-native.txt 2> benchmark-results/test-all-native-err.txt

# benchmark
# make -n benchmark > /dev/null 2>&1
# if [ $? -ne 0 ]; then
#   echo "Benchmark target is not available. Please ensure that the benchmark suite is included." >&2
#   exit 1
# else 

make benchmark > benchmark-results/benchmark-native.txt 2> benchmark-results/benchmark-native-err.txt
# if 

## gc bench
ls ../benchmark/gc/ | while IFS= read -r l; do 
	GCBENCH_ITEM=$(echo $l | awk -F. '{print $1}')
	make gcbench GCBENCH_ITEM=$GCBENCH_ITEM > benchmark-results/gcbench-native-$GCBENCH_ITEM.txt 2> benchmark-results/gcbench-native-$GCBENCH_ITEM-err.txt
done 

echo "Benchmarking completed. Results are stored in the benchmark-results directory."
echo "Benchmarking completed. Results are stored in the benchmark-results directory." > benchmark-results/summary-native.txt
