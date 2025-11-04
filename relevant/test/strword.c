// #include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// #include <stdatomic.h>

int main() {
	char *str = "hello world";
	uintptr_t* ptr = (uintptr_t*) __builtin_align_up((uintptr_t)str, 16);
	// uintptr_t* ptr = (uintptr_t*) str;
	uint64_t* a = (uint64_t *)ptr;
	uint64_t d = *a;
	printf("d %lu\n", d);

	// test const char * 

	return 0;
}	