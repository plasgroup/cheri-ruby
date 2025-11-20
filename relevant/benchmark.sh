#!/bin/sh 
# in build/

mkdir benchmark-results

# test 
# make btest > benchmark-results/btest.txt 2> benchmark-results/btest-err.txt
# make test-all > benchmark-results/test-all.txt 2> benchmark-results/test-all-err.txt

# relace # "hybrid-ruby::/usr/local64/bin/ruby32 --disable=gems -I.ext/common --disable-gem"
# with /path/to/hybrid/miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems --disable-gem"

# benchmark
ruby --disable=gems -rrubygems -I../benchmark/lib ../benchmark/benchmark-driver/exe/benchmark-driver \
	--executables="hybrid-ruby::/usr/local64/bin/ruby32 --disable=gems -I.ext/common --disable-gem" \
	--executables="purecap-ruby::./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems --disable-gem" \
	--output=markdown --output-compare -v $(find ../benchmark -maxdepth 1 -name '' -o -name '**.yml' -o -name '**.rb' | sort) > benchmark-results/benchmark.txt 2> benchmark-results/benchmark-err.txt

## gc bench
ls ../benchmark/gc/ | while IFS= read -r l; do 
	GCBENCH_ITEM=$(echo $l | awk -F. '{print $1}')
	./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems "../benchmark/gc/gcbench.rb" "$GCBENCH_ITEM" > benchmark-results/puregcbench-$GCBENCH_ITEM.txt 2> benchmark-results/puregcbench-$GCBENCH_ITEM-err.txt
	ruby --disable-gems "../benchmark/gc/gcbench.rb" "$GCBENCH_ITEM" > benchmark-results/hybgcbench-$GCBENCH_ITEM.txt 2> benchmark-results/hybgcbench-$GCBENCH_ITEM-err.txt
done 

echo "Benchmarking completed. Results are stored in the benchmark-results directory."
echo "Benchmarking completed. Results are stored in the benchmark-results directory." > benchmark-results/summary.txt
