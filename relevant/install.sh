for line in \
"	BASERUBY = /usr/bin/ruby --disable=gems" \
"	CC = /morello/src/output/morello-sdk/bin/clang" \
"	LD = /morello/src/output/morello-sdk/bin/ld.lld" \
"	LDSHARED = /morello/src/output/morello-sdk/bin/clang -shared" \
"	CFLAGS = -target aarch64-unknown-freebsd -march=morello -mabi=purecap -Xclang -morello-vararg=new --sysroot=/morello/src/output/rootfs-morello-purecap -Wcheri -I/morello/src/output/rootfs-morello-purecap/usr/include -mbranch-protection=pac-ret -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fdeclspec  -O0 -fno-omit-frame-pointer -fno-fast-math -ggdb3 -Wall -Wextra -Wextra-tokens -Wdeprecated-declarations -Wdivision-by-zero -Wdiv-by-zero -Wimplicit-function-declaration -Wimplicit-int -Wpointer-arith -Wshorten-64-to-32 -Wwrite-strings -Wold-style-definition -Wmissing-noreturn -Wno-cast-function-type -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wunused-variable -Wmisleading-indentation -Wundef  " \
"	XCFLAGS = -fno-strict-overflow -fvisibility=hidden -fexcess-precision=standard -DRUBY_EXPORT -fPIE -I. -I.ext/include/aarch64-freebsd -I../include -I.. -I../prism -I../enc/unicode/15.0.0 -I/morello/src/output/rootfs-morello-purecap/usr/include  -Dmodular_gc_dir=""" \
"	CPPFLAGS =   " \
"	DLDFLAGS = -target aarch64-unknown-freebsd -march=morello -mabi=purecap -Xclang -morello-vararg=new --sysroot=/morello/src/output/rootfs-morello-purecap -fuse-ld=lld -lpthread -Wl,--gdb-index -Wl,--compress-debug-sections=zlib -L/morello/src/output/rootfs-morello-purecap/usr/lib -Wl,-rpath,/morello/src/output/rootfs-morello-purecap/usr/lib -Wl,-soname,showflags -pie  " \
"	SOLIBS = -lexecinfo -lprocstat -lz -lrt -lrt -ldl -lcrypt -lm -lthr " \
"	LANG = C.UTF-8" \
"	LC_ALL = " \
"	LC_CTYPE = C.UTF-8" \
"	MFLAGS = -n" \
"	RUSTC = rustc" \
"	YJIT_RUSTC_ARGS = --crate-name=yjit --crate-type=staticlib --edition=2021 -g -C lto=thin -C opt-level=3 -C overflow-checks=on '--out-dir=/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/yjit/target/release/' ../yjit/src/lib.rs" \
; do echo "$line"; done
/morello/src/output/morello-sdk/bin/clang --version
echo generating encdb.h
/usr/bin/ruby --disable=gems  ../tool/generic_erb.rb -c -o encdb.h ../template/encdb.h.tmpl ../enc enc
echo generating enc.mk
/usr/bin/ruby --disable=gems  -r./aarch64-freebsd-fake ../enc/make_encmake.rb \
  --builtin-encs="enc/ascii.o enc/us_ascii.o enc/unicode.o enc/utf_8.o" --builtin-transes="enc/trans/newline.o" --module  enc.mk
echo making srcs under enc
make -f enc.mk V="0" UNICODE_HDR_DIR="../enc/unicode/15.0.0" RUBY="/usr/bin/ruby --disable=gems " MINIRUBY="/usr/bin/ruby --disable=gems " -n srcs
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[1]: Nothing to be done for 'srcs'.
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
echo generating transdb.h
/usr/bin/ruby --disable=gems  ../tool/generic_erb.rb -c -o transdb.h ../template/transdb.h.tmpl ../enc/trans enc/trans
echo generating makefiles ext/configure-ext.mk
/usr/bin/mkdir -p ext
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../tool/generic_erb.rb -o ext/configure-ext.mk -c \
    ../template/configure-ext.mk.tmpl --srcdir=".." \
    --miniruby="/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake " --script-args='--dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n"'
make -f ext/configure-ext.mk -n V=0 EXTSTATIC= \
	gnumake=yes MINIRUBY="/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake " \
	EXTLDFLAGS="" srcdir=".."
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/-test-/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/-test-
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/cgi/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/cgi
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/continuation/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/continuation
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/coverage/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/coverage
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/date/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/date
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/digest/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/digest
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/erb/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/erb
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/etc/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/etc
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/fcntl/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/fcntl
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/fiddle/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/fiddle
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/io/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/io
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/json/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/json
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/monitor/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/monitor
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/objspace/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/objspace
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/openssl/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/openssl
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/pathname/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/pathname
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/psych/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/psych
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/pty/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/pty
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/rbconfig/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/rbconfig
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/ripper/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/ripper
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/rubyvm/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/rubyvm
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/socket/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/socket
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/stringio/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/stringio
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/strscan/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/strscan
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/win32
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/win32ole/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/win32ole
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=ext/zlib/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --extstatic  \
	-- configure ext/zlib
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/bigdecimal-3.1.8/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/bigdecimal-3.1.8
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/debug-1.10.0/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/debug-1.10.0
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/nkf-0.2.0/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/nkf-0.2.0
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/racc-1.8.1/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/racc-1.8.1
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/rbs-3.8.0/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/rbs-3.8.0
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../ext/extmk.rb --make='make' \
	--command-output=.bundle/gems/syslog-0.2.0/exts.mk --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="" --make-flags="" --gnumake=yes --extflags="" --make-flags="MINIRUBY='/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake '" --no-extstatic \
	-- configure .bundle/gems/syslog-0.2.0
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
echo generating makefile exts.mk
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../tool/generic_erb.rb -o exts.mk -c \
    ../template/exts.mk.tmpl --gnumake=yes --configure-exts=ext/configure-ext.mk
