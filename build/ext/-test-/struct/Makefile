
SHELL = /bin/sh

# V=0 quiet, V=1 verbose.  other values don't work.
V = 1
V0 = $(V:0=)
Q1 = $(V:1=)
Q = $(Q1:0=@)
ECHO1 = $(V:1=@ :)
ECHO = $(ECHO1:0=@ echo)
NULLCMD = :

#### Start of system configuration section. ####
top_srcdir = $(topdir)/..
srcdir = $(top_srcdir)/ext/-test-/struct
topdir = ../../..
hdrdir = $(top_srcdir)/include
arch_hdrdir = $(extout)/include/$(arch)
PATH_SEPARATOR = :
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby
RUBYLIB =
RUBYOPT = -
prefix = $(DESTDIR).
rubysitearchprefix = $(rubylibprefix)/$(sitearch)
rubyarchprefix = $(rubylibprefix)/$(arch)
rubylibprefix = $(libdir)/$(RUBY_BASE_NAME)
exec_prefix = $(prefix)
vendorarchhdrdir = $(vendorhdrdir)/$(sitearch)
sitearchhdrdir = $(sitehdrdir)/$(sitearch)
rubyarchhdrdir = $(extout)/include/$(arch)
vendorhdrdir = $(rubyhdrdir)/vendor_ruby
sitehdrdir = $(rubyhdrdir)/site_ruby
rubyhdrdir = $(top_srcdir)/include
vendorarchdir = $(vendorlibdir)/$(sitearch)
vendorlibdir = $(vendordir)/$(ruby_version)
vendordir = $(rubylibprefix)/vendor_ruby
sitearchdir = $(sitelibdir)/$(sitearch)
sitelibdir = $(sitedir)/$(ruby_version)
sitedir = $(rubylibprefix)/site_ruby
rubyarchdir = $(extout)/$(arch)
rubylibdir = $(extout)/common
sitearchincludedir = $(includedir)/$(sitearch)
archincludedir = $(includedir)/$(arch)
sitearchlibdir = $(libdir)/$(sitearch)
archlibdir = $(libdir)/$(arch)
ridir = $(datarootdir)/$(RI_BASE_NAME)
modular_gc_dir = $(DESTDIR)
mandir = $(datarootdir)/man
localedir = $(datarootdir)/locale
libdir = $(DESTDIR)/morello-hybrid/src/output/rootfs-aarch64/research/ruby-3.4.1/build
psdir = $(docdir)
pdfdir = $(docdir)
dvidir = $(docdir)
htmldir = $(docdir)
infodir = $(datarootdir)/info
docdir = $(datarootdir)/doc/$(PACKAGE)
oldincludedir = $(DESTDIR)/usr/include
includedir = $(prefix)/include
runstatedir = $(localstatedir)/run
localstatedir = $(prefix)/var
sharedstatedir = $(prefix)/com
sysconfdir = $(prefix)/etc
datadir = $(datarootdir)
datarootdir = $(prefix)/share
libexecdir = $(exec_prefix)/libexec
sbindir = $(exec_prefix)/sbin
bindir = $(exec_prefix)/bin
archdir = $(rubyarchdir)
buildlibdir = $(DESTDIR)/morello-hybrid/src/output/rootfs-aarch64/research/ruby-3.4.1/build


CC_WRAPPER = 
CC = /morello-hybrid/src/output/sdk/bin/clang
CXX = /morello-hybrid/src/output/sdk/bin/clang++
LIBRUBY = $(LIBRUBY_A)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -Wl,-rpath,$(libdir) 
LIBRUBYARG_STATIC = -Wl,-rpath,$(libdir) -l$(RUBY_SO_NAME)-static $(MAINLIBS)
empty =
OUTFLAG = -o $(empty)
COUTFLAG = -o $(empty)
CSRCFLAG = $(empty)

RUBY_EXTCONF_H = extconf.h
cflags   = $(hardenflags) -fdeclspec  $(optflags) $(debugflags) $(warnflags)
cxxflags = 
optflags = -O0 -fno-omit-frame-pointer -fno-fast-math
debugflags = -ggdb3
warnflags = -Wall -Wextra -Wextra-tokens -Wdeprecated-declarations -Wdivision-by-zero -Wdiv-by-zero -Wimplicit-function-declaration -Wimplicit-int -Wpointer-arith -Wshorten-64-to-32 -Wwrite-strings -Wold-style-definition -Wmissing-noreturn -Wno-cast-function-type -Wno-constant-logical-operand -Wno-long-long -Wno-missing-field-initializers -Wno-overlength-strings -Wno-parentheses-equality -Wno-self-assign -Wno-tautological-compare -Wno-unused-parameter -Wno-unused-value -Wunused-variable -Wmisleading-indentation -Wundef
cppflags = 
CCDLFLAGS = -fPIC
CFLAGS   = $(CCDLFLAGS) -target aarch64-unknown-freebsd -march=armv8 --sysroot=/morello-hybrid/src/output/rootfs-aarch64 -I/morello-hybrid/src/output/rootfs-aarch64/usr/include $(cflags) $(ARCH_FLAG)
INCFLAGS = -I. -I$(arch_hdrdir) -I$(hdrdir) -I$(srcdir) -I$(topdir) -I$(top_srcdir)
DEFS     = 
CPPFLAGS = -DRUBY_EXTCONF_H=\"$(RUBY_EXTCONF_H)\" -I/morello-hybrid/src/output/rootfs-aarch64/usr/include  $(DEFS) $(cppflags)
CXXFLAGS = $(CCDLFLAGS) -target aarch64-unknown-freebsd -march=armv8 --sysroot=/morello-hybrid/src/output/rootfs-aarch64 -std=c++17 -I/morello-hybrid/src/output/rootfs-aarch64/usr/include/c++/v1 -fdeclspec $(ARCH_FLAG)
ldflags  = -L. -target aarch64-unknown-freebsd -march=armv8 --sysroot=/morello-hybrid/src/output/rootfs-aarch64 -fuse-ld=lld -lpthread -Wl,--gdb-index -fstack-protector-strong -L/morello-hybrid/src/output/rootfs-aarch64/usr/lib -Wl,-rpath,/morello-hybrid/src/output/rootfs-aarch64/usr/lib -rdynamic
dldflags = -target aarch64-unknown-freebsd -march=armv8 --sysroot=/morello-hybrid/src/output/rootfs-aarch64 -fuse-ld=lld -lpthread -Wl,--gdb-index -Wl,--compress-debug-sections=zlib -L/morello-hybrid/src/output/rootfs-aarch64/usr/lib -Wl,-rpath,/morello-hybrid/src/output/rootfs-aarch64/usr/lib -Wl,-soname,$@ 
ARCH_FLAG = 
DLDFLAGS = $(ldflags) $(dldflags) $(ARCH_FLAG)
LDSHARED = $(CC) -shared
LDSHAREDXX = $(CXX) -shared
POSTLINK = :
AR = /morello-hybrid/src/output/sdk/bin/llvm-ar
LD = /morello-hybrid/src/output/sdk/bin/ld.lld
EXEEXT = 

