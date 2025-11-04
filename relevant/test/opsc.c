// #include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
// #include <stdatomic.h>

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))

int main() {
	char *a, *b;
	a = (char *)malloc(10);
	b = (char *)malloc(10);
	a ^= b; 


	return 0;
}	


// cheri support
#ifdef __CHERI_PURE_CAPABILITY__ && 0
#else
#endif