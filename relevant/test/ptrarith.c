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

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))

// ok 
int main() {
	int *start = (int *)malloc(sizeof(int) * 10);
	int *end = start + 10;
	long n = end - start;
	while (n--) {
		printf("%d\n", *start++);
	}


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif