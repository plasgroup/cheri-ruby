#include <stdio.h>

// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheriintrin.h>

#include <stdint.h>
#define CMP_BITS(lhs, op, rhs) (((unsigned long) lhs) op ((unsigned long) rhs))

#include <limits.h>

int main() {
#ifdef __CHERI_PURE_CAPABILITY__ && 0
// SIZEOF_UINTPTR_T
// 	printf("sizeof ptr %lu\n", sizeof(uintptr_t));
// 	printf("sizeof long %lu\n", sizeof(long));

// // (uintptr_t)0
// 	// equal 
// 	uintptr_t a = 0;
// 	uintptr_t b = (uintptr_t)0;
// 	printf("eq %d\n", a == b);
// 	// print
// 	// printf.3 
// 	printf("a %lu\n", a);
// 	printf("ap %p\n", a);
// 	printf("b %lu\n", b);
// 	printf("bp %p\n", b);
// 	// get fields 
// 	ptraddr_t aa = cheri_address_get(a);
// 	ptraddr_t ab = cheri_address_get(b);
// 	printf("aa %lu\n", aa);
// 	printf("ab %lu\n", ab);


// // (uintptr_t)1
// 	a = 1;
// 	b = (uintptr_t)1;
// 	printf("eq %d\n", a == b);
// 	// print
// 	// printf.3 
// 	printf("a %lu\n", a);
// 	printf("ap %p\n", a);
// 	printf("b %lu\n", b);
// 	printf("bp %p\n", b);
// 	// get fields 
// 	 aa = cheri_address_get(a);
// 	 ab = cheri_address_get(b);
// 	printf("aa %lu\n", aa);
// 	printf("ab %lu\n", ab);
// // ULONG_MAX

	// for (size_t i = 0; i < 10; i++) {
	// 	printf("%zu\n", i);
	// }
	// return 0;

// cast to ul yes 
	// unsigned long ul = 1;
	// unsigned long ul2 = 0;
	// for (; ul < 1000; ul++) {
	// 	uintptr_t p = ul;
	// 	ul2 = (unsigned long) p;
	// 	ptraddr_t pp = cheri_address_get(p);
	// 	if (ul == ul2 && ul == (unsigned long) pp) {
	// 		printf("ul %lu\n", ul);
	// 	}
	// }


	int a = CMP_BITS(1, ==, 2);

	printf("a %lu\n", sizeof(unsigned long));


#endif
	return 0;
}




