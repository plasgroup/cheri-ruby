
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
srcdir = $(top_srcdir)/ext/ripper
topdir = ../..
hdrdir = $(top_srcdir)/include
arch_hdrdir = $(extout)/include/$(arch)
PATH_SEPARATOR = :
VPATH = $(srcdir):$(arch_hdrdir)/ruby:$(hdrdir)/ruby:$(topdir):$(top_srcdir)
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

CLEANFILES = mkmf.log ripper.E ripper.output y.output .eventids2-check
DISTCLEANFILES = ripper.y ripper.c eventids1.c eventids1.h eventids2table.c ripper_init.c
DISTCLEANDIRS = 

extout = $(topdir)/.ext
extout_prefix = $(extout)$(target_prefix)/
target_prefix = 
LOCAL_LIBS = 
LIBS =   -lm -lthr  -lc
ORIG_SRCS = eventids1.c eventids2.c eventids2table.c ripper.c ripper_init.c
SRCS = $(ORIG_SRCS) eventids1.c eventids2.c ripper.c ripper_init.c
OBJS = eventids1.o eventids2.o ripper.o ripper_init.o
HDRS = $(srcdir)/eventids1.h $(srcdir)/eventids2.h $(srcdir)/ripper_init.h
LOCAL_HDRS = 
TARGET = ripper
TARGET_NAME = ripper
TARGET_ENTRY = Init_$(TARGET_NAME)
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = $(TARGET).a

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
TARGET_SO_DIR_TIMESTAMP = $(TIMESTAMP_DIR)/$(arch)/.time

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
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
do-install-rb-default: $(RUBYLIBDIR)/ripper/core.rb
$(RUBYLIBDIR)/ripper/core.rb: $(srcdir)/lib/ripper/core.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
	$(Q) $(COPY) $(srcdir)/lib/ripper/core.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/ripper/core.rb
do-install-rb-default: $(RUBYLIBDIR)/ripper/filter.rb
$(RUBYLIBDIR)/ripper/filter.rb: $(srcdir)/lib/ripper/filter.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
	$(Q) $(COPY) $(srcdir)/lib/ripper/filter.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/ripper/filter.rb
do-install-rb-default: $(RUBYLIBDIR)/ripper/lexer.rb
$(RUBYLIBDIR)/ripper/lexer.rb: $(srcdir)/lib/ripper/lexer.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
	$(Q) $(COPY) $(srcdir)/lib/ripper/lexer.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/ripper/lexer.rb
do-install-rb-default: $(RUBYLIBDIR)/ripper/sexp.rb
$(RUBYLIBDIR)/ripper/sexp.rb: $(srcdir)/lib/ripper/sexp.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
	$(Q) $(COPY) $(srcdir)/lib/ripper/sexp.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/ripper/sexp.rb
pre-install-rb-default: $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
do-install-rb-default: $(RUBYLIBDIR)/ripper.rb
$(RUBYLIBDIR)/ripper.rb: $(srcdir)/lib/ripper.rb $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	$(Q) $(COPY) $(srcdir)/lib/ripper.rb $(@D)
clean-rb-default::
	-$(Q)$(RM) $(RUBYLIBDIR)/ripper.rb
pre-install-rb-default:
	$(Q1:0=@$(MAKE) -q do-install-rb-default || )$(ECHO1:0=echo) installing default ripper libraries
clean-rb-default::
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR)/ripper 2> /dev/null || true
	-$(Q)$(RM) $(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time
	-$(Q)$(RMDIRS) $(RUBYLIBDIR) 2> /dev/null || true
$(TARGET_SO_DIR_TIMESTAMP):
	$(Q) $(MAKEDIRS) $(@D) $(TARGET_SO_DIR)
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.-.ripper.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)/ripper
	$(Q) $(TOUCH) $@
$(TIMESTAMP_DIR)/.RUBYCOMMONDIR.time:
	$(Q) $(MAKEDIRS) $(@D) $(RUBYLIBDIR)
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
	$(ECHO) linking shared-object $(DLLIB)
	-$(Q)$(RM) $(@)
	$(Q) $(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)
	$(Q) $(POSTLINK)

$(STATIC_LIB): $(OBJS)
	-$(Q)$(RM) $(@)
	$(ECHO) linking static-library $(@)
	$(Q) $(AR) rcD $@ $(OBJS)
	-$(Q)/morello-hybrid/src/output/sdk/bin/llvm-ranlib $(@) 2> /dev/null || true

###
$(OBJS): $(RUBY_EXTCONF_H)

.SUFFIXES: .y .c

GEN  = $(srcdir)/tools/generate.rb
SRC1 = $(top_srcdir)/parse.y
SRC2 = $(srcdir)/eventids2.c
BISON = $(BASERUBY) $(top_srcdir)/tool/lrama/exe/lrama

.SUFFIXES: .y

src: ripper.c ripper_init.c eventids1.c eventids1.h eventids2table.c
ripper.c ripper_init.c eventids1.c eventids1.h eventids2table.c: depend

ripper.o: ripper.c

.y.c:
	$(ECHO) compiling compiler $<
	$(Q) $(BISON) -t -v -o$@ - $< < $<

all: check
static: check

ripper.y: $(srcdir)/tools/preproc.rb $(srcdir)/tools/dsl.rb $(top_srcdir)/parse.y $(top_srcdir)/defs/id.def
	$(ECHO) extracting $@ from $(top_srcdir)/parse.y
	$(Q) $(RUBY) $(top_srcdir)/tool/id2token.rb $(top_srcdir)/parse.y | \
	$(RUBY) $(srcdir)/tools/preproc.rb --output=$@ - ripper.y

check: .eventids2-check

.eventids2-check: $(GEN) $(SRC1) $(SRC2)
	$(ECHO) checking $(SRC1) and $(SRC2)
	$(Q) $(RUBY) $(GEN) --mode=check --ids1src=$(SRC1) --ids2src=$(SRC2)
	@exit > $@

eventids1.h: $(GEN) $(srcdir)/tools/dsl.rb $(SRC1)
	$(ECHO) generating $@ from $(SRC1)
	$(Q) $(RUBY) $(GEN) --mode=eventids1_h --ids1src=$(SRC1) --output=$@

eventids1.c: $(GEN) $(srcdir)/tools/dsl.rb $(SRC1)
	$(ECHO) generating $@ from $(SRC1)
	$(Q) $(RUBY) $(GEN) --mode=eventids1 --ids1src=$(SRC1) --output=$@

eventids2table.c: $(GEN) $(srcdir)/tools/dsl.rb $(SRC2)
	$(ECHO) generating $@ from $(SRC2)
	$(Q) $(RUBY) $(GEN) --mode=eventids2table --ids2src=$(SRC2) --output=$@

ripper_init.c: $(srcdir)/ripper_init.c.tmpl ripper.y $(srcdir)/tools/preproc.rb $(top_srcdir)/internal/ruby_parser.h
	$(ECHO) generating $@ from $(srcdir)/ripper_init.c.tmpl
	$(Q) $(RUBY) $(srcdir)/tools/preproc.rb --output=$@ --template=$(srcdir)/ripper_init.c.tmpl $(top_srcdir)/internal/ruby_parser.h

# Entries for Ripper maintainer

preproc: ripper.E
ripper.E: ripper.c
	$(ECHO) preprocessing ripper.c
	$(Q) $(CC) -E $(INCFLAGS) $(CPPFLAGS) $< | $(RUBY) $(srcdir)/tools/strip.rb > $@

# AUTOGENERATED DEPENDENCIES START
eventids1.o: $(RUBY_EXTCONF_H)
eventids1.o: $(arch_hdrdir)/ruby/config.h
eventids1.o: $(hdrdir)/ruby/assert.h
eventids1.o: $(hdrdir)/ruby/backward.h
eventids1.o: $(hdrdir)/ruby/backward/2/assume.h
eventids1.o: $(hdrdir)/ruby/backward/2/attributes.h
eventids1.o: $(hdrdir)/ruby/backward/2/bool.h
eventids1.o: $(hdrdir)/ruby/backward/2/inttypes.h
eventids1.o: $(hdrdir)/ruby/backward/2/limits.h
eventids1.o: $(hdrdir)/ruby/backward/2/long_long.h
eventids1.o: $(hdrdir)/ruby/backward/2/stdalign.h
eventids1.o: $(hdrdir)/ruby/backward/2/stdarg.h
eventids1.o: $(hdrdir)/ruby/defines.h
eventids1.o: $(hdrdir)/ruby/intern.h
eventids1.o: $(hdrdir)/ruby/internal/abi.h
eventids1.o: $(hdrdir)/ruby/internal/anyargs.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/char.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/double.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/int.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/long.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/short.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
eventids1.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
eventids1.o: $(hdrdir)/ruby/internal/assume.h
eventids1.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
eventids1.o: $(hdrdir)/ruby/internal/attr/artificial.h
eventids1.o: $(hdrdir)/ruby/internal/attr/cold.h
eventids1.o: $(hdrdir)/ruby/internal/attr/const.h
eventids1.o: $(hdrdir)/ruby/internal/attr/constexpr.h
eventids1.o: $(hdrdir)/ruby/internal/attr/deprecated.h
eventids1.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
eventids1.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
eventids1.o: $(hdrdir)/ruby/internal/attr/error.h
eventids1.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
eventids1.o: $(hdrdir)/ruby/internal/attr/forceinline.h
eventids1.o: $(hdrdir)/ruby/internal/attr/format.h
eventids1.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
eventids1.o: $(hdrdir)/ruby/internal/attr/noalias.h
eventids1.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
eventids1.o: $(hdrdir)/ruby/internal/attr/noexcept.h
eventids1.o: $(hdrdir)/ruby/internal/attr/noinline.h
eventids1.o: $(hdrdir)/ruby/internal/attr/nonnull.h
eventids1.o: $(hdrdir)/ruby/internal/attr/noreturn.h
eventids1.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
eventids1.o: $(hdrdir)/ruby/internal/attr/pure.h
eventids1.o: $(hdrdir)/ruby/internal/attr/restrict.h
eventids1.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
eventids1.o: $(hdrdir)/ruby/internal/attr/warning.h
eventids1.o: $(hdrdir)/ruby/internal/attr/weakref.h
eventids1.o: $(hdrdir)/ruby/internal/cast.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
eventids1.o: $(hdrdir)/ruby/internal/compiler_since.h
eventids1.o: $(hdrdir)/ruby/internal/config.h
eventids1.o: $(hdrdir)/ruby/internal/constant_p.h
eventids1.o: $(hdrdir)/ruby/internal/core.h
eventids1.o: $(hdrdir)/ruby/internal/core/rarray.h
eventids1.o: $(hdrdir)/ruby/internal/core/rbasic.h
eventids1.o: $(hdrdir)/ruby/internal/core/rbignum.h
eventids1.o: $(hdrdir)/ruby/internal/core/rclass.h
eventids1.o: $(hdrdir)/ruby/internal/core/rdata.h
eventids1.o: $(hdrdir)/ruby/internal/core/rfile.h
eventids1.o: $(hdrdir)/ruby/internal/core/rhash.h
eventids1.o: $(hdrdir)/ruby/internal/core/robject.h
eventids1.o: $(hdrdir)/ruby/internal/core/rregexp.h
eventids1.o: $(hdrdir)/ruby/internal/core/rstring.h
eventids1.o: $(hdrdir)/ruby/internal/core/rstruct.h
eventids1.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
eventids1.o: $(hdrdir)/ruby/internal/ctype.h
eventids1.o: $(hdrdir)/ruby/internal/dllexport.h
eventids1.o: $(hdrdir)/ruby/internal/dosish.h
eventids1.o: $(hdrdir)/ruby/internal/error.h
eventids1.o: $(hdrdir)/ruby/internal/eval.h
eventids1.o: $(hdrdir)/ruby/internal/event.h
eventids1.o: $(hdrdir)/ruby/internal/fl_type.h
eventids1.o: $(hdrdir)/ruby/internal/gc.h
eventids1.o: $(hdrdir)/ruby/internal/glob.h
eventids1.o: $(hdrdir)/ruby/internal/globals.h
eventids1.o: $(hdrdir)/ruby/internal/has/attribute.h
eventids1.o: $(hdrdir)/ruby/internal/has/builtin.h
eventids1.o: $(hdrdir)/ruby/internal/has/c_attribute.h
eventids1.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
eventids1.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
eventids1.o: $(hdrdir)/ruby/internal/has/extension.h
eventids1.o: $(hdrdir)/ruby/internal/has/feature.h
eventids1.o: $(hdrdir)/ruby/internal/has/warning.h
eventids1.o: $(hdrdir)/ruby/internal/intern/array.h
eventids1.o: $(hdrdir)/ruby/internal/intern/bignum.h
eventids1.o: $(hdrdir)/ruby/internal/intern/class.h
eventids1.o: $(hdrdir)/ruby/internal/intern/compar.h
eventids1.o: $(hdrdir)/ruby/internal/intern/complex.h
eventids1.o: $(hdrdir)/ruby/internal/intern/cont.h
eventids1.o: $(hdrdir)/ruby/internal/intern/dir.h
eventids1.o: $(hdrdir)/ruby/internal/intern/enum.h
eventids1.o: $(hdrdir)/ruby/internal/intern/enumerator.h
eventids1.o: $(hdrdir)/ruby/internal/intern/error.h
eventids1.o: $(hdrdir)/ruby/internal/intern/eval.h
eventids1.o: $(hdrdir)/ruby/internal/intern/file.h
eventids1.o: $(hdrdir)/ruby/internal/intern/hash.h
eventids1.o: $(hdrdir)/ruby/internal/intern/io.h
eventids1.o: $(hdrdir)/ruby/internal/intern/load.h
eventids1.o: $(hdrdir)/ruby/internal/intern/marshal.h
eventids1.o: $(hdrdir)/ruby/internal/intern/numeric.h
eventids1.o: $(hdrdir)/ruby/internal/intern/object.h
eventids1.o: $(hdrdir)/ruby/internal/intern/parse.h
eventids1.o: $(hdrdir)/ruby/internal/intern/proc.h
eventids1.o: $(hdrdir)/ruby/internal/intern/process.h
eventids1.o: $(hdrdir)/ruby/internal/intern/random.h
eventids1.o: $(hdrdir)/ruby/internal/intern/range.h
eventids1.o: $(hdrdir)/ruby/internal/intern/rational.h
eventids1.o: $(hdrdir)/ruby/internal/intern/re.h
eventids1.o: $(hdrdir)/ruby/internal/intern/ruby.h
eventids1.o: $(hdrdir)/ruby/internal/intern/select.h
eventids1.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
eventids1.o: $(hdrdir)/ruby/internal/intern/signal.h
eventids1.o: $(hdrdir)/ruby/internal/intern/sprintf.h
eventids1.o: $(hdrdir)/ruby/internal/intern/string.h
eventids1.o: $(hdrdir)/ruby/internal/intern/struct.h
eventids1.o: $(hdrdir)/ruby/internal/intern/thread.h
eventids1.o: $(hdrdir)/ruby/internal/intern/time.h
eventids1.o: $(hdrdir)/ruby/internal/intern/variable.h
eventids1.o: $(hdrdir)/ruby/internal/intern/vm.h
eventids1.o: $(hdrdir)/ruby/internal/interpreter.h
eventids1.o: $(hdrdir)/ruby/internal/iterator.h
eventids1.o: $(hdrdir)/ruby/internal/memory.h
eventids1.o: $(hdrdir)/ruby/internal/method.h
eventids1.o: $(hdrdir)/ruby/internal/module.h
eventids1.o: $(hdrdir)/ruby/internal/newobj.h
eventids1.o: $(hdrdir)/ruby/internal/scan_args.h
eventids1.o: $(hdrdir)/ruby/internal/special_consts.h
eventids1.o: $(hdrdir)/ruby/internal/static_assert.h
eventids1.o: $(hdrdir)/ruby/internal/stdalign.h
eventids1.o: $(hdrdir)/ruby/internal/stdbool.h
eventids1.o: $(hdrdir)/ruby/internal/stdckdint.h
eventids1.o: $(hdrdir)/ruby/internal/symbol.h
eventids1.o: $(hdrdir)/ruby/internal/value.h
eventids1.o: $(hdrdir)/ruby/internal/value_type.h
eventids1.o: $(hdrdir)/ruby/internal/variable.h
eventids1.o: $(hdrdir)/ruby/internal/warning_push.h
eventids1.o: $(hdrdir)/ruby/internal/xmalloc.h
eventids1.o: $(hdrdir)/ruby/missing.h
eventids1.o: $(hdrdir)/ruby/ruby.h
eventids1.o: $(hdrdir)/ruby/st.h
eventids1.o: $(hdrdir)/ruby/subst.h
eventids1.o: eventids1.h
eventids1.o: eventids1.c
eventids1.o: eventids1.h
eventids2.o: $(RUBY_EXTCONF_H)
eventids2.o: $(arch_hdrdir)/ruby/config.h
eventids2.o: $(hdrdir)/ruby/assert.h
eventids2.o: $(hdrdir)/ruby/backward.h
eventids2.o: $(hdrdir)/ruby/backward/2/assume.h
eventids2.o: $(hdrdir)/ruby/backward/2/attributes.h
eventids2.o: $(hdrdir)/ruby/backward/2/bool.h
eventids2.o: $(hdrdir)/ruby/backward/2/inttypes.h
eventids2.o: $(hdrdir)/ruby/backward/2/limits.h
eventids2.o: $(hdrdir)/ruby/backward/2/long_long.h
eventids2.o: $(hdrdir)/ruby/backward/2/stdalign.h
eventids2.o: $(hdrdir)/ruby/backward/2/stdarg.h
eventids2.o: $(hdrdir)/ruby/defines.h
eventids2.o: $(hdrdir)/ruby/encoding.h
eventids2.o: $(hdrdir)/ruby/intern.h
eventids2.o: $(hdrdir)/ruby/internal/abi.h
eventids2.o: $(hdrdir)/ruby/internal/anyargs.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/char.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/double.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/int.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/long.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/short.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
eventids2.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
eventids2.o: $(hdrdir)/ruby/internal/assume.h
eventids2.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
eventids2.o: $(hdrdir)/ruby/internal/attr/artificial.h
eventids2.o: $(hdrdir)/ruby/internal/attr/cold.h
eventids2.o: $(hdrdir)/ruby/internal/attr/const.h
eventids2.o: $(hdrdir)/ruby/internal/attr/constexpr.h
eventids2.o: $(hdrdir)/ruby/internal/attr/deprecated.h
eventids2.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
eventids2.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
eventids2.o: $(hdrdir)/ruby/internal/attr/error.h
eventids2.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
eventids2.o: $(hdrdir)/ruby/internal/attr/forceinline.h
eventids2.o: $(hdrdir)/ruby/internal/attr/format.h
eventids2.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
eventids2.o: $(hdrdir)/ruby/internal/attr/noalias.h
eventids2.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
eventids2.o: $(hdrdir)/ruby/internal/attr/noexcept.h
eventids2.o: $(hdrdir)/ruby/internal/attr/noinline.h
eventids2.o: $(hdrdir)/ruby/internal/attr/nonnull.h
eventids2.o: $(hdrdir)/ruby/internal/attr/noreturn.h
eventids2.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
eventids2.o: $(hdrdir)/ruby/internal/attr/pure.h
eventids2.o: $(hdrdir)/ruby/internal/attr/restrict.h
eventids2.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
eventids2.o: $(hdrdir)/ruby/internal/attr/warning.h
eventids2.o: $(hdrdir)/ruby/internal/attr/weakref.h
eventids2.o: $(hdrdir)/ruby/internal/cast.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
eventids2.o: $(hdrdir)/ruby/internal/compiler_since.h
eventids2.o: $(hdrdir)/ruby/internal/config.h
eventids2.o: $(hdrdir)/ruby/internal/constant_p.h
eventids2.o: $(hdrdir)/ruby/internal/core.h
eventids2.o: $(hdrdir)/ruby/internal/core/rarray.h
eventids2.o: $(hdrdir)/ruby/internal/core/rbasic.h
eventids2.o: $(hdrdir)/ruby/internal/core/rbignum.h
eventids2.o: $(hdrdir)/ruby/internal/core/rclass.h
eventids2.o: $(hdrdir)/ruby/internal/core/rdata.h
eventids2.o: $(hdrdir)/ruby/internal/core/rfile.h
eventids2.o: $(hdrdir)/ruby/internal/core/rhash.h
eventids2.o: $(hdrdir)/ruby/internal/core/robject.h
eventids2.o: $(hdrdir)/ruby/internal/core/rregexp.h
eventids2.o: $(hdrdir)/ruby/internal/core/rstring.h
eventids2.o: $(hdrdir)/ruby/internal/core/rstruct.h
eventids2.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
eventids2.o: $(hdrdir)/ruby/internal/ctype.h
eventids2.o: $(hdrdir)/ruby/internal/dllexport.h
eventids2.o: $(hdrdir)/ruby/internal/dosish.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/coderange.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/ctype.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/encoding.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/pathname.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/re.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/sprintf.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/string.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/symbol.h
eventids2.o: $(hdrdir)/ruby/internal/encoding/transcode.h
eventids2.o: $(hdrdir)/ruby/internal/error.h
eventids2.o: $(hdrdir)/ruby/internal/eval.h
eventids2.o: $(hdrdir)/ruby/internal/event.h
eventids2.o: $(hdrdir)/ruby/internal/fl_type.h
eventids2.o: $(hdrdir)/ruby/internal/gc.h
eventids2.o: $(hdrdir)/ruby/internal/glob.h
eventids2.o: $(hdrdir)/ruby/internal/globals.h
eventids2.o: $(hdrdir)/ruby/internal/has/attribute.h
eventids2.o: $(hdrdir)/ruby/internal/has/builtin.h
eventids2.o: $(hdrdir)/ruby/internal/has/c_attribute.h
eventids2.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
eventids2.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
eventids2.o: $(hdrdir)/ruby/internal/has/extension.h
eventids2.o: $(hdrdir)/ruby/internal/has/feature.h
eventids2.o: $(hdrdir)/ruby/internal/has/warning.h
eventids2.o: $(hdrdir)/ruby/internal/intern/array.h
eventids2.o: $(hdrdir)/ruby/internal/intern/bignum.h
eventids2.o: $(hdrdir)/ruby/internal/intern/class.h
eventids2.o: $(hdrdir)/ruby/internal/intern/compar.h
eventids2.o: $(hdrdir)/ruby/internal/intern/complex.h
eventids2.o: $(hdrdir)/ruby/internal/intern/cont.h
eventids2.o: $(hdrdir)/ruby/internal/intern/dir.h
eventids2.o: $(hdrdir)/ruby/internal/intern/enum.h
eventids2.o: $(hdrdir)/ruby/internal/intern/enumerator.h
eventids2.o: $(hdrdir)/ruby/internal/intern/error.h
eventids2.o: $(hdrdir)/ruby/internal/intern/eval.h
eventids2.o: $(hdrdir)/ruby/internal/intern/file.h
eventids2.o: $(hdrdir)/ruby/internal/intern/hash.h
eventids2.o: $(hdrdir)/ruby/internal/intern/io.h
eventids2.o: $(hdrdir)/ruby/internal/intern/load.h
eventids2.o: $(hdrdir)/ruby/internal/intern/marshal.h
eventids2.o: $(hdrdir)/ruby/internal/intern/numeric.h
eventids2.o: $(hdrdir)/ruby/internal/intern/object.h
eventids2.o: $(hdrdir)/ruby/internal/intern/parse.h
eventids2.o: $(hdrdir)/ruby/internal/intern/proc.h
eventids2.o: $(hdrdir)/ruby/internal/intern/process.h
eventids2.o: $(hdrdir)/ruby/internal/intern/random.h
eventids2.o: $(hdrdir)/ruby/internal/intern/range.h
eventids2.o: $(hdrdir)/ruby/internal/intern/rational.h
eventids2.o: $(hdrdir)/ruby/internal/intern/re.h
eventids2.o: $(hdrdir)/ruby/internal/intern/ruby.h
eventids2.o: $(hdrdir)/ruby/internal/intern/select.h
eventids2.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
eventids2.o: $(hdrdir)/ruby/internal/intern/signal.h
eventids2.o: $(hdrdir)/ruby/internal/intern/sprintf.h
eventids2.o: $(hdrdir)/ruby/internal/intern/string.h
eventids2.o: $(hdrdir)/ruby/internal/intern/struct.h
eventids2.o: $(hdrdir)/ruby/internal/intern/thread.h
eventids2.o: $(hdrdir)/ruby/internal/intern/time.h
eventids2.o: $(hdrdir)/ruby/internal/intern/variable.h
eventids2.o: $(hdrdir)/ruby/internal/intern/vm.h
eventids2.o: $(hdrdir)/ruby/internal/interpreter.h
eventids2.o: $(hdrdir)/ruby/internal/iterator.h
eventids2.o: $(hdrdir)/ruby/internal/memory.h
eventids2.o: $(hdrdir)/ruby/internal/method.h
eventids2.o: $(hdrdir)/ruby/internal/module.h
eventids2.o: $(hdrdir)/ruby/internal/newobj.h
eventids2.o: $(hdrdir)/ruby/internal/scan_args.h
eventids2.o: $(hdrdir)/ruby/internal/special_consts.h
eventids2.o: $(hdrdir)/ruby/internal/static_assert.h
eventids2.o: $(hdrdir)/ruby/internal/stdalign.h
eventids2.o: $(hdrdir)/ruby/internal/stdbool.h
eventids2.o: $(hdrdir)/ruby/internal/stdckdint.h
eventids2.o: $(hdrdir)/ruby/internal/symbol.h
eventids2.o: $(hdrdir)/ruby/internal/value.h
eventids2.o: $(hdrdir)/ruby/internal/value_type.h
eventids2.o: $(hdrdir)/ruby/internal/variable.h
eventids2.o: $(hdrdir)/ruby/internal/warning_push.h
eventids2.o: $(hdrdir)/ruby/internal/xmalloc.h
eventids2.o: $(hdrdir)/ruby/missing.h
eventids2.o: $(hdrdir)/ruby/onigmo.h
eventids2.o: $(hdrdir)/ruby/oniguruma.h
eventids2.o: $(hdrdir)/ruby/ruby.h
eventids2.o: $(hdrdir)/ruby/st.h
eventids2.o: $(hdrdir)/ruby/subst.h
eventids2.o: $(top_srcdir)/internal.h
eventids2.o: $(top_srcdir)/internal/static_assert.h
eventids2.o: $(top_srcdir)/rubyparser.h
eventids2.o: eventids2.c
eventids2.o: eventids2.h
eventids2.o: eventids2table.c
eventids2.o: parse.h
ripper.o: $(RUBY_EXTCONF_H)
ripper.o: $(arch_hdrdir)/ruby/config.h
ripper.o: $(hdrdir)/ruby.h
ripper.o: $(hdrdir)/ruby/assert.h
ripper.o: $(hdrdir)/ruby/atomic.h
ripper.o: $(hdrdir)/ruby/backward.h
ripper.o: $(hdrdir)/ruby/backward/2/assume.h
ripper.o: $(hdrdir)/ruby/backward/2/attributes.h
ripper.o: $(hdrdir)/ruby/backward/2/bool.h
ripper.o: $(hdrdir)/ruby/backward/2/gcc_version_since.h
ripper.o: $(hdrdir)/ruby/backward/2/inttypes.h
ripper.o: $(hdrdir)/ruby/backward/2/limits.h
ripper.o: $(hdrdir)/ruby/backward/2/long_long.h
ripper.o: $(hdrdir)/ruby/backward/2/stdalign.h
ripper.o: $(hdrdir)/ruby/backward/2/stdarg.h
ripper.o: $(hdrdir)/ruby/defines.h
ripper.o: $(hdrdir)/ruby/encoding.h
ripper.o: $(hdrdir)/ruby/intern.h
ripper.o: $(hdrdir)/ruby/internal/abi.h
ripper.o: $(hdrdir)/ruby/internal/anyargs.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/char.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/double.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/int.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/long.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/short.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
ripper.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
ripper.o: $(hdrdir)/ruby/internal/assume.h
ripper.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
ripper.o: $(hdrdir)/ruby/internal/attr/artificial.h
ripper.o: $(hdrdir)/ruby/internal/attr/cold.h
ripper.o: $(hdrdir)/ruby/internal/attr/const.h
ripper.o: $(hdrdir)/ruby/internal/attr/constexpr.h
ripper.o: $(hdrdir)/ruby/internal/attr/deprecated.h
ripper.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
ripper.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
ripper.o: $(hdrdir)/ruby/internal/attr/error.h
ripper.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
ripper.o: $(hdrdir)/ruby/internal/attr/forceinline.h
ripper.o: $(hdrdir)/ruby/internal/attr/format.h
ripper.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
ripper.o: $(hdrdir)/ruby/internal/attr/noalias.h
ripper.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
ripper.o: $(hdrdir)/ruby/internal/attr/noexcept.h
ripper.o: $(hdrdir)/ruby/internal/attr/noinline.h
ripper.o: $(hdrdir)/ruby/internal/attr/nonnull.h
ripper.o: $(hdrdir)/ruby/internal/attr/noreturn.h
ripper.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
ripper.o: $(hdrdir)/ruby/internal/attr/pure.h
ripper.o: $(hdrdir)/ruby/internal/attr/restrict.h
ripper.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
ripper.o: $(hdrdir)/ruby/internal/attr/warning.h
ripper.o: $(hdrdir)/ruby/internal/attr/weakref.h
ripper.o: $(hdrdir)/ruby/internal/cast.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
ripper.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
ripper.o: $(hdrdir)/ruby/internal/compiler_since.h
ripper.o: $(hdrdir)/ruby/internal/config.h
ripper.o: $(hdrdir)/ruby/internal/constant_p.h
ripper.o: $(hdrdir)/ruby/internal/core.h
ripper.o: $(hdrdir)/ruby/internal/core/rarray.h
ripper.o: $(hdrdir)/ruby/internal/core/rbasic.h
ripper.o: $(hdrdir)/ruby/internal/core/rbignum.h
ripper.o: $(hdrdir)/ruby/internal/core/rclass.h
ripper.o: $(hdrdir)/ruby/internal/core/rdata.h
ripper.o: $(hdrdir)/ruby/internal/core/rfile.h
ripper.o: $(hdrdir)/ruby/internal/core/rhash.h
ripper.o: $(hdrdir)/ruby/internal/core/robject.h
ripper.o: $(hdrdir)/ruby/internal/core/rregexp.h
ripper.o: $(hdrdir)/ruby/internal/core/rstring.h
ripper.o: $(hdrdir)/ruby/internal/core/rstruct.h
ripper.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
ripper.o: $(hdrdir)/ruby/internal/ctype.h
ripper.o: $(hdrdir)/ruby/internal/dllexport.h
ripper.o: $(hdrdir)/ruby/internal/dosish.h
ripper.o: $(hdrdir)/ruby/internal/encoding/coderange.h
ripper.o: $(hdrdir)/ruby/internal/encoding/ctype.h
ripper.o: $(hdrdir)/ruby/internal/encoding/encoding.h
ripper.o: $(hdrdir)/ruby/internal/encoding/pathname.h
ripper.o: $(hdrdir)/ruby/internal/encoding/re.h
ripper.o: $(hdrdir)/ruby/internal/encoding/sprintf.h
ripper.o: $(hdrdir)/ruby/internal/encoding/string.h
ripper.o: $(hdrdir)/ruby/internal/encoding/symbol.h
ripper.o: $(hdrdir)/ruby/internal/encoding/transcode.h
ripper.o: $(hdrdir)/ruby/internal/error.h
ripper.o: $(hdrdir)/ruby/internal/eval.h
ripper.o: $(hdrdir)/ruby/internal/event.h
ripper.o: $(hdrdir)/ruby/internal/fl_type.h
ripper.o: $(hdrdir)/ruby/internal/gc.h
ripper.o: $(hdrdir)/ruby/internal/glob.h
ripper.o: $(hdrdir)/ruby/internal/globals.h
ripper.o: $(hdrdir)/ruby/internal/has/attribute.h
ripper.o: $(hdrdir)/ruby/internal/has/builtin.h
ripper.o: $(hdrdir)/ruby/internal/has/c_attribute.h
ripper.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
ripper.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
ripper.o: $(hdrdir)/ruby/internal/has/extension.h
ripper.o: $(hdrdir)/ruby/internal/has/feature.h
ripper.o: $(hdrdir)/ruby/internal/has/warning.h
ripper.o: $(hdrdir)/ruby/internal/intern/array.h
ripper.o: $(hdrdir)/ruby/internal/intern/bignum.h
ripper.o: $(hdrdir)/ruby/internal/intern/class.h
ripper.o: $(hdrdir)/ruby/internal/intern/compar.h
ripper.o: $(hdrdir)/ruby/internal/intern/complex.h
ripper.o: $(hdrdir)/ruby/internal/intern/cont.h
ripper.o: $(hdrdir)/ruby/internal/intern/dir.h
ripper.o: $(hdrdir)/ruby/internal/intern/enum.h
ripper.o: $(hdrdir)/ruby/internal/intern/enumerator.h
ripper.o: $(hdrdir)/ruby/internal/intern/error.h
ripper.o: $(hdrdir)/ruby/internal/intern/eval.h
ripper.o: $(hdrdir)/ruby/internal/intern/file.h
ripper.o: $(hdrdir)/ruby/internal/intern/hash.h
ripper.o: $(hdrdir)/ruby/internal/intern/io.h
ripper.o: $(hdrdir)/ruby/internal/intern/load.h
ripper.o: $(hdrdir)/ruby/internal/intern/marshal.h
ripper.o: $(hdrdir)/ruby/internal/intern/numeric.h
ripper.o: $(hdrdir)/ruby/internal/intern/object.h
ripper.o: $(hdrdir)/ruby/internal/intern/parse.h
ripper.o: $(hdrdir)/ruby/internal/intern/proc.h
ripper.o: $(hdrdir)/ruby/internal/intern/process.h
ripper.o: $(hdrdir)/ruby/internal/intern/random.h
ripper.o: $(hdrdir)/ruby/internal/intern/range.h
ripper.o: $(hdrdir)/ruby/internal/intern/rational.h
ripper.o: $(hdrdir)/ruby/internal/intern/re.h
ripper.o: $(hdrdir)/ruby/internal/intern/ruby.h
ripper.o: $(hdrdir)/ruby/internal/intern/select.h
ripper.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
ripper.o: $(hdrdir)/ruby/internal/intern/signal.h
ripper.o: $(hdrdir)/ruby/internal/intern/sprintf.h
ripper.o: $(hdrdir)/ruby/internal/intern/string.h
ripper.o: $(hdrdir)/ruby/internal/intern/struct.h
ripper.o: $(hdrdir)/ruby/internal/intern/thread.h
ripper.o: $(hdrdir)/ruby/internal/intern/time.h
ripper.o: $(hdrdir)/ruby/internal/intern/variable.h
ripper.o: $(hdrdir)/ruby/internal/intern/vm.h
ripper.o: $(hdrdir)/ruby/internal/interpreter.h
ripper.o: $(hdrdir)/ruby/internal/iterator.h
ripper.o: $(hdrdir)/ruby/internal/memory.h
ripper.o: $(hdrdir)/ruby/internal/method.h
ripper.o: $(hdrdir)/ruby/internal/module.h
ripper.o: $(hdrdir)/ruby/internal/newobj.h
ripper.o: $(hdrdir)/ruby/internal/scan_args.h
ripper.o: $(hdrdir)/ruby/internal/special_consts.h
ripper.o: $(hdrdir)/ruby/internal/static_assert.h
ripper.o: $(hdrdir)/ruby/internal/stdalign.h
ripper.o: $(hdrdir)/ruby/internal/stdbool.h
ripper.o: $(hdrdir)/ruby/internal/stdckdint.h
ripper.o: $(hdrdir)/ruby/internal/symbol.h
ripper.o: $(hdrdir)/ruby/internal/value.h
ripper.o: $(hdrdir)/ruby/internal/value_type.h
ripper.o: $(hdrdir)/ruby/internal/variable.h
ripper.o: $(hdrdir)/ruby/internal/warning_push.h
ripper.o: $(hdrdir)/ruby/internal/xmalloc.h
ripper.o: $(hdrdir)/ruby/io.h
ripper.o: $(hdrdir)/ruby/missing.h
ripper.o: $(hdrdir)/ruby/onigmo.h
ripper.o: $(hdrdir)/ruby/oniguruma.h
ripper.o: $(hdrdir)/ruby/ractor.h
ripper.o: $(hdrdir)/ruby/regex.h
ripper.o: $(hdrdir)/ruby/ruby.h
ripper.o: $(hdrdir)/ruby/st.h
ripper.o: $(hdrdir)/ruby/subst.h
ripper.o: $(hdrdir)/ruby/thread_native.h
ripper.o: $(hdrdir)/ruby/util.h
ripper.o: $(hdrdir)/ruby/version.h
ripper.o: $(top_srcdir)/ccan/check_type/check_type.h
ripper.o: $(top_srcdir)/ccan/container_of/container_of.h
ripper.o: $(top_srcdir)/ccan/list/list.h
ripper.o: $(top_srcdir)/ccan/str/str.h
ripper.o: $(top_srcdir)/constant.h
ripper.o: $(top_srcdir)/id_table.h
ripper.o: $(top_srcdir)/internal.h
ripper.o: $(top_srcdir)/internal/array.h
ripper.o: $(top_srcdir)/internal/basic_operators.h
ripper.o: $(top_srcdir)/internal/bignum.h
ripper.o: $(top_srcdir)/internal/bits.h
ripper.o: $(top_srcdir)/internal/compile.h
ripper.o: $(top_srcdir)/internal/compilers.h
ripper.o: $(top_srcdir)/internal/complex.h
ripper.o: $(top_srcdir)/internal/encoding.h
ripper.o: $(top_srcdir)/internal/error.h
ripper.o: $(top_srcdir)/internal/fixnum.h
ripper.o: $(top_srcdir)/internal/gc.h
ripper.o: $(top_srcdir)/internal/hash.h
ripper.o: $(top_srcdir)/internal/imemo.h
ripper.o: $(top_srcdir)/internal/io.h
ripper.o: $(top_srcdir)/internal/numeric.h
ripper.o: $(top_srcdir)/internal/parse.h
ripper.o: $(top_srcdir)/internal/rational.h
ripper.o: $(top_srcdir)/internal/re.h
ripper.o: $(top_srcdir)/internal/ruby_parser.h
ripper.o: $(top_srcdir)/internal/sanitizers.h
ripper.o: $(top_srcdir)/internal/serial.h
ripper.o: $(top_srcdir)/internal/static_assert.h
ripper.o: $(top_srcdir)/internal/string.h
ripper.o: $(top_srcdir)/internal/symbol.h
ripper.o: $(top_srcdir)/internal/thread.h
ripper.o: $(top_srcdir)/internal/variable.h
ripper.o: $(top_srcdir)/internal/vm.h
ripper.o: $(top_srcdir)/internal/warnings.h
ripper.o: $(top_srcdir)/method.h
ripper.o: $(top_srcdir)/node.h
ripper.o: $(top_srcdir)/parser_node.h
ripper.o: $(top_srcdir)/parser_st.h
ripper.o: $(top_srcdir)/regenc.h
ripper.o: $(top_srcdir)/ruby_assert.h
ripper.o: $(top_srcdir)/ruby_atomic.h
ripper.o: $(top_srcdir)/rubyparser.h
ripper.o: $(top_srcdir)/shape.h
ripper.o: $(top_srcdir)/symbol.h
ripper.o: $(top_srcdir)/thread_pthread.h
ripper.o: $(top_srcdir)/vm_core.h
ripper.o: $(top_srcdir)/vm_opts.h
ripper.o: ../../probes.h
ripper.o: eventids1.h
ripper.o: eventids2.c
ripper.o: eventids2.h
ripper.o: ripper.y
ripper.o: ripper_init.h
ripper.o: eventids1.c
ripper.o: eventids2table.c
ripper.o: id.h
ripper.o: lex.c
ripper.o: parse.h
ripper.o: probes.dmyh
ripper.o: ripper.c
ripper_init.o: $(RUBY_EXTCONF_H)
ripper_init.o: $(arch_hdrdir)/ruby/config.h
ripper_init.o: $(hdrdir)/ruby/assert.h
ripper_init.o: $(hdrdir)/ruby/backward.h
ripper_init.o: $(hdrdir)/ruby/backward/2/assume.h
ripper_init.o: $(hdrdir)/ruby/backward/2/attributes.h
ripper_init.o: $(hdrdir)/ruby/backward/2/bool.h
ripper_init.o: $(hdrdir)/ruby/backward/2/gcc_version_since.h
ripper_init.o: $(hdrdir)/ruby/backward/2/inttypes.h
ripper_init.o: $(hdrdir)/ruby/backward/2/limits.h
ripper_init.o: $(hdrdir)/ruby/backward/2/long_long.h
ripper_init.o: $(hdrdir)/ruby/backward/2/stdalign.h
ripper_init.o: $(hdrdir)/ruby/backward/2/stdarg.h
ripper_init.o: $(hdrdir)/ruby/defines.h
ripper_init.o: $(hdrdir)/ruby/encoding.h
ripper_init.o: $(hdrdir)/ruby/intern.h
ripper_init.o: $(hdrdir)/ruby/internal/abi.h
ripper_init.o: $(hdrdir)/ruby/internal/anyargs.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/char.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/double.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/fixnum.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/gid_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/int.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/intptr_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/long.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/long_long.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/mode_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/off_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/pid_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/short.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/size_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/st_data_t.h
ripper_init.o: $(hdrdir)/ruby/internal/arithmetic/uid_t.h
ripper_init.o: $(hdrdir)/ruby/internal/assume.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/alloc_size.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/artificial.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/cold.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/const.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/constexpr.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/deprecated.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/diagnose_if.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/enum_extensibility.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/error.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/flag_enum.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/forceinline.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/format.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/maybe_unused.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/noalias.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/nodiscard.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/noexcept.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/noinline.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/nonnull.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/noreturn.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/packed_struct.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/pure.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/restrict.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/returns_nonnull.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/warning.h
ripper_init.o: $(hdrdir)/ruby/internal/attr/weakref.h
ripper_init.o: $(hdrdir)/ruby/internal/cast.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/apple.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/clang.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/gcc.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/intel.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/msvc.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_is/sunpro.h
ripper_init.o: $(hdrdir)/ruby/internal/compiler_since.h
ripper_init.o: $(hdrdir)/ruby/internal/config.h
ripper_init.o: $(hdrdir)/ruby/internal/constant_p.h
ripper_init.o: $(hdrdir)/ruby/internal/core.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rarray.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rbasic.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rbignum.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rclass.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rdata.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rfile.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rhash.h
ripper_init.o: $(hdrdir)/ruby/internal/core/robject.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rregexp.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rstring.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rstruct.h
ripper_init.o: $(hdrdir)/ruby/internal/core/rtypeddata.h
ripper_init.o: $(hdrdir)/ruby/internal/ctype.h
ripper_init.o: $(hdrdir)/ruby/internal/dllexport.h
ripper_init.o: $(hdrdir)/ruby/internal/dosish.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/coderange.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/ctype.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/encoding.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/pathname.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/re.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/sprintf.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/string.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/symbol.h
ripper_init.o: $(hdrdir)/ruby/internal/encoding/transcode.h
ripper_init.o: $(hdrdir)/ruby/internal/error.h
ripper_init.o: $(hdrdir)/ruby/internal/eval.h
ripper_init.o: $(hdrdir)/ruby/internal/event.h
ripper_init.o: $(hdrdir)/ruby/internal/fl_type.h
ripper_init.o: $(hdrdir)/ruby/internal/gc.h
ripper_init.o: $(hdrdir)/ruby/internal/glob.h
ripper_init.o: $(hdrdir)/ruby/internal/globals.h
ripper_init.o: $(hdrdir)/ruby/internal/has/attribute.h
ripper_init.o: $(hdrdir)/ruby/internal/has/builtin.h
ripper_init.o: $(hdrdir)/ruby/internal/has/c_attribute.h
ripper_init.o: $(hdrdir)/ruby/internal/has/cpp_attribute.h
ripper_init.o: $(hdrdir)/ruby/internal/has/declspec_attribute.h
ripper_init.o: $(hdrdir)/ruby/internal/has/extension.h
ripper_init.o: $(hdrdir)/ruby/internal/has/feature.h
ripper_init.o: $(hdrdir)/ruby/internal/has/warning.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/array.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/bignum.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/class.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/compar.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/complex.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/cont.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/dir.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/enum.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/enumerator.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/error.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/eval.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/file.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/hash.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/io.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/load.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/marshal.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/numeric.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/object.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/parse.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/proc.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/process.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/random.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/range.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/rational.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/re.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/ruby.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/select.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/select/largesize.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/signal.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/sprintf.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/string.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/struct.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/thread.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/time.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/variable.h
ripper_init.o: $(hdrdir)/ruby/internal/intern/vm.h
ripper_init.o: $(hdrdir)/ruby/internal/interpreter.h
ripper_init.o: $(hdrdir)/ruby/internal/iterator.h
ripper_init.o: $(hdrdir)/ruby/internal/memory.h
ripper_init.o: $(hdrdir)/ruby/internal/method.h
ripper_init.o: $(hdrdir)/ruby/internal/module.h
ripper_init.o: $(hdrdir)/ruby/internal/newobj.h
ripper_init.o: $(hdrdir)/ruby/internal/scan_args.h
ripper_init.o: $(hdrdir)/ruby/internal/special_consts.h
ripper_init.o: $(hdrdir)/ruby/internal/static_assert.h
ripper_init.o: $(hdrdir)/ruby/internal/stdalign.h
ripper_init.o: $(hdrdir)/ruby/internal/stdbool.h
ripper_init.o: $(hdrdir)/ruby/internal/stdckdint.h
ripper_init.o: $(hdrdir)/ruby/internal/symbol.h
ripper_init.o: $(hdrdir)/ruby/internal/value.h
ripper_init.o: $(hdrdir)/ruby/internal/value_type.h
ripper_init.o: $(hdrdir)/ruby/internal/variable.h
ripper_init.o: $(hdrdir)/ruby/internal/warning_push.h
ripper_init.o: $(hdrdir)/ruby/internal/xmalloc.h
ripper_init.o: $(hdrdir)/ruby/missing.h
ripper_init.o: $(hdrdir)/ruby/onigmo.h
ripper_init.o: $(hdrdir)/ruby/oniguruma.h
ripper_init.o: $(hdrdir)/ruby/ruby.h
ripper_init.o: $(hdrdir)/ruby/st.h
ripper_init.o: $(hdrdir)/ruby/subst.h
ripper_init.o: $(top_srcdir)/internal.h
ripper_init.o: $(top_srcdir)/internal/array.h
ripper_init.o: $(top_srcdir)/internal/bignum.h
ripper_init.o: $(top_srcdir)/internal/bits.h
ripper_init.o: $(top_srcdir)/internal/compilers.h
ripper_init.o: $(top_srcdir)/internal/complex.h
ripper_init.o: $(top_srcdir)/internal/fixnum.h
ripper_init.o: $(top_srcdir)/internal/imemo.h
ripper_init.o: $(top_srcdir)/internal/numeric.h
ripper_init.o: $(top_srcdir)/internal/parse.h
ripper_init.o: $(top_srcdir)/internal/rational.h
ripper_init.o: $(top_srcdir)/internal/ruby_parser.h
ripper_init.o: $(top_srcdir)/internal/serial.h
ripper_init.o: $(top_srcdir)/internal/static_assert.h
ripper_init.o: $(top_srcdir)/internal/vm.h
ripper_init.o: $(top_srcdir)/node.h
ripper_init.o: $(top_srcdir)/ruby_assert.h
ripper_init.o: $(top_srcdir)/rubyparser.h
ripper_init.o: eventids1.h
ripper_init.o: eventids2.h
ripper_init.o: ripper_init.h
ripper_init.o: parse.h
ripper_init.o: ripper_init.c
# AUTOGENERATED DEPENDENCIES END