make -f exts.mk -n libdir="/home/luih/bench/installpure/.rubies/ruby-master/lib" LIBRUBY_EXTS=./.libruby-with-ext.time \
    EXTENCS="dmyenc.o" BASERUBY="/usr/bin/ruby --disable=gems" MINIRUBY="/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake " \
    
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make -C ext/-test-/RUBY_ALIGNOF V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/RUBY_ALIGNOF'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/RUBY_ALIGNOF'
make -C ext/-test-/abi V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/abi'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/abi'
make -C ext/-test-/arith_seq/beg_len_step V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/arith_seq/beg_len_step'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/arith_seq/beg_len_step'
make -C ext/-test-/arith_seq/extract V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/arith_seq/extract'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/arith_seq/extract'
make -C ext/-test-/array/concat V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/array/concat'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/array/concat'
make -C ext/-test-/array/resize V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/array/resize'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/array/resize'
make -C ext/-test-/asan V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/asan'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/asan'
make -C ext/-test-/bignum V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bignum'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bignum'
make -C ext/-test-/bug-14834 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-14834'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-14834'
make -C ext/-test-/bug-3571 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-3571'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-3571'
make -C ext/-test-/bug-5832 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-5832'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug-5832'
make -C ext/-test-/bug_reporter V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug_reporter'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/bug_reporter'
make -C ext/-test-/class V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/class'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/class'
make -C ext/-test-/cxxanyargs V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/cxxanyargs'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/cxxanyargs'
make -C ext/-test-/debug V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/debug'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/debug'
make -C ext/-test-/dln/empty V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/dln/empty'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/dln/empty'
make -C ext/-test-/econv V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/econv'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/econv'
make -C ext/-test-/ensure_and_callcc V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/ensure_and_callcc'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/ensure_and_callcc'
make -C ext/-test-/enumerator_kw V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/enumerator_kw'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/enumerator_kw'
make -C ext/-test-/eval V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/eval'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/eval'
make -C ext/-test-/exception V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/exception'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/exception'
make -C ext/-test-/fatal V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/fatal'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/fatal'
make -C ext/-test-/file V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/file'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/file'
make -C ext/-test-/float V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/float'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/float'
make -C ext/-test-/funcall V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/funcall'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/funcall'
make -C ext/-test-/gvl/call_without_gvl V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/gvl/call_without_gvl'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/gvl/call_without_gvl'
make -C ext/-test-/hash V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/hash'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/hash'
make -C ext/-test-/integer V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/integer'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/integer'
make -C ext/-test-/iseq_load V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/iseq_load'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/iseq_load'
make -C ext/-test-/iter V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/iter'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/iter'
make -C ext/-test-/load/dot.dot V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/dot.dot'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/dot.dot'
make -C ext/-test-/load/protect V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/protect'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/protect'
make -C ext/-test-/load/resolve_symbol_resolver V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/resolve_symbol_resolver'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/resolve_symbol_resolver'
make -C ext/-test-/load/resolve_symbol_target V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/resolve_symbol_target'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/resolve_symbol_target'
make -C ext/-test-/load/stringify_symbols V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/stringify_symbols'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/stringify_symbols'
make -C ext/-test-/load/stringify_target V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/stringify_target'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/load/stringify_target'
make -C ext/-test-/marshal/compat V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/compat'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/compat'
make -C ext/-test-/marshal/internal_ivar V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/internal_ivar'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/internal_ivar'
make -C ext/-test-/marshal/usr V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/usr'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/marshal/usr'
make -C ext/-test-/memory_status V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/memory_status'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/memory_status'
make -C ext/-test-/memory_view V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/memory_view'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/memory_view'
make -C ext/-test-/method V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/method'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/method'
make -C ext/-test-/notimplement V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/notimplement'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/notimplement'
make -C ext/-test-/num2int V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/num2int'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/num2int'
make -C ext/-test-/path_to_class V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/path_to_class'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/path_to_class'
make -C ext/-test-/popen_deadlock V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/popen_deadlock'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/popen_deadlock'
make -C ext/-test-/postponed_job V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/postponed_job'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/postponed_job'
make -C ext/-test-/printf V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/printf'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/printf'
make -C ext/-test-/proc V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/proc'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/proc'
make -C ext/-test-/public_header_warnings V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/public_header_warnings'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/public_header_warnings'
make -C ext/-test-/random V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/random'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/random'
make -C ext/-test-/rational V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/rational'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/rational'
make -C ext/-test-/rb_call_super_kw V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/rb_call_super_kw'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/rb_call_super_kw'
make -C ext/-test-/recursion V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/recursion'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/recursion'
make -C ext/-test-/regexp V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/regexp'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/regexp'
make -C ext/-test-/scan_args V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/scan_args'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/scan_args'
make -C ext/-test-/st/foreach V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/foreach'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/foreach'
make -C ext/-test-/st/numhash V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/numhash'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/numhash'
make -C ext/-test-/st/update V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/update'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/st/update'
make -C ext/-test-/string V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/string'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/string'
make -C ext/-test-/struct V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/struct'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/struct'
make -C ext/-test-/symbol V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/symbol'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/symbol'
make -C ext/-test-/thread/id V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/id'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/id'
make -C ext/-test-/thread/instrumentation V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/instrumentation'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/instrumentation'
make -C ext/-test-/thread/lock_native_thread V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/lock_native_thread'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread/lock_native_thread'
make -C ext/-test-/thread_fd V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread_fd'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/thread_fd'
make -C ext/-test-/time V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/time'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/time'
make -C ext/-test-/tracepoint V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/tracepoint'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/tracepoint'
make -C ext/-test-/typeddata V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/typeddata'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/typeddata'
make -C ext/-test-/vm V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/vm'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/vm'
make -C ext/-test-/wait V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/wait'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/-test-/wait'
make -C ext/cgi/escape V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/cgi/escape'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/cgi/escape'
make -C ext/continuation V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/continuation'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/continuation'
make -C ext/coverage V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/coverage'
make -q do-install-rb-default || echo installing default coverage libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/coverage'
make -C ext/date V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/date'
make -q do-install-rb-default || echo installing default date_core libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/date'
make -C ext/digest V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest'
make -q do-install-rb || echo installing digest libraries
make -q do-install-rb-default || echo installing default digest libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest'
make -C ext/digest/bubblebabble V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/bubblebabble'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/bubblebabble'
make -C ext/digest/md5 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/md5'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/md5'
make -C ext/digest/rmd160 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/rmd160'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/rmd160'
make -C ext/digest/sha1 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/sha1'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/sha1'
make -C ext/digest/sha2 V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/sha2'
make -q do-install-rb-default || echo installing default sha2 libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/digest/sha2'
make -C ext/erb/escape V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/erb/escape'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/erb/escape'
make -C ext/etc V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/etc'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/etc'
make -C ext/fcntl V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/fcntl'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/fcntl'
make -C ext/fiddle V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/fiddle'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/fiddle'
make -C ext/io/console V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/console'
make -q do-install-rb-default || echo installing default console libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/console'
make -C ext/io/nonblock V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/nonblock'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/nonblock'
make -C ext/io/wait V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/wait'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/io/wait'
make -C ext/json V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json'
make -q do-install-rb-default || echo installing default  libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json'
make -C ext/json/generator V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json/generator'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json/generator'
make -C ext/json/parser V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json/parser'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/json/parser'
make -C ext/monitor V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/monitor'
make -q do-install-rb-default || echo installing default monitor libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/monitor'
make -C ext/objspace V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/objspace'
make -q do-install-rb-default || echo installing default objspace libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/objspace'
make -C ext/openssl V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/openssl'
make -q do-install-rb-default || echo installing default openssl libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/openssl'
make -C ext/pathname V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/pathname'
make -q do-install-rb-default || echo installing default pathname libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/pathname'
make -C ext/psych V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/psych'
make -q do-install-rb-default || echo installing default psych libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/psych'
make -C ext/pty V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/pty'
make -q do-install-rb-default || echo installing default pty libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/pty'
make -C ext/rbconfig/sizeof V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/rbconfig/sizeof'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/rbconfig/sizeof'
make -C ext/ripper V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/ripper'
make -q do-install-rb-default || echo installing default ripper libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/ripper'
make -C ext/rubyvm V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/rubyvm'
make -q do-install-rb-default || echo installing default  libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/rubyvm'
make -C ext/socket V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/socket'
make -q do-install-rb-default || echo installing default socket libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/socket'
make -C ext/stringio V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/stringio'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/stringio'
make -C ext/strscan V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/strscan'
make -q do-install-rb-default || echo installing default strscan libraries
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/strscan'
make -C ext/zlib V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/zlib'
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/ext/zlib'
make -C .bundle/gems/bigdecimal-3.1.8/ext/bigdecimal V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../..' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/bigdecimal-3.1.8/lib ../../../../../.bundle/gems/bigdecimal-3.1.8/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal'
make -C .bundle/gems/debug-1.10.0/ext/debug V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/debug-1.10.0/ext/debug'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../..' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/debug-1.10.0/lib ../../../../../.bundle/gems/debug-1.10.0/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/debug-1.10.0/ext/debug'
make -C .bundle/gems/nkf-0.2.0/ext/nkf V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/nkf-0.2.0/ext/nkf'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../..' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/nkf-0.2.0/lib ../../../../../.bundle/gems/nkf-0.2.0/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/nkf-0.2.0/ext/nkf'
make -C .bundle/gems/racc-1.8.1/ext/racc/cparse V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/racc-1.8.1/ext/racc/cparse'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../../..' ../../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../../.bundle/gems/racc-1.8.1/lib ../../../../../../.bundle/gems/racc-1.8.1/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/racc-1.8.1/ext/racc/cparse'
make -C .bundle/gems/rbs-3.8.0/ext/rbs_extension V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/rbs-3.8.0/ext/rbs_extension'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../..' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/rbs-3.8.0/lib ../../../../../.bundle/gems/rbs-3.8.0/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/rbs-3.8.0/ext/rbs_extension'
make -C .bundle/gems/syslog-0.2.0/ext/syslog V=0 all
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/syslog-0.2.0/ext/syslog'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'../../../../..' ../../../../../../tool/ln_sr.rb -q -f -T ../../../../../../.bundle/gems/syslog-0.2.0/lib ../../../../../.bundle/gems/syslog-0.2.0/lib
:
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build/.bundle/gems/syslog-0.2.0/ext/syslog'
make EXTOBJS="dmyext.o dmyenc.o" EXTLIBS="" EXTLDFLAGS="" EXTINITS="" SHOWFLAGS= ruby
make[2]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[2]: 'ruby' is up to date.
make[2]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make -f exts.mk -n RUBY="/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake " top_srcdir=".." note
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../tool/lib/colorize.rb skip "*** Following extensions are not compiled:"
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../tool/lib/colorize.rb fail "fiddle:"
for line in \
"	Could not be configured. It will not be installed." \
"	/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/ext/fiddle/extconf.rb:86: missing libffi. Please install libffi or use --with-libffi-source-dir with libffi source location." \
"	Check ext/fiddle/mkmf.log for more details." \
; do echo "$line"; done
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  ../tool/lib/colorize.rb skip "*** Fix the problems, then remove these directories and try again if you want."
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
echo making enc
make -f enc.mk V="0" UNICODE_HDR_DIR="../enc/unicode/15.0.0" RUBY="/usr/bin/ruby --disable=gems " MINIRUBY="/usr/bin/ruby --disable=gems " -n enc
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[1]: Nothing to be done for 'enc'.
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
echo making trans
make -f enc.mk V="0" UNICODE_HDR_DIR="../enc/unicode/15.0.0" RUBY="/usr/bin/ruby --disable=gems " MINIRUBY="/usr/bin/ruby --disable=gems " -n trans
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[1]: Nothing to be done for 'trans'.
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
echo making encs
make -f enc.mk V="0" UNICODE_HDR_DIR="../enc/unicode/15.0.0" RUBY="/usr/bin/ruby --disable=gems " MINIRUBY="/usr/bin/ruby --disable=gems " -n encs
make[1]: Entering directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
make[1]: Nothing to be done for 'encs'.
make[1]: Leaving directory '/morello/src/output/rootfs-morello-purecap/research/morello-ruby341/build'
:
./config.status --file=-:../template/ruby.pc.in | \
sed -e 's/\$(\([A-Za-z_][A-Za-z0-9_]*\))/${\1}/g' \
    -e 's|^prefix=.*|prefix=/home/luih/bench/installpure/.rubies/ruby-master|' \
    > ruby.tmp.pc
pkg_config=pkg-config && PKG_CONFIG_PATH=. ${pkg_config:-:} --print-errors ruby.tmp
mv -f ruby.tmp.pc ruby-3.4.pc
> .installed.list set MAKE="make"
echo > /dev/null
echo Extracting bundle gem minitest-5.25.4...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/minitest-5.25.4.gem", ".bundle")'
echo Extracting bundle gem power_assert-2.0.5...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/power_assert-2.0.5.gem", ".bundle")'
echo Extracting bundle gem rake-13.2.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/rake-13.2.1.gem", ".bundle")'
echo Extracting bundle gem test-unit-3.6.7...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/test-unit-3.6.7.gem", ".bundle")'
echo Extracting bundle gem rexml-3.4.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/rexml-3.4.0.gem", ".bundle")'
echo Extracting bundle gem rss-0.3.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/rss-0.3.1.gem", ".bundle")'
echo Extracting bundle gem net-ftp-0.3.8...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/net-ftp-0.3.8.gem", ".bundle")'
echo Extracting bundle gem net-imap-0.5.4...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/net-imap-0.5.4.gem", ".bundle")'
echo Extracting bundle gem net-pop-0.1.2...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/net-pop-0.1.2.gem", ".bundle")'
echo Extracting bundle gem net-smtp-0.5.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/net-smtp-0.5.0.gem", ".bundle")'
echo Extracting bundle gem matrix-0.4.2...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/matrix-0.4.2.gem", ".bundle")'
echo Extracting bundle gem prime-0.1.3...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/prime-0.1.3.gem", ".bundle")'
echo Extracting bundle gem rbs-3.8.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/rbs-3.8.0.gem", ".bundle")'
echo Extracting bundle gem typeprof-0.30.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/typeprof-0.30.1.gem", ".bundle")'
echo Extracting bundle gem debug-1.10.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/debug-1.10.0.gem", ".bundle")'
echo Extracting bundle gem racc-1.8.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/racc-1.8.1.gem", ".bundle")'
echo Extracting bundle gem mutex_m-0.3.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/mutex_m-0.3.0.gem", ".bundle")'
echo Extracting bundle gem getoptlong-0.2.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/getoptlong-0.2.1.gem", ".bundle")'
echo Extracting bundle gem base64-0.2.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/base64-0.2.0.gem", ".bundle")'
echo Extracting bundle gem bigdecimal-3.1.8...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/bigdecimal-3.1.8.gem", ".bundle")'
echo Extracting bundle gem observer-0.1.2...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/observer-0.1.2.gem", ".bundle")'
echo Extracting bundle gem abbrev-0.1.2...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/abbrev-0.1.2.gem", ".bundle")'
echo Extracting bundle gem resolv-replace-0.1.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/resolv-replace-0.1.1.gem", ".bundle")'
echo Extracting bundle gem rinda-0.2.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/rinda-0.2.0.gem", ".bundle")'
echo Extracting bundle gem drb-2.2.1...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/drb-2.2.1.gem", ".bundle")'
echo Extracting bundle gem nkf-0.2.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/nkf-0.2.0.gem", ".bundle")'
echo Extracting bundle gem syslog-0.2.0...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/syslog-0.2.0.gem", ".bundle")'
echo Extracting bundle gem csv-3.3.2...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/csv-3.3.2.gem", ".bundle")'
echo Extracting bundle gem repl_type_completor-0.1.9...
/usr/bin/ruby --disable=gems -C ".." \
    -Itool/lib -rbundled_gem \
    -e 'BundledGem.unpack("gems/repl_type_completor-0.1.9.gem", ".bundle")'
