directory /rootfs/research/sakuranbo/build
layout src 
fs cmd
b rb_main
r rbtests/errmsg.rb



define pstre
	p (char*)(((struct RString *)($arg0))->as.embed.ary)
end

define pstr
        p (char*)(((struct RString *)($arg0))->as.heap.ptr)  
end  

define pp
	p *($arg0)
end
