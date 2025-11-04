// #include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
// #include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
// #include <stdatomic.h>


#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))


static inline VALUE
RUBY_BIT_ROTR(ULVALUE v)
{
	v = v + 1; 
	return v; 
}

// yes 
int main() {
	VALUE v = 1842196276842ULL;
	VALUE v2 = RUBY_BIT_ROTR(v);
	printf("v2: %lu\n", v2);

	return 0;
}	


// cheri support
#ifdef __CHERI_PURE_CAPABILITY__ && 0
#else
#endif