echo Generating RDoc documentation
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  "../tool/rdoc-srcdir" --ri --op ".ext/rdoc" --no-force-update  --force-update .
/usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I`cd ../lib; pwd` --disable-gems -r./aarch64-freebsd-fake ../tool/rbinstall.rb --make="make" --dest-dir="/home/luih/bench/installpure/.rubies/ruby-master" --extout=".ext" --ext-build-dir="./ext" --mflags="-n" --make-flags="n" --data-mode=0644 --prog-mode=0755 --installed-list .installed.list --mantype="doc"  --gnumake --install=all --rdoc-output=".ext/rdoc" --html-output=".ext/html"
installing binary commands:         /home/luih/bench/installpure/.rubies/ruby-master/bin
installing base libraries:          /home/luih/bench/installpure/.rubies/ruby-master/lib
installing arch files:              /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/3.4.0/aarch64-freebsd
installing extension objects:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/3.4.0/aarch64-freebsd
installing extension objects:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/site_ruby/3.4.0/aarch64-freebsd
installing extension objects:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/vendor_ruby/3.4.0/aarch64-freebsd
installing extension headers:       /home/luih/bench/installpure/.rubies/ruby-master/include/ruby-3.4.0/aarch64-freebsd
installing extension scripts:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/3.4.0
installing extension scripts:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/site_ruby/3.4.0
installing extension scripts:       /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/vendor_ruby/3.4.0
installing extension headers:       /home/luih/bench/installpure/.rubies/ruby-master/include/ruby-3.4.0/ruby
installing rdoc:                    /home/luih/bench/installpure/.rubies/ruby-master/share/ri/3.4.0/system
installing html-docs:               /home/luih/bench/installpure/.rubies/ruby-master/share/doc/ruby
installing capi-docs:               /home/luih/bench/installpure/.rubies/ruby-master/share/doc/ruby
installing command scripts:         /home/luih/bench/installpure/.rubies/ruby-master/bin
installing library scripts:         /home/luih/bench/installpure/.rubies/ruby-master/lib/ruby/3.4.0
installing common headers:          /home/luih/bench/installpure/.rubies/ruby-master/include/ruby-3.4.0
installing manpages:                /home/luih/bench/installpure/.rubies/ruby-master/share/man/man1
installing default gems from lib:   /var/lib/gems/3.4.0
                                    benchmark 0.4.0
                                    bundler 2.6.2
                                    cgi 0.4.1
                                    delegate 0.4.0
                                    did_you_mean 2.0.0
                                    english 0.8.0
                                    erb 4.0.4
                                    error_highlight 0.7.0
                                    fileutils 1.7.3
                                    find 0.2.0
                                    forwardable 1.3.3
                                    ipaddr 1.2.7
                                    irb 1.14.3
                                    logger 1.6.4
                                    net-http 0.6.0
                                    net-protocol 0.2.2
                                    open-uri 0.5.0
                                    open3 0.2.1
                                    optparse 0.6.0
                                    ostruct 0.6.1
                                    pp 0.6.2
                                    prettyprint 0.2.0
                                    prism 1.2.0
                                    pstore 0.1.4
                                    rdoc 6.10.0
                                    readline 0.0.4
                                    reline 0.6.0
                                    resolv 0.6.0
                                    ruby2_keywords 0.0.5
                                    securerandom 0.4.1
                                    set 1.1.1
                                    shellwords 0.2.2
                                    singleton 0.3.0
                                    syntax_suggest 2.0.2
                                    tempfile 0.3.1
                                    time 0.4.1
                                    timeout 0.4.3
                                    tmpdir 0.3.1
                                    tsort 0.2.0
                                    un 0.3.0
                                    uri 1.0.2
                                    weakref 0.1.3
                                    yaml 0.4.0
