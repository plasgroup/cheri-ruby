reproducing the results for programming 2026
===

# 1 install cheri
follow steps in https://github.com/plasgroup/wiki/blob/main/tips/cheri-related/cheri-setup.md

# 2 clone ruby
clone the ruby for cheri tagged "programming26": https://github.com/plasgroup/cheri-ruby/tree/programming26

# 3 cross compile ruby
follow the steps:
## configure
```sh
$ ./autogen.sh
$ mkdir build && cd build
$ ../configure CC=/path-to-cheri/src/output/sdk/bin/clang \
	LD=/path-to-cheri/src/output/sdk/bin/ld.lld \
	AR=/path-to-cheri/src/output/sdk/bin/llvm-ar \
	AS=/path-to-cheri/src/output/sdk/bin/llvm-as \
	CXX=/path-to-cheri/src/output/sdk/bin/clang++ \
	NM=/path-to-cheri/src/output/sdk/bin/llvm-nm \
	OBJCOPY=/path-to-cheri/src/output/sdk/bin/llvm-objcopy \
	OBJDUMP=/path-to-cheri/src/output/sdk/bin/llvm-objdump \
	RANLIB=/path-to-cheri/src/output/sdk/bin/llvm-ranlib \
	STRIP=/path-to-cheri/src/output/sdk/bin/llvm-strip \
	CFLAGS="-target riscv64-unknown-freebsd --sysroot=/path-to-cheri/src/output/rootfs-riscv64-purecap -mno-relax -march=rv64gcxcheri -mabi=l64pc128d -Wcheri -I/path-to-cheri/src/output/rootfs-riscv64-purecap/usr/include" \
	LDFLAGS="-target riscv64-unknown-freebsd --sysroot=/path-to-cheri/src/output/rootfs-riscv64-purecap -fuse-ld=lld -mno-relax -march=rv64gcxcheri -mabi=l64pc128d -lpthread -Wl,--gdb-index" \
	CXXFLAGS="-target riscv64-unknown-freebsd --sysroot=/path-to-cheri/src/output/rootfs-riscv64-purecap -mno-relax -march=rv64gcxcheri -mabi=l64pc128d -Wcheri -std=c++17 -I/path-to-cheri/src/output/rootfs-riscv64-purecap/usr/include/c++/v1" \
	--build=x86_64-pc-linux-gnu \
	--host=riscv64-unknown-freebsd \
	--target=riscv64-unknown-freebsd \
	--with-opt-dir="/path-to-cheri/src/output/rootfs-riscv64-purecap/usr" \
	--prefix="/path-to-cheri/src/output/rootfs-riscv64-purecap/.rubies/ruby-master" \
	--with-thread="pthread" \
	--enable-mkmf-verbose \
	--with-destdir="/path-to-cheri/src/output/rootfs-riscv64-purecap/.rubies/ruby-master" \
	--enable-debug-env \
	optflags="-O0 -fno-omit-frame-pointer"
```
## compile
```sh
$ make
$ make miniruby
```

# 4 start cheri
```sh
$ /path-to-cheri/cheribuild/cheribuild.py run-riscv64-purecap -q
```

# 5 transfer to emulator
```sh
$ scp -r -P 10202 ruby-dir/ root@localhost:/root/ # 10202 == default port
```

# 6 run tests
```sh
$ cd path/to/build/
# basic test
$ ./miniruby ../basictest/test.rb
# bootstrap test
# need to set timeout to a greater value as emulator is slow
# change line 165 of bootstraptest/runner.rb to > 1800
$ ./ruby --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems" 
# test
$ ./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/ --timeout-scale 10 --worker-timeout=1000
# a failed case might crash the runner
# exclude the failed cases of format Reline::ViInsertTest#test_vi_paste_prev_for_mbchar_by_plural_code_points with:
echo "exclude(:test_vi_paste_prev_for_mbchar_by_plural_code_points, ' ')" >> ../test/.excludes/Reline/ViInsertTest.rb
```
