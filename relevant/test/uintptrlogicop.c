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

int main() {
	for (int i = 0; i < 1000; i++) {
		int *p = malloc(sizeof(int));
		uintptr_t v = (uintptr_t) p;
		unsigned long ul = (unsigned long) v;
		v = ul; 

		// ! 
		if (!v != !ul) {
			printf(": %lu != %lu\n", ul, v);
			// return 1;
		}

		// && 

		// ||
	}


	return 0;
}	


// cheri support
#ifdef __CHERI_PURE_CAPABILITY__ && 0
#else
#endif