installing default gems from ext:   /var/lib/gems/3.4.0
                                    date 3.4.1
                                    digest 3.2.0
                                    etc 1.4.5
                                    fcntl 1.2.0
                                    fiddle 1.1.6
                                    io-console 0.8.0
                                    io-nonblock 0.3.1
                                    io-wait 0.3.1
                                    json 2.9.1
                                    openssl 3.3.0
                                    pathname 0.4.0
                                    psych 5.2.2
                                    stringio 3.1.2
                                    strscan 3.1.2
                                    zlib 3.2.1
installing bundled gems:            /var/lib/gems/3.4.0
                                    minitest 5.25.4
                                    power_assert 2.0.5
                                    rake 13.2.1
                                    test-unit 3.6.7
                                    rexml 3.4.0
                                    rss 0.3.1
                                    net-ftp 0.3.8
                                    net-imap 0.5.4
                                    net-pop 0.1.2
                                    net-smtp 0.5.0
                                    matrix 0.4.2
                                    prime 0.1.3
                                    rbs 3.8.0
                                    typeprof 0.30.1
                                    debug 1.10.0
                                    racc 1.8.1
                                    mutex_m 0.3.0
                                    getoptlong 0.2.1
                                    base64 0.2.0
                                    bigdecimal 3.1.8
                                    observer 0.1.2
                                    abbrev 0.1.2
                                    resolv-replace 0.1.1
                                    rinda 0.2.0
                                    drb 2.2.1
                                    nkf 0.2.0
                                    syslog 0.2.0
                                    csv 3.3.2
                                    repl_type_completor 0.1.9
installing bundled gem cache:       /var/lib/gems/3.4.0/cache
Installed under /home/luih/bench/installpure/.rubies/ruby-master
:
:
:
:
:
:
:
:
