#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
// #include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
// #include <stdatomic.h>

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))

#define OP & 

int main() {


	// comparison !=, ==, >, <, >=, <= 
	// arithmetic +, -, *, /, %, ++, --
	// logical &&, ||, !
	// bitwise &, |, ^, ~, <<, >>
	VALUE a = 0x0123456789abcdef;
	ptraddr_t e = cheri_flags_get(a);
	printf("e = %#p\n", e);
	VALUE b = a >> 10;
	e = cheri_flags_get(b);
	ptraddr_t c = (ptraddr_t) a;
	ptraddr_t d = (ptraddr_t) b;
	printf("a = %#p\n", a);
	printf("b = %#p\n", b);
	printf("c = %#p\n", c);
	printf("d = %#p\n", d);
	printf("e = %#p\n", e);
	

	return 0;
}	


// cheri support
#ifdef __CHERI_PURE_CAPABILITY__ 
#else
#endif