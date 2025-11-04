directory /rootfs/research/sakuranbo/build
layout src 
fs cmd
b rb_main
r rbtests/gctest.rb

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
b fill_lines
