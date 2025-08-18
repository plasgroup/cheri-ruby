directory /rootfs/research/ruby-3.4.5/build
directory /rootfs/research/ruby-3.4.5
layout src 
fs cmd
b rb_main

r -v

#set detach-on-fork off
#set follow-fork-mode child


define ciri
	d 
	b $arg0
	c
	inferior 1
	c 
	en 
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
