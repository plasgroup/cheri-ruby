#!/bin/sh

mode=$1
# mode is empty: run not in tdirsfin.txt
# mode=else: run all in tdirsunfin.txt
if [ "x$mode" = "x" ]; then
	echo "Running unprocessed tests only"
	if [ ! -f tdirsfin.txt ]; then
		touch tdirsfin.txt
	fi
	for i in ../test/ruby/*; do
		if grep -q "^$i$" tdirsfin.txt; then
			echo "Skipping ${i} as already processed"
			continue
		fi
		echo "Current!: ${i}"
		echo $i >> tdirsfin.txt
		(./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
		"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
		--excludes-dir=../test/.excludes --name=!/memory_leak/ "$i" --timeout-scale 10 --worker-timeout=1000) || echo "fail!"
		echo "Fin! ${i}"
	done
else
	echo "Running all tests in tdirsunfin.txt"
	if [ ! -f tdirsunfin.txt ]; then
		echo "tdirsunfin.txt not found"
		exit 1
	fi
	for i in ../test/ruby/*; do
		if grep -q "^$i$" tdirsunfin.txt; then
			echo "Current!: ${i}"
			echo $i >> tdirsfin.txt
			(./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
			"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
			--excludes-dir=../test/.excludes --name=!/memory_leak/ "$i" --timeout-scale 10 --worker-timeout=1000) || echo "fail!"
			echo "Fin! ${i}"
		fi
	done
fi

