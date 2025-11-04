#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
// #include <stdatomic.h>

int main() {
	for (int i = 0; i < 1000; i++) {
		int *p = malloc(sizeof(int));
		uintptr_t v = (uintptr_t) p;
		unsigned long ul = (unsigned long) v;
		ptraddr_t paddr = cheri_address_get(p);
		if (ul == paddr) {
			printf(": %lu != %lu\n", ul, paddr);
			// return 1;
		}
	}

	return 0;
}	
