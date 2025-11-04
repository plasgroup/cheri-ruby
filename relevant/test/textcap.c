#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
// #include <stdatomic.h>

#include "inc.c"

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))

int main() {
	VALUE *x = (VALUE *)malloc(sizeof(VALUE) * 10);
	x[3] = 0x101abc; 
	VALUE v;
	int n = 10;
	for (int i = 0; i < n; i++) {
		v = *x;
		// void* v_ptr = (void*)(((char*) &rb_gc_remove_weak)+24);
		// pp_cap(v_ptr, "vptr"); 
		pp_cap((void*)v, "v");
        x++;
	}
	void *fooaddr = &foo;
	pp_cap(fooaddr, "fooaddr");
	void *mainaddr = &main;
	pp_cap(mainaddr, "mainaddr");

	// void *m = &mark_current_machine_context;
	// pp_cap(m, "m");

	void * ptr = (void *)(0x101abc);
	pp_cap(ptr, "ptr");


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif