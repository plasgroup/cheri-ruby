// #include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
// #include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
// #include <stdatomic.h>

#include "/cheruby-purecap/src/output/rootfs-riscv64-purecap/research/sakuranbo/sprintf.c"

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))

int main() {

	rb_sprintf("%"PRIsVALUE"%s%"PRIsVALUE,
							  classpath, singleton_p == Qtrue ? "." : "#", method_name);

		
	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif