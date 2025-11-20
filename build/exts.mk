# -*- makefile -*-
V = 0
V0 = $(V:0=)
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@:)
ECHO = $(ECHO1:0=@echo)
old_extensions =
extensions = ext/-test-/RUBY_ALIGNOF/. ext/-test-/abi/. \
	     ext/-test-/arith_seq/beg_len_step/. \
	     ext/-test-/arith_seq/extract/. ext/-test-/array/concat/. \
	     ext/-test-/array/resize/. ext/-test-/asan/. \
	     ext/-test-/bignum/. ext/-test-/bug-14834/. \
	     ext/-test-/bug-3571/. ext/-test-/bug-5832/. \
	     ext/-test-/bug_reporter/. ext/-test-/class/. \
	     ext/-test-/cxxanyargs/. ext/-test-/debug/. \
	     ext/-test-/dln/empty/. ext/-test-/econv/. \
	     ext/-test-/ensure_and_callcc/. ext/-test-/enumerator_kw/. \
	     ext/-test-/eval/. ext/-test-/exception/. \
	     ext/-test-/fatal/. ext/-test-/file/. ext/-test-/float/. \
	     ext/-test-/funcall/. ext/-test-/gvl/call_without_gvl/. \
	     ext/-test-/hash/. ext/-test-/integer/. \
	     ext/-test-/iseq_load/. ext/-test-/iter/. \
	     ext/-test-/load/dot.dot/. ext/-test-/load/protect/. \
	     ext/-test-/load/resolve_symbol_resolver/. \
	     ext/-test-/load/resolve_symbol_target/. \
	     ext/-test-/load/stringify_symbols/. \
	     ext/-test-/load/stringify_target/. \
	     ext/-test-/marshal/compat/. \
	     ext/-test-/marshal/internal_ivar/. \
	     ext/-test-/marshal/usr/. ext/-test-/memory_status/. \
	     ext/-test-/memory_view/. ext/-test-/method/. \
	     ext/-test-/notimplement/. ext/-test-/num2int/. \
	     ext/-test-/path_to_class/. ext/-test-/popen_deadlock/. \
	     ext/-test-/postponed_job/. ext/-test-/printf/. \
	     ext/-test-/proc/. ext/-test-/public_header_warnings/. \
	     ext/-test-/random/. ext/-test-/rational/. \
	     ext/-test-/rb_call_super_kw/. ext/-test-/recursion/. \
	     ext/-test-/regexp/. ext/-test-/scan_args/. \
	     ext/-test-/st/foreach/. ext/-test-/st/numhash/. \
	     ext/-test-/st/update/. ext/-test-/string/. \
	     ext/-test-/struct/. ext/-test-/symbol/. \
	     ext/-test-/thread/id/. \
	     ext/-test-/thread/instrumentation/. \
	     ext/-test-/thread/lock_native_thread/. \
	     ext/-test-/thread_fd/. ext/-test-/time/. \
	     ext/-test-/tracepoint/. ext/-test-/typeddata/. \
	     ext/-test-/vm/. ext/-test-/wait/. ext/cgi/escape/. \
	     ext/continuation/. ext/coverage/. ext/date/. ext/digest/. \
	     ext/digest/bubblebabble/. ext/digest/md5/. \
	     ext/digest/rmd160/. ext/digest/sha1/. ext/digest/sha2/. \
	     ext/erb/escape/. ext/etc/. ext/fcntl/. ext/fiddle/. \
	     ext/io/console/. ext/io/nonblock/. ext/io/wait/. \
	     ext/json/. ext/json/generator/. ext/json/parser/. \
	     ext/monitor/. ext/objspace/. ext/openssl/. ext/pathname/. \
	     ext/psych/. ext/pty/. ext/rbconfig/sizeof/. ext/ripper/. \
	     ext/rubyvm/. ext/socket/. ext/stringio/. ext/strscan/. \
	     ext/zlib/. .bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/. \
	     .bundle/gems/debug-1.10.0/ext/debug/. \
	     .bundle/gems/nkf-0.2.0/ext/nkf/. \
	     .bundle/gems/racc-1.8.1/ext/racc/cparse/. \
	     .bundle/gems/rbs-3.8.0/ext/rbs_extension/. \
	     .bundle/gems/syslog-0.2.0/ext/syslog/.
EXTOBJS = dmyext.o
SUBMAKEOPTS = EXTOBJS="$(EXTOBJS) $(EXTENCS)" EXTLIBS="$(EXTLIBS)" \
	      EXTLDFLAGS="$(EXTLDFLAGS)" EXTINITS="$(EXTINITS)" \
	      SHOWFLAGS=
NOTE_MESG = $(RUBY) $(top_srcdir)/tool/lib/colorize.rb skip
NOTE_NAME = $(RUBY) $(top_srcdir)/tool/lib/colorize.rb fail
MESSAGE_BEGIN = @for line in
MESSAGE_END = ; do echo "$$line"; done
cleandirs = ext/win32/. ext/win32ole/.
PLATFORM_DIR = 
RMALL = rm -fr
RMDIRS = rmdir --ignore-fail-on-non-empty -p
RMDIR = rmdir --ignore-fail-on-non-empty
RM = rm -f

all:
static:

clean:
	-$(Q)$(RM) ext/extinit.o
distclean:
	-$(Q)$(RM) ext/extinit.c

all static: ruby
all: $(extensions:/.=/all)
all:
install: $(extensions:/.=/install)
install:
static: $(extensions:/.=/static)
static:
install-so: $(extensions:/.=/install-so)
install-so:
install-rb: $(extensions:/.=/install-rb)
install-rb:
clean: $(extensions:/.=/clean) $(cleandirs:/.=/clean)
distclean: $(extensions:/.=/distclean) $(cleandirs:/.=/distclean)
realclean: $(extensions:/.=/realclean) $(cleandirs:/.=/realclean)
ruby: $(extensions:/.=/all)
ruby: $(EXTOBJS)

ruby:
	$(Q)$(MAKE) $(SUBMAKEOPTS) $@

libencs:
	$(Q)$(MAKE) -f enc.mk V=$(V) MINIRUBY="$(MINIRUBY)" $@
ext/extinit.o:
	$(Q)$(MAKE) V=$(V) EXTINITS="$(EXTINITS)" $@

ext/-test-/RUBY_ALIGNOF/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/all: ext/digest/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/all: ext/digest/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/all: ext/digest/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/all: ext/digest/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/all: ext/digest/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/all: ext/json/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/all: ext/json/all
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/all:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/RUBY_ALIGNOF/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/static: ext/digest/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/static: ext/digest/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/static: ext/digest/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/static: ext/digest/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/static: ext/digest/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/static: ext/json/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/static: ext/json/static
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/static:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/RUBY_ALIGNOF/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/install: ext/digest/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/install: ext/digest/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/install: ext/digest/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/install: ext/digest/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/install: ext/digest/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/install: ext/json/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/install: ext/json/install
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/install:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/RUBY_ALIGNOF/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/install-so: ext/digest/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/install-so: ext/digest/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/install-so: ext/digest/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/install-so: ext/digest/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/install-so: ext/digest/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/install-so: ext/json/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/install-so: ext/json/install-so
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/install-so:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/RUBY_ALIGNOF/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/install-rb: ext/digest/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/install-rb: ext/digest/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/install-rb: ext/digest/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/install-rb: ext/digest/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/install-rb: ext/digest/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/install-rb: ext/json/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/install-rb: ext/json/install-rb
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/install-rb:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/RUBY_ALIGNOF/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/abi/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/beg_len_step/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/arith_seq/extract/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/concat/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/array/resize/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/asan/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bignum/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-14834/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-3571/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug-5832/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/bug_reporter/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/class/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/cxxanyargs/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/debug/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/dln/empty/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/econv/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/ensure_and_callcc/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/enumerator_kw/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/eval/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/exception/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/fatal/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/file/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/float/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/funcall/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/gvl/call_without_gvl/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/hash/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/integer/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iseq_load/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/iter/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/dot.dot/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/protect/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_resolver/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/resolve_symbol_target/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_symbols/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/load/stringify_target/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/compat/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/internal_ivar/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/marshal/usr/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_status/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/memory_view/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/method/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/notimplement/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/num2int/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/path_to_class/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/popen_deadlock/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/postponed_job/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/printf/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/proc/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/public_header_warnings/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/random/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rational/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/rb_call_super_kw/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/recursion/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/regexp/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/scan_args/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/foreach/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/numhash/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/st/update/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/string/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/struct/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/symbol/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/id/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/instrumentation/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread/lock_native_thread/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/thread_fd/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/time/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/tracepoint/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/typeddata/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/vm/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/-test-/wait/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/cgi/escape/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/continuation/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/coverage/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/date/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/clean: ext/digest/bubblebabble/clean ext/digest/md5/clean ext/digest/rmd160/clean ext/digest/sha1/clean ext/digest/sha2/clean
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/bubblebabble/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/md5/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/rmd160/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha1/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/digest/sha2/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/erb/escape/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/etc/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fcntl/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/fiddle/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/console/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/nonblock/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/io/wait/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/clean: ext/json/generator/clean ext/json/parser/clean
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/generator/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/json/parser/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/monitor/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/objspace/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/openssl/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pathname/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/psych/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/pty/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rbconfig/sizeof/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/ripper/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/rubyvm/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/socket/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/stringio/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/strscan/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/zlib/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/debug-1.10.0/ext/debug/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/nkf-0.2.0/ext/nkf/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/racc-1.8.1/ext/racc/cparse/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
.bundle/gems/syslog-0.2.0/ext/syslog/clean:
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
ext/win32/clean:
ext/win32ole/clean:
ext/-test-/RUBY_ALIGNOF/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/abi/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/arith_seq/beg_len_step/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/arith_seq/extract/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/array/concat/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/array/resize/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/asan/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bignum/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-14834/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-3571/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-5832/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug_reporter/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/class/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/cxxanyargs/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/debug/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/dln/empty/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/econv/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/ensure_and_callcc/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/enumerator_kw/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/eval/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/exception/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/fatal/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/file/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/float/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/funcall/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/gvl/call_without_gvl/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/hash/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/integer/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/iseq_load/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/iter/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/dot.dot/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/protect/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/resolve_symbol_resolver/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/resolve_symbol_target/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/stringify_symbols/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/stringify_target/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/compat/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/internal_ivar/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/usr/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/memory_status/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/memory_view/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/method/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/notimplement/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/num2int/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/path_to_class/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/popen_deadlock/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/postponed_job/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/printf/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/proc/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/public_header_warnings/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/random/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/rational/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/rb_call_super_kw/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/recursion/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/regexp/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/scan_args/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/foreach/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/numhash/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/update/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/string/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/struct/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/symbol/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/id/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/instrumentation/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/lock_native_thread/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread_fd/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/time/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/tracepoint/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/typeddata/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/vm/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/wait/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/cgi/escape/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/cgi/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/continuation/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/continuation/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/coverage/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/coverage/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/date/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/date/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/distclean: ext/digest/bubblebabble/distclean ext/digest/md5/distclean ext/digest/rmd160/distclean ext/digest/sha1/distclean ext/digest/sha2/distclean
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/bubblebabble/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/md5/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/rmd160/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/sha1/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/sha2/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/erb/escape/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/erb/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/etc/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/etc/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/fcntl/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/fcntl/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/fiddle/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/fiddle/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/console/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/nonblock/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/wait/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/distclean: ext/json/generator/distclean ext/json/parser/distclean
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/generator/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/parser/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/monitor/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/monitor/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/objspace/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/objspace/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/openssl/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/openssl/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/pathname/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/pathname/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/psych/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/psych/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/pty/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/pty/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/rbconfig/sizeof/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/rbconfig/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/ripper/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/ripper/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/rubyvm/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/rubyvm/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/socket/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/socket/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/stringio/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/stringio/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/strscan/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/strscan/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/zlib/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/zlib/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/bigdecimal-3.1.8/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/debug-1.10.0/ext/debug/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/debug-1.10.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/nkf-0.2.0/ext/nkf/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/nkf-0.2.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/racc-1.8.1/ext/racc/cparse/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/racc-1.8.1/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/rbs-3.8.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/syslog-0.2.0/ext/syslog/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/syslog-0.2.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/win32/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(RM) ext/win32/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/win32ole/distclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(RM) ext/win32ole/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/RUBY_ALIGNOF/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/abi/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/arith_seq/beg_len_step/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/arith_seq/extract/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/array/concat/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/array/resize/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/asan/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bignum/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-14834/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-3571/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug-5832/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/bug_reporter/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/class/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/cxxanyargs/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/debug/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/dln/empty/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/econv/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/ensure_and_callcc/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/enumerator_kw/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/eval/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/exception/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/fatal/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/file/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/float/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/funcall/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/gvl/call_without_gvl/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/hash/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/integer/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/iseq_load/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/iter/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/dot.dot/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/protect/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/resolve_symbol_resolver/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/resolve_symbol_target/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/stringify_symbols/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/load/stringify_target/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/compat/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/internal_ivar/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/marshal/usr/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/memory_status/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/memory_view/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/method/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/notimplement/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/num2int/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/path_to_class/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/popen_deadlock/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/postponed_job/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/printf/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/proc/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/public_header_warnings/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/random/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/rational/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/rb_call_super_kw/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/recursion/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/regexp/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/scan_args/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/foreach/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/numhash/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/st/update/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/string/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/struct/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/symbol/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/id/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/instrumentation/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread/lock_native_thread/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/thread_fd/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/time/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/tracepoint/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/typeddata/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/vm/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/-test-/wait/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/-test-/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/cgi/escape/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/cgi/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/continuation/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/continuation/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/coverage/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/coverage/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/date/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/date/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/realclean: ext/digest/bubblebabble/realclean ext/digest/md5/realclean ext/digest/rmd160/realclean ext/digest/sha1/realclean ext/digest/sha2/realclean
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/bubblebabble/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/md5/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/rmd160/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/sha1/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/digest/sha2/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/digest/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/erb/escape/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/erb/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/etc/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/etc/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/fcntl/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/fcntl/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/fiddle/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/fiddle/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/console/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/nonblock/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/io/wait/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/io/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/realclean: ext/json/generator/realclean ext/json/parser/realclean
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/generator/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/json/parser/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/json/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/monitor/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/monitor/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/objspace/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/objspace/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/openssl/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/openssl/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/pathname/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/pathname/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/psych/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/psych/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/pty/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/pty/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/rbconfig/sizeof/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/rbconfig/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/ripper/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/ripper/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/rubyvm/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/rubyvm/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/socket/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/socket/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/stringio/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/stringio/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/strscan/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/strscan/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/zlib/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) ext/zlib/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/bigdecimal-3.1.8/ext/bigdecimal/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/bigdecimal-3.1.8/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/debug-1.10.0/ext/debug/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/debug-1.10.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/nkf-0.2.0/ext/nkf/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/nkf-0.2.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/racc-1.8.1/ext/racc/cparse/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/racc-1.8.1/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/rbs-3.8.0/ext/rbs_extension/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/rbs-3.8.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
.bundle/gems/syslog-0.2.0/ext/syslog/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(MAKE) -C $(@D) V=$(V) $(@F)
	$(Q)$(RM) .bundle/gems/syslog-0.2.0/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/win32/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(RM) ext/win32/exts.mk
	-$(Q)$(RMDIRS) $(@D)
ext/win32ole/realclean:
	$(ECHO) $(@F)ing $(@D)
	$(Q)$(RM) ext/win32ole/exts.mk
	-$(Q)$(RMDIRS) $(@D)

extso:
	@echo EXTSO=$(EXTSO)

note: note-body
	@$(NOTE_MESG) "*** Fix the problems, then remove these directories and try again if you want."

note-body:: note-header
	@$(NOTE_NAME) "fiddle:"
	$(MESSAGE_BEGIN) \
	"	Could not be configured. It will not be installed." \
	"	/morello-hybrid/src/output/rootfs-aarch64/research/ruby-3.4.1/ext/fiddle/extconf.rb:86: missing libffi. Please install libffi or use --with-libffi-source-dir with libffi source location." \
	"	Check ext/fiddle/mkmf.log for more details." \
	$(MESSAGE_END)
	@$(NOTE_NAME) "psych:"
	$(MESSAGE_BEGIN) \
	"	Could not be configured. It will not be installed." \
	"	Check ext/psych/mkmf.log for more details." \
	$(MESSAGE_END)

note-header:
	@$(NOTE_MESG) "*** Following extensions are not compiled:"


remove-old-extensions: $(old_extensions:/.=/distclean)