RUBY_INSTALL_NAME = $(RUBY_BASE_NAME)
RUBY_SO_NAME = ruby
RUBYW_INSTALL_NAME = 
RUBY_VERSION_NAME = $(RUBY_BASE_NAME)-$(ruby_version)
RUBYW_BASE_NAME = rubyw
RUBY_BASE_NAME = ruby

arch = aarch64-freebsd
sitearch = $(arch)
ruby_version = 3.4.0
ruby = /usr/bin/ruby --disable=gems -I. -raarch64-freebsd-fake  -I'$(topdir)'
RUBY = $(ruby)
BUILTRUBY = $(topdir)/miniruby
ruby_headers = $(hdrdir)/ruby.h $(hdrdir)/ruby/backward.h $(hdrdir)/ruby/ruby.h $(hdrdir)/ruby/defines.h $(hdrdir)/ruby/missing.h $(hdrdir)/ruby/intern.h $(hdrdir)/ruby/st.h $(hdrdir)/ruby/subst.h $(arch_hdrdir)/ruby/config.h $(RUBY_EXTCONF_H)

RM = rm -f
RM_RF = rm -fr
RMDIRS = rmdir --ignore-fail-on-non-empty -p
MAKEDIRS = /usr/bin/mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp
TOUCH = exit >

#### End of system configuration section. ####

preload = 
EXTSO = 
libpath = . $(topdir) /morello-hybrid/src/output/rootfs-aarch64/usr/lib
LIBPATH = -L. -L$(topdir) -L/morello-hybrid/src/output/rootfs-aarch64/usr/lib -Wl,-rpath,/morello-hybrid/src/output/rootfs-aarch64/usr/lib
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 
DISTCLEANDIRS = 

extout = $(topdir)/.ext
extout_prefix = $(extout)$(target_prefix)/
target_prefix = /-test-
LOCAL_LIBS = 
LIBS =   -lm -lthr  -lc
ORIG_SRCS = data.c duplicate.c init.c len.c member.c
SRCS = $(ORIG_SRCS) 
OBJS = data.o duplicate.o init.o len.o member.o
HDRS = 
LOCAL_HDRS = 
TARGET = struct
TARGET_NAME = struct
TARGET_ENTRY = Init_$(TARGET_NAME)
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

TIMESTAMP_DIR = $(extout)/.timestamp
BINDIR        = $(extout)/bin
RUBYCOMMONDIR = $(extout)/common
RUBYLIBDIR    = $(RUBYCOMMONDIR)$(target_prefix)
RUBYARCHDIR   = $(extout)/$(arch)$(target_prefix)
HDRDIR        = $(extout)/include/ruby$(target_prefix)
ARCHHDRDIR    = $(extout)/include/$(arch)/ruby$(target_prefix)
TARGET_SO_DIR = $(RUBYARCHDIR)/
TARGET_SO     = $(TARGET_SO_DIR)$(DLLIB)
CLEANLIBS     = $(TARGET_SO) false
CLEANOBJS     = $(OBJS) $(OBJS:.o=.bc) $(OBJS:.o=.i) $(OBJS:.o=.s) *.bak
TARGET_SO_DIR_TIMESTAMP = $(TIMESTAMP_DIR)/$(arch)/.-test-.time

all:    install
static: all
.PHONY: all install static install-so install-rb
.PHONY: clean clean-so clean-static clean-rb

clean-static::
clean-rb-default::
clean-rb::
clean-so::
clean: clean-so clean-static clean-rb-default clean-rb
		-$(Q)$(RM_RF) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES) .*.time

distclean-rb-default::
distclean-rb::
distclean-so::
distclean-static::
distclean: clean distclean-so distclean-static distclean-rb-default distclean-rb
		-$(Q)$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log exts.mk
		-$(Q)$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)
		-$(Q)$(RMDIRS) $(DISTCLEANDIRS) 2> /dev/null || true

realclean: distclean
install: install-so install-rb

install-so: $(TARGET_SO)
clean-so::
	-$(Q)$(RM) $(TARGET_SO) $(TARGET_SO_DIR_TIMESTAMP)
	-$(Q)$(RM_RF) $(CLEANLIBS)
	-$(Q)$(RMDIRS) $(TARGET_SO_DIR) 2> /dev/null || true
clean-static::
	-$(Q)$(RM) $(STATIC_LIB)
install-rb: pre-install-rb do-install-rb install-rb-default
install-rb-default: pre-install-rb-default do-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
do-install-rb:
do-install-rb-default:
pre-install-rb-default:
	@$(NULLCMD)
$(TARGET_SO_DIR_TIMESTAMP):
	$(Q) $(MAKEDIRS) $(@D) $(TARGET_SO_DIR)
	$(Q) $(TOUCH) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .mm .cxx .cpp .o .S

.cc.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cc.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.mm.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.mm.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.cxx.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cxx.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.cpp.o:
	$(ECHO) compiling $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.cpp.S:
	$(ECHO) translating $(<)
	$(Q) $(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.c.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.c.S:
	$(ECHO) translating $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

.m.o:
	$(ECHO) compiling $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -c $(CSRCFLAG)$<

.m.S:
	$(ECHO) translating $(<)
	$(Q) $(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) $(COUTFLAG)$@ -S $(CSRCFLAG)$<

$(TARGET_SO): $(OBJS) Makefile $(TARGET_SO_DIR_TIMESTAMP)
	$(ECHO) linking shared-object -test-/$(DLLIB)
	-$(Q)$(RM) $(@)
	$(Q) $(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)
	$(Q) $(POSTLINK)



###
$(OBJS): $(RUBY_EXTCONF_H)

# AUTOGENERATED DEPENDENCIES START
data.o: $(RUBY_EXTCONF_H)
data.o: $(arch_hdrdir)/ruby/config.h
data.o: $(hdrdir)/ruby.h
data.o: $(hdrdir)/ruby/assert.h
data.o: $(hdrdir)/ruby/backward.h
data.o: $(hdrdir)/ruby/backward/2/assume.h
data.o: $(hdrdir)/ruby/backward/2/attributes.h
data.o: $(hdrdir)/ruby/backward/2/bool.h
data.o: $(hdrdir)/ruby/backward/2/inttypes.h
data.o: $(hdrdir)/ruby/backward/2/limits.h
data.o: $(hdrdir)/ruby/backward/2/long_long.h
data.o: $(hdrdir)/ruby/backward/2/stdalign.h
data.o: $(hdrdir)/ruby/backward/2/stdarg.h
data.o: $(hdrdir)/ruby/defines.h
data.o: $(hdrdir)/ruby/intern.h
data.o: $(hdrdir)/ruby/internal/abi.h
data.o: $(hdrdir)/ruby/internal/anyargs.h
data.o: $(hdrdir)/ruby/internal/arithmetic.h
data.o: $(hdrdir)/ruby/internal/arithmetic/char.h
data.o: $(hdrdir)/ruby/internal/arithmetic/double.h
data.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
data.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/int.h
data.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/long.h
data.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
data.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/short.h
data.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
data.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
data.o: $(hdrdir)/ruby/internal/assume.h
data.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
data.o: $(hdrdir)/ruby/internal/attr/artificial.h
data.o: $(hdrdir)/ruby/internal/attr/cold.h
data.o: $(hdrdir)/ruby/internal/attr/const.h
data.o: $(hdrdir)/ruby/internal/attr/constexpr.h
data.o: $(hdrdir)/ruby/internal/attr/deprecated.h
data.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
data.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
data.o: $(hdrdir)/ruby/internal/attr/error.h
data.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
data.o: $(hdrdir)/ruby/internal/attr/forceinline.h
data.o: $(hdrdir)/ruby/internal/attr/format.h
data.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
data.o: $(hdrdir)/ruby/internal/attr/noalias.h
data.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
data.o: $(hdrdir)/ruby/internal/attr/noexcept.h
data.o: $(hdrdir)/ruby/internal/attr/noinline.h
data.o: $(hdrdir)/ruby/internal/attr/nonnull.h
data.o: $(hdrdir)/ruby/internal/attr/noreturn.h
data.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
data.o: $(hdrdir)/ruby/internal/attr/pure.h
data.o: $(hdrdir)/ruby/internal/attr/restrict.h
data.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
data.o: $(hdrdir)/ruby/internal/attr/warning.h
data.o: $(hdrdir)/ruby/internal/attr/weakref.h
data.o: $(hdrdir)/ruby/internal/cast.h
data.o: $(hdrdir)/ruby/internal/compiler_is.h
data.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
data.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
data.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
data.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
data.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
data.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
data.o: $(hdrdir)/ruby/internal/compiler_since.h
data.o: $(hdrdir)/ruby/internal/config.h
data.o: $(hdrdir)/ruby/internal/constant_p.h
data.o: $(hdrdir)/ruby/internal/core.h
data.o: $(hdrdir)/ruby/internal/core/rarray.h
data.o: $(hdrdir)/ruby/internal/core/rbasic.h
data.o: $(hdrdir)/ruby/internal/core/rbignum.h
data.o: $(hdrdir)/ruby/internal/core/rclass.h
data.o: $(hdrdir)/ruby/internal/core/rdata.h
data.o: $(hdrdir)/ruby/internal/core/rfile.h
data.o: $(hdrdir)/ruby/internal/core/rhash.h
data.o: $(hdrdir)/ruby/internal/core/robject.h
data.o: $(hdrdir)/ruby/internal/core/rregexp.h
data.o: $(hdrdir)/ruby/internal/core/rstring.h
data.o: $(hdrdir)/ruby/internal/core/rstruct.h
data.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
data.o: $(hdrdir)/ruby/internal/ctype.h
data.o: $(hdrdir)/ruby/internal/dllexport.h
data.o: $(hdrdir)/ruby/internal/dosish.h
data.o: $(hdrdir)/ruby/internal/error.h
data.o: $(hdrdir)/ruby/internal/eval.h
data.o: $(hdrdir)/ruby/internal/event.h
data.o: $(hdrdir)/ruby/internal/fl_type.h
data.o: $(hdrdir)/ruby/internal/gc.h
data.o: $(hdrdir)/ruby/internal/glob.h
data.o: $(hdrdir)/ruby/internal/globals.h
data.o: $(hdrdir)/ruby/internal/has/attribute.h
data.o: $(hdrdir)/ruby/internal/has/builtin.h
data.o: $(hdrdir)/ruby/internal/has/c_attribute.h
data.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
data.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
data.o: $(hdrdir)/ruby/internal/has/extension.h
data.o: $(hdrdir)/ruby/internal/has/feature.h
data.o: $(hdrdir)/ruby/internal/has/warning.h
data.o: $(hdrdir)/ruby/internal/intern/array.h
data.o: $(hdrdir)/ruby/internal/intern/bignum.h
data.o: $(hdrdir)/ruby/internal/intern/class.h
data.o: $(hdrdir)/ruby/internal/intern/compar.h
data.o: $(hdrdir)/ruby/internal/intern/complex.h
data.o: $(hdrdir)/ruby/internal/intern/cont.h
data.o: $(hdrdir)/ruby/internal/intern/dir.h
data.o: $(hdrdir)/ruby/internal/intern/enum.h
data.o: $(hdrdir)/ruby/internal/intern/enumerator.h
data.o: $(hdrdir)/ruby/internal/intern/error.h
data.o: $(hdrdir)/ruby/internal/intern/eval.h
data.o: $(hdrdir)/ruby/internal/intern/file.h
data.o: $(hdrdir)/ruby/internal/intern/hash.h
data.o: $(hdrdir)/ruby/internal/intern/io.h
data.o: $(hdrdir)/ruby/internal/intern/load.h
data.o: $(hdrdir)/ruby/internal/intern/marshal.h
data.o: $(hdrdir)/ruby/internal/intern/numeric.h
data.o: $(hdrdir)/ruby/internal/intern/object.h
data.o: $(hdrdir)/ruby/internal/intern/parse.h
data.o: $(hdrdir)/ruby/internal/intern/proc.h
data.o: $(hdrdir)/ruby/internal/intern/process.h
data.o: $(hdrdir)/ruby/internal/intern/random.h
data.o: $(hdrdir)/ruby/internal/intern/range.h
data.o: $(hdrdir)/ruby/internal/intern/rational.h
data.o: $(hdrdir)/ruby/internal/intern/re.h
data.o: $(hdrdir)/ruby/internal/intern/ruby.h
data.o: $(hdrdir)/ruby/internal/intern/select.h
data.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
data.o: $(hdrdir)/ruby/internal/intern/signal.h
data.o: $(hdrdir)/ruby/internal/intern/sprintf.h
data.o: $(hdrdir)/ruby/internal/intern/string.h
data.o: $(hdrdir)/ruby/internal/intern/struct.h
data.o: $(hdrdir)/ruby/internal/intern/thread.h
data.o: $(hdrdir)/ruby/internal/intern/time.h
data.o: $(hdrdir)/ruby/internal/intern/variable.h
data.o: $(hdrdir)/ruby/internal/intern/vm.h
data.o: $(hdrdir)/ruby/internal/interpreter.h
data.o: $(hdrdir)/ruby/internal/iterator.h
data.o: $(hdrdir)/ruby/internal/memory.h
data.o: $(hdrdir)/ruby/internal/method.h
data.o: $(hdrdir)/ruby/internal/module.h
data.o: $(hdrdir)/ruby/internal/newobj.h
data.o: $(hdrdir)/ruby/internal/scan_args.h
data.o: $(hdrdir)/ruby/internal/special_consts.h
data.o: $(hdrdir)/ruby/internal/static_assert.h
data.o: $(hdrdir)/ruby/internal/stdalign.h
data.o: $(hdrdir)/ruby/internal/stdbool.h
data.o: $(hdrdir)/ruby/internal/stdckdint.h
data.o: $(hdrdir)/ruby/internal/symbol.h
data.o: $(hdrdir)/ruby/internal/value.h
data.o: $(hdrdir)/ruby/internal/value_type.h
data.o: $(hdrdir)/ruby/internal/variable.h
data.o: $(hdrdir)/ruby/internal/warning_push.h
data.o: $(hdrdir)/ruby/internal/xmalloc.h
data.o: $(hdrdir)/ruby/missing.h
data.o: $(hdrdir)/ruby/ruby.h
data.o: $(hdrdir)/ruby/st.h
data.o: $(hdrdir)/ruby/subst.h
data.o: data.c
duplicate.o: $(RUBY_EXTCONF_H)
duplicate.o: $(arch_hdrdir)/ruby/config.h
duplicate.o: $(hdrdir)/ruby.h
duplicate.o: $(hdrdir)/ruby/assert.h
duplicate.o: $(hdrdir)/ruby/backward.h
duplicate.o: $(hdrdir)/ruby/backward/2/assume.h
duplicate.o: $(hdrdir)/ruby/backward/2/attributes.h
duplicate.o: $(hdrdir)/ruby/backward/2/bool.h
duplicate.o: $(hdrdir)/ruby/backward/2/inttypes.h
duplicate.o: $(hdrdir)/ruby/backward/2/limits.h
duplicate.o: $(hdrdir)/ruby/backward/2/long_long.h
duplicate.o: $(hdrdir)/ruby/backward/2/stdalign.h
duplicate.o: $(hdrdir)/ruby/backward/2/stdarg.h
duplicate.o: $(hdrdir)/ruby/defines.h
duplicate.o: $(hdrdir)/ruby/intern.h
duplicate.o: $(hdrdir)/ruby/internal/abi.h
duplicate.o: $(hdrdir)/ruby/internal/anyargs.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/char.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/double.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/int.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/long.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/short.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
duplicate.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
duplicate.o: $(hdrdir)/ruby/internal/assume.h
duplicate.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
duplicate.o: $(hdrdir)/ruby/internal/attr/artificial.h
duplicate.o: $(hdrdir)/ruby/internal/attr/cold.h
duplicate.o: $(hdrdir)/ruby/internal/attr/const.h
duplicate.o: $(hdrdir)/ruby/internal/attr/constexpr.h
duplicate.o: $(hdrdir)/ruby/internal/attr/deprecated.h
duplicate.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
duplicate.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
duplicate.o: $(hdrdir)/ruby/internal/attr/error.h
duplicate.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
duplicate.o: $(hdrdir)/ruby/internal/attr/forceinline.h
duplicate.o: $(hdrdir)/ruby/internal/attr/format.h
duplicate.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
duplicate.o: $(hdrdir)/ruby/internal/attr/noalias.h
duplicate.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
duplicate.o: $(hdrdir)/ruby/internal/attr/noexcept.h
duplicate.o: $(hdrdir)/ruby/internal/attr/noinline.h
duplicate.o: $(hdrdir)/ruby/internal/attr/nonnull.h
duplicate.o: $(hdrdir)/ruby/internal/attr/noreturn.h
duplicate.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
duplicate.o: $(hdrdir)/ruby/internal/attr/pure.h
duplicate.o: $(hdrdir)/ruby/internal/attr/restrict.h
duplicate.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
duplicate.o: $(hdrdir)/ruby/internal/attr/warning.h
duplicate.o: $(hdrdir)/ruby/internal/attr/weakref.h
duplicate.o: $(hdrdir)/ruby/internal/cast.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
duplicate.o: $(hdrdir)/ruby/internal/compiler_since.h
duplicate.o: $(hdrdir)/ruby/internal/config.h
duplicate.o: $(hdrdir)/ruby/internal/constant_p.h
duplicate.o: $(hdrdir)/ruby/internal/core.h
duplicate.o: $(hdrdir)/ruby/internal/core/rarray.h
duplicate.o: $(hdrdir)/ruby/internal/core/rbasic.h
duplicate.o: $(hdrdir)/ruby/internal/core/rbignum.h
duplicate.o: $(hdrdir)/ruby/internal/core/rclass.h
duplicate.o: $(hdrdir)/ruby/internal/core/rdata.h
duplicate.o: $(hdrdir)/ruby/internal/core/rfile.h
duplicate.o: $(hdrdir)/ruby/internal/core/rhash.h
duplicate.o: $(hdrdir)/ruby/internal/core/robject.h
duplicate.o: $(hdrdir)/ruby/internal/core/rregexp.h
duplicate.o: $(hdrdir)/ruby/internal/core/rstring.h
duplicate.o: $(hdrdir)/ruby/internal/core/rstruct.h
duplicate.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
duplicate.o: $(hdrdir)/ruby/internal/ctype.h
duplicate.o: $(hdrdir)/ruby/internal/dllexport.h
duplicate.o: $(hdrdir)/ruby/internal/dosish.h
duplicate.o: $(hdrdir)/ruby/internal/error.h
duplicate.o: $(hdrdir)/ruby/internal/eval.h
duplicate.o: $(hdrdir)/ruby/internal/event.h
duplicate.o: $(hdrdir)/ruby/internal/fl_type.h
duplicate.o: $(hdrdir)/ruby/internal/gc.h
duplicate.o: $(hdrdir)/ruby/internal/glob.h
duplicate.o: $(hdrdir)/ruby/internal/globals.h
duplicate.o: $(hdrdir)/ruby/internal/has/attribute.h
duplicate.o: $(hdrdir)/ruby/internal/has/builtin.h
duplicate.o: $(hdrdir)/ruby/internal/has/c_attribute.h
duplicate.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
duplicate.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
duplicate.o: $(hdrdir)/ruby/internal/has/extension.h
duplicate.o: $(hdrdir)/ruby/internal/has/feature.h
duplicate.o: $(hdrdir)/ruby/internal/has/warning.h
duplicate.o: $(hdrdir)/ruby/internal/intern/array.h
duplicate.o: $(hdrdir)/ruby/internal/intern/bignum.h
duplicate.o: $(hdrdir)/ruby/internal/intern/class.h
duplicate.o: $(hdrdir)/ruby/internal/intern/compar.h
duplicate.o: $(hdrdir)/ruby/internal/intern/complex.h
duplicate.o: $(hdrdir)/ruby/internal/intern/cont.h
duplicate.o: $(hdrdir)/ruby/internal/intern/dir.h
duplicate.o: $(hdrdir)/ruby/internal/intern/enum.h
duplicate.o: $(hdrdir)/ruby/internal/intern/enumerator.h
duplicate.o: $(hdrdir)/ruby/internal/intern/error.h
duplicate.o: $(hdrdir)/ruby/internal/intern/eval.h
duplicate.o: $(hdrdir)/ruby/internal/intern/file.h
duplicate.o: $(hdrdir)/ruby/internal/intern/hash.h
duplicate.o: $(hdrdir)/ruby/internal/intern/io.h
duplicate.o: $(hdrdir)/ruby/internal/intern/load.h
duplicate.o: $(hdrdir)/ruby/internal/intern/marshal.h
duplicate.o: $(hdrdir)/ruby/internal/intern/numeric.h
duplicate.o: $(hdrdir)/ruby/internal/intern/object.h
duplicate.o: $(hdrdir)/ruby/internal/intern/parse.h
duplicate.o: $(hdrdir)/ruby/internal/intern/proc.h
duplicate.o: $(hdrdir)/ruby/internal/intern/process.h
duplicate.o: $(hdrdir)/ruby/internal/intern/random.h
duplicate.o: $(hdrdir)/ruby/internal/intern/range.h
duplicate.o: $(hdrdir)/ruby/internal/intern/rational.h
duplicate.o: $(hdrdir)/ruby/internal/intern/re.h
duplicate.o: $(hdrdir)/ruby/internal/intern/ruby.h
duplicate.o: $(hdrdir)/ruby/internal/intern/select.h
duplicate.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
duplicate.o: $(hdrdir)/ruby/internal/intern/signal.h
duplicate.o: $(hdrdir)/ruby/internal/intern/sprintf.h
duplicate.o: $(hdrdir)/ruby/internal/intern/string.h
duplicate.o: $(hdrdir)/ruby/internal/intern/struct.h
duplicate.o: $(hdrdir)/ruby/internal/intern/thread.h
duplicate.o: $(hdrdir)/ruby/internal/intern/time.h
duplicate.o: $(hdrdir)/ruby/internal/intern/variable.h
duplicate.o: $(hdrdir)/ruby/internal/intern/vm.h
duplicate.o: $(hdrdir)/ruby/internal/interpreter.h
duplicate.o: $(hdrdir)/ruby/internal/iterator.h
duplicate.o: $(hdrdir)/ruby/internal/memory.h
duplicate.o: $(hdrdir)/ruby/internal/method.h
duplicate.o: $(hdrdir)/ruby/internal/module.h
duplicate.o: $(hdrdir)/ruby/internal/newobj.h
duplicate.o: $(hdrdir)/ruby/internal/scan_args.h
duplicate.o: $(hdrdir)/ruby/internal/special_consts.h
duplicate.o: $(hdrdir)/ruby/internal/static_assert.h
duplicate.o: $(hdrdir)/ruby/internal/stdalign.h
duplicate.o: $(hdrdir)/ruby/internal/stdbool.h
duplicate.o: $(hdrdir)/ruby/internal/stdckdint.h
duplicate.o: $(hdrdir)/ruby/internal/symbol.h
duplicate.o: $(hdrdir)/ruby/internal/value.h
duplicate.o: $(hdrdir)/ruby/internal/value_type.h
duplicate.o: $(hdrdir)/ruby/internal/variable.h
duplicate.o: $(hdrdir)/ruby/internal/warning_push.h
duplicate.o: $(hdrdir)/ruby/internal/xmalloc.h
duplicate.o: $(hdrdir)/ruby/missing.h
duplicate.o: $(hdrdir)/ruby/ruby.h
duplicate.o: $(hdrdir)/ruby/st.h
duplicate.o: $(hdrdir)/ruby/subst.h
duplicate.o: duplicate.c
init.o: $(RUBY_EXTCONF_H)
init.o: $(arch_hdrdir)/ruby/config.h
init.o: $(hdrdir)/ruby.h
init.o: $(hdrdir)/ruby/assert.h
init.o: $(hdrdir)/ruby/backward.h
init.o: $(hdrdir)/ruby/backward/2/assume.h
init.o: $(hdrdir)/ruby/backward/2/attributes.h
init.o: $(hdrdir)/ruby/backward/2/bool.h
init.o: $(hdrdir)/ruby/backward/2/inttypes.h
init.o: $(hdrdir)/ruby/backward/2/limits.h
init.o: $(hdrdir)/ruby/backward/2/long_long.h
init.o: $(hdrdir)/ruby/backward/2/stdalign.h
init.o: $(hdrdir)/ruby/backward/2/stdarg.h
init.o: $(hdrdir)/ruby/defines.h
init.o: $(hdrdir)/ruby/intern.h
init.o: $(hdrdir)/ruby/internal/abi.h
init.o: $(hdrdir)/ruby/internal/anyargs.h
init.o: $(hdrdir)/ruby/internal/arithmetic.h
init.o: $(hdrdir)/ruby/internal/arithmetic/char.h
init.o: $(hdrdir)/ruby/internal/arithmetic/double.h
init.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
init.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/int.h
init.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/long.h
init.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
init.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/short.h
init.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
init.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
init.o: $(hdrdir)/ruby/internal/assume.h
init.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
init.o: $(hdrdir)/ruby/internal/attr/artificial.h
init.o: $(hdrdir)/ruby/internal/attr/cold.h
init.o: $(hdrdir)/ruby/internal/attr/const.h
init.o: $(hdrdir)/ruby/internal/attr/constexpr.h
init.o: $(hdrdir)/ruby/internal/attr/deprecated.h
init.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
init.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
init.o: $(hdrdir)/ruby/internal/attr/error.h
init.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
init.o: $(hdrdir)/ruby/internal/attr/forceinline.h
init.o: $(hdrdir)/ruby/internal/attr/format.h
init.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
init.o: $(hdrdir)/ruby/internal/attr/noalias.h
init.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
init.o: $(hdrdir)/ruby/internal/attr/noexcept.h
init.o: $(hdrdir)/ruby/internal/attr/noinline.h
init.o: $(hdrdir)/ruby/internal/attr/nonnull.h
init.o: $(hdrdir)/ruby/internal/attr/noreturn.h
init.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
init.o: $(hdrdir)/ruby/internal/attr/pure.h
init.o: $(hdrdir)/ruby/internal/attr/restrict.h
init.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
init.o: $(hdrdir)/ruby/internal/attr/warning.h
init.o: $(hdrdir)/ruby/internal/attr/weakref.h
init.o: $(hdrdir)/ruby/internal/cast.h
init.o: $(hdrdir)/ruby/internal/compiler_is.h
init.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
init.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
init.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
init.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
init.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
init.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
init.o: $(hdrdir)/ruby/internal/compiler_since.h
init.o: $(hdrdir)/ruby/internal/config.h
init.o: $(hdrdir)/ruby/internal/constant_p.h
init.o: $(hdrdir)/ruby/internal/core.h
init.o: $(hdrdir)/ruby/internal/core/rarray.h
init.o: $(hdrdir)/ruby/internal/core/rbasic.h
init.o: $(hdrdir)/ruby/internal/core/rbignum.h
init.o: $(hdrdir)/ruby/internal/core/rclass.h
init.o: $(hdrdir)/ruby/internal/core/rdata.h
init.o: $(hdrdir)/ruby/internal/core/rfile.h
init.o: $(hdrdir)/ruby/internal/core/rhash.h
init.o: $(hdrdir)/ruby/internal/core/robject.h
init.o: $(hdrdir)/ruby/internal/core/rregexp.h
init.o: $(hdrdir)/ruby/internal/core/rstring.h
init.o: $(hdrdir)/ruby/internal/core/rstruct.h
init.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
init.o: $(hdrdir)/ruby/internal/ctype.h
init.o: $(hdrdir)/ruby/internal/dllexport.h
init.o: $(hdrdir)/ruby/internal/dosish.h
init.o: $(hdrdir)/ruby/internal/error.h
init.o: $(hdrdir)/ruby/internal/eval.h
init.o: $(hdrdir)/ruby/internal/event.h
init.o: $(hdrdir)/ruby/internal/fl_type.h
init.o: $(hdrdir)/ruby/internal/gc.h
init.o: $(hdrdir)/ruby/internal/glob.h
init.o: $(hdrdir)/ruby/internal/globals.h
init.o: $(hdrdir)/ruby/internal/has/attribute.h
init.o: $(hdrdir)/ruby/internal/has/builtin.h
init.o: $(hdrdir)/ruby/internal/has/c_attribute.h
init.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
init.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
init.o: $(hdrdir)/ruby/internal/has/extension.h
init.o: $(hdrdir)/ruby/internal/has/feature.h
init.o: $(hdrdir)/ruby/internal/has/warning.h
init.o: $(hdrdir)/ruby/internal/intern/array.h
init.o: $(hdrdir)/ruby/internal/intern/bignum.h
init.o: $(hdrdir)/ruby/internal/intern/class.h
init.o: $(hdrdir)/ruby/internal/intern/compar.h
init.o: $(hdrdir)/ruby/internal/intern/complex.h
init.o: $(hdrdir)/ruby/internal/intern/cont.h
init.o: $(hdrdir)/ruby/internal/intern/dir.h
init.o: $(hdrdir)/ruby/internal/intern/enum.h
init.o: $(hdrdir)/ruby/internal/intern/enumerator.h
init.o: $(hdrdir)/ruby/internal/intern/error.h
init.o: $(hdrdir)/ruby/internal/intern/eval.h
init.o: $(hdrdir)/ruby/internal/intern/file.h
init.o: $(hdrdir)/ruby/internal/intern/hash.h
init.o: $(hdrdir)/ruby/internal/intern/io.h
init.o: $(hdrdir)/ruby/internal/intern/load.h
init.o: $(hdrdir)/ruby/internal/intern/marshal.h
init.o: $(hdrdir)/ruby/internal/intern/numeric.h
init.o: $(hdrdir)/ruby/internal/intern/object.h
init.o: $(hdrdir)/ruby/internal/intern/parse.h
init.o: $(hdrdir)/ruby/internal/intern/proc.h
init.o: $(hdrdir)/ruby/internal/intern/process.h
init.o: $(hdrdir)/ruby/internal/intern/random.h
init.o: $(hdrdir)/ruby/internal/intern/range.h
init.o: $(hdrdir)/ruby/internal/intern/rational.h
init.o: $(hdrdir)/ruby/internal/intern/re.h
init.o: $(hdrdir)/ruby/internal/intern/ruby.h
init.o: $(hdrdir)/ruby/internal/intern/select.h
init.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
init.o: $(hdrdir)/ruby/internal/intern/signal.h
init.o: $(hdrdir)/ruby/internal/intern/sprintf.h
init.o: $(hdrdir)/ruby/internal/intern/string.h
init.o: $(hdrdir)/ruby/internal/intern/struct.h
init.o: $(hdrdir)/ruby/internal/intern/thread.h
init.o: $(hdrdir)/ruby/internal/intern/time.h
init.o: $(hdrdir)/ruby/internal/intern/variable.h
init.o: $(hdrdir)/ruby/internal/intern/vm.h
init.o: $(hdrdir)/ruby/internal/interpreter.h
init.o: $(hdrdir)/ruby/internal/iterator.h
init.o: $(hdrdir)/ruby/internal/memory.h
init.o: $(hdrdir)/ruby/internal/method.h
init.o: $(hdrdir)/ruby/internal/module.h
init.o: $(hdrdir)/ruby/internal/newobj.h
init.o: $(hdrdir)/ruby/internal/scan_args.h
init.o: $(hdrdir)/ruby/internal/special_consts.h
init.o: $(hdrdir)/ruby/internal/static_assert.h
init.o: $(hdrdir)/ruby/internal/stdalign.h
init.o: $(hdrdir)/ruby/internal/stdbool.h
init.o: $(hdrdir)/ruby/internal/stdckdint.h
init.o: $(hdrdir)/ruby/internal/symbol.h
init.o: $(hdrdir)/ruby/internal/value.h
init.o: $(hdrdir)/ruby/internal/value_type.h
init.o: $(hdrdir)/ruby/internal/variable.h
init.o: $(hdrdir)/ruby/internal/warning_push.h
init.o: $(hdrdir)/ruby/internal/xmalloc.h
init.o: $(hdrdir)/ruby/missing.h
init.o: $(hdrdir)/ruby/ruby.h
init.o: $(hdrdir)/ruby/st.h
init.o: $(hdrdir)/ruby/subst.h
init.o: init.c
len.o: $(RUBY_EXTCONF_H)
len.o: $(arch_hdrdir)/ruby/config.h
len.o: $(hdrdir)/ruby.h
len.o: $(hdrdir)/ruby/assert.h
len.o: $(hdrdir)/ruby/backward.h
len.o: $(hdrdir)/ruby/backward/2/assume.h
len.o: $(hdrdir)/ruby/backward/2/attributes.h
len.o: $(hdrdir)/ruby/backward/2/bool.h
len.o: $(hdrdir)/ruby/backward/2/inttypes.h
len.o: $(hdrdir)/ruby/backward/2/limits.h
len.o: $(hdrdir)/ruby/backward/2/long_long.h
len.o: $(hdrdir)/ruby/backward/2/stdalign.h
len.o: $(hdrdir)/ruby/backward/2/stdarg.h
len.o: $(hdrdir)/ruby/defines.h
len.o: $(hdrdir)/ruby/intern.h
len.o: $(hdrdir)/ruby/internal/abi.h
len.o: $(hdrdir)/ruby/internal/anyargs.h
len.o: $(hdrdir)/ruby/internal/arithmetic.h
len.o: $(hdrdir)/ruby/internal/arithmetic/char.h
len.o: $(hdrdir)/ruby/internal/arithmetic/double.h
len.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
len.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/int.h
len.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/long.h
len.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
len.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/short.h
len.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
len.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
len.o: $(hdrdir)/ruby/internal/assume.h
len.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
len.o: $(hdrdir)/ruby/internal/attr/artificial.h
len.o: $(hdrdir)/ruby/internal/attr/cold.h
len.o: $(hdrdir)/ruby/internal/attr/const.h
len.o: $(hdrdir)/ruby/internal/attr/constexpr.h
len.o: $(hdrdir)/ruby/internal/attr/deprecated.h
len.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
len.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
len.o: $(hdrdir)/ruby/internal/attr/error.h
len.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
len.o: $(hdrdir)/ruby/internal/attr/forceinline.h
len.o: $(hdrdir)/ruby/internal/attr/format.h
len.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
len.o: $(hdrdir)/ruby/internal/attr/noalias.h
len.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
len.o: $(hdrdir)/ruby/internal/attr/noexcept.h
len.o: $(hdrdir)/ruby/internal/attr/noinline.h
len.o: $(hdrdir)/ruby/internal/attr/nonnull.h
len.o: $(hdrdir)/ruby/internal/attr/noreturn.h
len.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
len.o: $(hdrdir)/ruby/internal/attr/pure.h
len.o: $(hdrdir)/ruby/internal/attr/restrict.h
len.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
len.o: $(hdrdir)/ruby/internal/attr/warning.h
len.o: $(hdrdir)/ruby/internal/attr/weakref.h
len.o: $(hdrdir)/ruby/internal/cast.h
len.o: $(hdrdir)/ruby/internal/compiler_is.h
len.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
len.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
len.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
len.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
len.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
len.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
len.o: $(hdrdir)/ruby/internal/compiler_since.h
len.o: $(hdrdir)/ruby/internal/config.h
len.o: $(hdrdir)/ruby/internal/constant_p.h
len.o: $(hdrdir)/ruby/internal/core.h
len.o: $(hdrdir)/ruby/internal/core/rarray.h
len.o: $(hdrdir)/ruby/internal/core/rbasic.h
len.o: $(hdrdir)/ruby/internal/core/rbignum.h
len.o: $(hdrdir)/ruby/internal/core/rclass.h
len.o: $(hdrdir)/ruby/internal/core/rdata.h
len.o: $(hdrdir)/ruby/internal/core/rfile.h
len.o: $(hdrdir)/ruby/internal/core/rhash.h
len.o: $(hdrdir)/ruby/internal/core/robject.h
len.o: $(hdrdir)/ruby/internal/core/rregexp.h
len.o: $(hdrdir)/ruby/internal/core/rstring.h
len.o: $(hdrdir)/ruby/internal/core/rstruct.h
len.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
len.o: $(hdrdir)/ruby/internal/ctype.h
len.o: $(hdrdir)/ruby/internal/dllexport.h
len.o: $(hdrdir)/ruby/internal/dosish.h
len.o: $(hdrdir)/ruby/internal/error.h
len.o: $(hdrdir)/ruby/internal/eval.h
len.o: $(hdrdir)/ruby/internal/event.h
len.o: $(hdrdir)/ruby/internal/fl_type.h
len.o: $(hdrdir)/ruby/internal/gc.h
len.o: $(hdrdir)/ruby/internal/glob.h
len.o: $(hdrdir)/ruby/internal/globals.h
len.o: $(hdrdir)/ruby/internal/has/attribute.h
len.o: $(hdrdir)/ruby/internal/has/builtin.h
len.o: $(hdrdir)/ruby/internal/has/c_attribute.h
len.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
len.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
len.o: $(hdrdir)/ruby/internal/has/extension.h
len.o: $(hdrdir)/ruby/internal/has/feature.h
len.o: $(hdrdir)/ruby/internal/has/warning.h
len.o: $(hdrdir)/ruby/internal/intern/array.h
len.o: $(hdrdir)/ruby/internal/intern/bignum.h
len.o: $(hdrdir)/ruby/internal/intern/class.h
len.o: $(hdrdir)/ruby/internal/intern/compar.h
len.o: $(hdrdir)/ruby/internal/intern/complex.h
len.o: $(hdrdir)/ruby/internal/intern/cont.h
len.o: $(hdrdir)/ruby/internal/intern/dir.h
len.o: $(hdrdir)/ruby/internal/intern/enum.h
len.o: $(hdrdir)/ruby/internal/intern/enumerator.h
len.o: $(hdrdir)/ruby/internal/intern/error.h
len.o: $(hdrdir)/ruby/internal/intern/eval.h
len.o: $(hdrdir)/ruby/internal/intern/file.h
len.o: $(hdrdir)/ruby/internal/intern/hash.h
len.o: $(hdrdir)/ruby/internal/intern/io.h
len.o: $(hdrdir)/ruby/internal/intern/load.h
len.o: $(hdrdir)/ruby/internal/intern/marshal.h
len.o: $(hdrdir)/ruby/internal/intern/numeric.h
len.o: $(hdrdir)/ruby/internal/intern/object.h
len.o: $(hdrdir)/ruby/internal/intern/parse.h
len.o: $(hdrdir)/ruby/internal/intern/proc.h
len.o: $(hdrdir)/ruby/internal/intern/process.h
len.o: $(hdrdir)/ruby/internal/intern/random.h
len.o: $(hdrdir)/ruby/internal/intern/range.h
len.o: $(hdrdir)/ruby/internal/intern/rational.h
len.o: $(hdrdir)/ruby/internal/intern/re.h
len.o: $(hdrdir)/ruby/internal/intern/ruby.h
len.o: $(hdrdir)/ruby/internal/intern/select.h
len.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
len.o: $(hdrdir)/ruby/internal/intern/signal.h
len.o: $(hdrdir)/ruby/internal/intern/sprintf.h
len.o: $(hdrdir)/ruby/internal/intern/string.h
len.o: $(hdrdir)/ruby/internal/intern/struct.h
len.o: $(hdrdir)/ruby/internal/intern/thread.h
len.o: $(hdrdir)/ruby/internal/intern/time.h
len.o: $(hdrdir)/ruby/internal/intern/variable.h
len.o: $(hdrdir)/ruby/internal/intern/vm.h
len.o: $(hdrdir)/ruby/internal/interpreter.h
len.o: $(hdrdir)/ruby/internal/iterator.h
len.o: $(hdrdir)/ruby/internal/memory.h
len.o: $(hdrdir)/ruby/internal/method.h
len.o: $(hdrdir)/ruby/internal/module.h
len.o: $(hdrdir)/ruby/internal/newobj.h
len.o: $(hdrdir)/ruby/internal/scan_args.h
len.o: $(hdrdir)/ruby/internal/special_consts.h
len.o: $(hdrdir)/ruby/internal/static_assert.h
len.o: $(hdrdir)/ruby/internal/stdalign.h
len.o: $(hdrdir)/ruby/internal/stdbool.h
len.o: $(hdrdir)/ruby/internal/stdckdint.h
len.o: $(hdrdir)/ruby/internal/symbol.h
len.o: $(hdrdir)/ruby/internal/value.h
len.o: $(hdrdir)/ruby/internal/value_type.h
len.o: $(hdrdir)/ruby/internal/variable.h
len.o: $(hdrdir)/ruby/internal/warning_push.h
len.o: $(hdrdir)/ruby/internal/xmalloc.h
len.o: $(hdrdir)/ruby/missing.h
len.o: $(hdrdir)/ruby/ruby.h
len.o: $(hdrdir)/ruby/st.h
len.o: $(hdrdir)/ruby/subst.h
len.o: len.c
member.o: $(RUBY_EXTCONF_H)
member.o: $(arch_hdrdir)/ruby/config.h
member.o: $(hdrdir)/ruby.h
member.o: $(hdrdir)/ruby/assert.h
member.o: $(hdrdir)/ruby/backward.h
member.o: $(hdrdir)/ruby/backward/2/assume.h
member.o: $(hdrdir)/ruby/backward/2/attributes.h
member.o: $(hdrdir)/ruby/backward/2/bool.h
member.o: $(hdrdir)/ruby/backward/2/inttypes.h
member.o: $(hdrdir)/ruby/backward/2/limits.h
member.o: $(hdrdir)/ruby/backward/2/long_long.h
member.o: $(hdrdir)/ruby/backward/2/stdalign.h
member.o: $(hdrdir)/ruby/backward/2/stdarg.h
member.o: $(hdrdir)/ruby/defines.h
member.o: $(hdrdir)/ruby/intern.h
member.o: $(hdrdir)/ruby/internal/abi.h
member.o: $(hdrdir)/ruby/internal/anyargs.h
member.o: $(hdrdir)/ruby/internal/arithmetic.h
member.o: $(hdrdir)/ruby/internal/arithmetic/char.h
member.o: $(hdrdir)/ruby/internal/arithmetic/double.h
member.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
member.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/int.h
member.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/long.h
member.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
member.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/short.h
member.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
member.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
member.o: $(hdrdir)/ruby/internal/assume.h
member.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
member.o: $(hdrdir)/ruby/internal/attr/artificial.h
member.o: $(hdrdir)/ruby/internal/attr/cold.h
member.o: $(hdrdir)/ruby/internal/attr/const.h
member.o: $(hdrdir)/ruby/internal/attr/constexpr.h
member.o: $(hdrdir)/ruby/internal/attr/deprecated.h
member.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
member.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
member.o: $(hdrdir)/ruby/internal/attr/error.h
member.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
member.o: $(hdrdir)/ruby/internal/attr/forceinline.h
member.o: $(hdrdir)/ruby/internal/attr/format.h
member.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
member.o: $(hdrdir)/ruby/internal/attr/noalias.h
member.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
member.o: $(hdrdir)/ruby/internal/attr/noexcept.h
member.o: $(hdrdir)/ruby/internal/attr/noinline.h
member.o: $(hdrdir)/ruby/internal/attr/nonnull.h
member.o: $(hdrdir)/ruby/internal/attr/noreturn.h
member.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
member.o: $(hdrdir)/ruby/internal/attr/pure.h
member.o: $(hdrdir)/ruby/internal/attr/restrict.h
member.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
member.o: $(hdrdir)/ruby/internal/attr/warning.h
member.o: $(hdrdir)/ruby/internal/attr/weakref.h
member.o: $(hdrdir)/ruby/internal/cast.h
member.o: $(hdrdir)/ruby/internal/compiler_is.h
member.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
member.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
member.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
member.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
member.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
member.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
member.o: $(hdrdir)/ruby/internal/compiler_since.h
member.o: $(hdrdir)/ruby/internal/config.h
member.o: $(hdrdir)/ruby/internal/constant_p.h
member.o: $(hdrdir)/ruby/internal/core.h
member.o: $(hdrdir)/ruby/internal/core/rarray.h
member.o: $(hdrdir)/ruby/internal/core/rbasic.h
member.o: $(hdrdir)/ruby/internal/core/rbignum.h
member.o: $(hdrdir)/ruby/internal/core/rclass.h
member.o: $(hdrdir)/ruby/internal/core/rdata.h
member.o: $(hdrdir)/ruby/internal/core/rfile.h
member.o: $(hdrdir)/ruby/internal/core/rhash.h
member.o: $(hdrdir)/ruby/internal/core/robject.h
member.o: $(hdrdir)/ruby/internal/core/rregexp.h
member.o: $(hdrdir)/ruby/internal/core/rstring.h
member.o: $(hdrdir)/ruby/internal/core/rstruct.h
member.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
member.o: $(hdrdir)/ruby/internal/ctype.h
member.o: $(hdrdir)/ruby/internal/dllexport.h
member.o: $(hdrdir)/ruby/internal/dosish.h
member.o: $(hdrdir)/ruby/internal/error.h
member.o: $(hdrdir)/ruby/internal/eval.h
member.o: $(hdrdir)/ruby/internal/event.h
member.o: $(hdrdir)/ruby/internal/fl_type.h
member.o: $(hdrdir)/ruby/internal/gc.h
member.o: $(hdrdir)/ruby/internal/glob.h
member.o: $(hdrdir)/ruby/internal/globals.h
member.o: $(hdrdir)/ruby/internal/has/attribute.h
member.o: $(hdrdir)/ruby/internal/has/builtin.h
member.o: $(hdrdir)/ruby/internal/has/c_attribute.h
member.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
member.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
member.o: $(hdrdir)/ruby/internal/has/extension.h
member.o: $(hdrdir)/ruby/internal/has/feature.h
member.o: $(hdrdir)/ruby/internal/has/warning.h
member.o: $(hdrdir)/ruby/internal/intern/array.h
member.o: $(hdrdir)/ruby/internal/intern/bignum.h
member.o: $(hdrdir)/ruby/internal/intern/class.h
member.o: $(hdrdir)/ruby/internal/intern/compar.h
member.o: $(hdrdir)/ruby/internal/intern/complex.h
member.o: $(hdrdir)/ruby/internal/intern/cont.h
member.o: $(hdrdir)/ruby/internal/intern/dir.h
member.o: $(hdrdir)/ruby/internal/intern/enum.h
member.o: $(hdrdir)/ruby/internal/intern/enumerator.h
member.o: $(hdrdir)/ruby/internal/intern/error.h
member.o: $(hdrdir)/ruby/internal/intern/eval.h
member.o: $(hdrdir)/ruby/internal/intern/file.h
member.o: $(hdrdir)/ruby/internal/intern/hash.h
member.o: $(hdrdir)/ruby/internal/intern/io.h
member.o: $(hdrdir)/ruby/internal/intern/load.h
member.o: $(hdrdir)/ruby/internal/intern/marshal.h
member.o: $(hdrdir)/ruby/internal/intern/numeric.h
member.o: $(hdrdir)/ruby/internal/intern/object.h
member.o: $(hdrdir)/ruby/internal/intern/parse.h
member.o: $(hdrdir)/ruby/internal/intern/proc.h
member.o: $(hdrdir)/ruby/internal/intern/process.h
member.o: $(hdrdir)/ruby/internal/intern/random.h
member.o: $(hdrdir)/ruby/internal/intern/range.h
member.o: $(hdrdir)/ruby/internal/intern/rational.h
member.o: $(hdrdir)/ruby/internal/intern/re.h
member.o: $(hdrdir)/ruby/internal/intern/ruby.h
member.o: $(hdrdir)/ruby/internal/intern/select.h
member.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
member.o: $(hdrdir)/ruby/internal/intern/signal.h
member.o: $(hdrdir)/ruby/internal/intern/sprintf.h
member.o: $(hdrdir)/ruby/internal/intern/string.h
member.o: $(hdrdir)/ruby/internal/intern/struct.h
member.o: $(hdrdir)/ruby/internal/intern/thread.h
member.o: $(hdrdir)/ruby/internal/intern/time.h
member.o: $(hdrdir)/ruby/internal/intern/variable.h
member.o: $(hdrdir)/ruby/internal/intern/vm.h
member.o: $(hdrdir)/ruby/internal/interpreter.h
member.o: $(hdrdir)/ruby/internal/iterator.h
member.o: $(hdrdir)/ruby/internal/memory.h
member.o: $(hdrdir)/ruby/internal/method.h
member.o: $(hdrdir)/ruby/internal/module.h
member.o: $(hdrdir)/ruby/internal/newobj.h
member.o: $(hdrdir)/ruby/internal/scan_args.h
member.o: $(hdrdir)/ruby/internal/special_consts.h
member.o: $(hdrdir)/ruby/internal/static_assert.h
member.o: $(hdrdir)/ruby/internal/stdalign.h
member.o: $(hdrdir)/ruby/internal/stdbool.h
member.o: $(hdrdir)/ruby/internal/stdckdint.h
member.o: $(hdrdir)/ruby/internal/symbol.h
member.o: $(hdrdir)/ruby/internal/value.h
member.o: $(hdrdir)/ruby/internal/value_type.h
member.o: $(hdrdir)/ruby/internal/variable.h
member.o: $(hdrdir)/ruby/internal/warning_push.h
member.o: $(hdrdir)/ruby/internal/xmalloc.h
member.o: $(hdrdir)/ruby/missing.h
member.o: $(hdrdir)/ruby/ruby.h
member.o: $(hdrdir)/ruby/st.h
member.o: $(hdrdir)/ruby/subst.h
member.o: member.c
# AUTOGENERATED DEPENDENCIES END
