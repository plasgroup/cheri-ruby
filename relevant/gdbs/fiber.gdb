directory /rootfs/research/sakuranbo/build
layout src 
fs cmd
b rb_main
r rbtests/fiber1.rb
 
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
#b each_location
#watch *0x3fffdf5180 if (*0x3fffdf5180 == 0x4525b4)
#b mark_current_machine_context
#b rb_gc_mark_and_move
#b fill_lines
#b RVALUE_MARKED if (void *)obj == 0x4145a640
#b ractor_safe_call_cfunc_m1
#display/x *0x76ea7580==0x4145a640
#display *((VALUE **)(0x76ecbdb0)) == 0x7a663870
