// #include <cheriintrin.h>
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

int __attribute((aligned(16))) binary_filename[10 + 1] ;
__attribute((aligned(16))) char chararr[10 + 1] ;
char _Alignas(16) chararr2[10 + 1];

typedef struct {
	int a;
	int b;
} mystruct __attribute((aligned(16)));


const char _Alignas(16) *  str = "hello" ;

int main() {
	// memcpy cap 
	static const char __attribute((aligned(16))) global_debug_dir[] = "/usr/lib/debug/.build-id/";
	mystruct s;
	int a = __builtin_is_aligned(binary_filename, 16);
	int b = __builtin_is_aligned(chararr, 16);
	int c = __builtin_is_aligned(chararr2, 16);
	int d = __builtin_is_aligned(&s, 16);
	int e = __builtin_is_aligned(str, 16);
	int f = __builtin_is_aligned(global_debug_dir, 16);
	printf("a: %d\n", a);
	printf("b: %d\n", b);
	printf("c: %d\n", c);
	printf("d: %d\n", d);
	printf("e: %d\n", e);
	printf("f: %d\n", f);
	printf("global_debug_dir: %s\n", global_debug_dir);


	return 0;
}	


// cheri support
#ifdef __CHERI_PURE_CAPABILITY__ 
#else
#endif