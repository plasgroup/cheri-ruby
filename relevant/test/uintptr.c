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

// const char *p = "12345678911131501234567891113150";

int main() {
	char *p = (char*)malloc(16);
	p[0] = 'a';
	p[1] = 'b';
	p[2] = 'c';
	p[3] = 'd';
	p[4] = 'e';
	p[5] = 'f';
	p[6] = 'g';
	p[7] = 'h';
	p[8] = 'i';
	p[9] = 'j';
	p[10] = 'k';
	p[11] = 'l';
	p[12] = 'm';
	p[13] = 'n';
	p[14] = 'o';
	p[15] = 'p';

	printf("p: %p\n", p);
	int align = __builtin_is_aligned(p, 16);
	uintptr_t *up = (uintptr_t *)p;
	int align2 = __builtin_is_aligned(up, 16);
	uintptr_t s = *up;
	int align3 = __builtin_is_aligned(s, 16);
	printf("align: %d\n", align);
	printf("align2: %d\n", align2);
	printf("align3: %d\n", align3);
	printf("%p\n", s);
	size_t offset = cheri_offset_get(s);
	printf("offset: %lx\n", offset);
	size_t length = cheri_length_get(s);
	printf("length: %lu\n", length);
	unsigned long perms = cheri_perms_get(s);
	size_t type = cheri_type_get(s);
	printf("type: %lx\n", type);
	printf("perms: %lx\n", perms);
	ptraddr_t base = cheri_base_get(s);
	printf("base: %lu\n", base);
	int cmp = s & 

	// // for (size_t i = 0; i < 3; i++)
	// // {
	// // 	uintptr_t s = *u;
	// // 	printf("%x\n", s);
	// // 	u++;
	// // }


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif