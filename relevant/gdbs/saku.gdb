directory /rootfs/research/sakuranbo/build
set follow-fork-mode child
set follow-exec-mode new
layout src 
b rb_main
r --disable=gems  "../bootstraptest/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  -r./riscv64-freebsd-fake --disable-gems"
