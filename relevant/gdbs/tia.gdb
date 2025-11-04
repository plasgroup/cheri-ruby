directory /rootfs/research/ruby341e/build
directory /rootfs/research/ruby341e
layout src 
fs cmd
b rb_main

r -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems -r../tool/lib/_tmpdir \
"../test/runner.rb" --ruby="./miniruby -I../lib -I. -I.ext/common  ../tool/runruby.rb --extout=.ext  -- --disable-gems" \
--excludes-dir=../test/.excludes --name=!/memory_leak/ \
 ../test/-ext-/thread/test_instrumentation_api.rb \
 --name=TestThreadInstrumentation#test_multi_thread_timeline \
-s 3216 --timeout-scale 10 --worker-timeout=1000
 
set detach-on-fork off
set follow-fork-mode child

define initt
	clear
	c
	inferior 1
	c 
	inferior 1
	c 
	ref 
end 

define cr
	c
	ref
end 

define rr
	r
	ref
end 

define bins
	p (($arg0) + ($arg1)) / 2
end 

define pstre
	p (char*)(((struct RString *)($arg0))->as.embed.ary)
end

define pstr
        p (char*)(((struct RString *)($arg0))->as.heap.ptr)  
end  

define pp
	p *($arg0)
end

define ppc
	p (void *)($arg0)
end 

define ppd
	p (void *)(*($arg0))
end 

define sf
	step
	finish
end 

b instrumentation.c:123
