#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
// #include <stdatomic.h>

// 18421523915796276842 1.3

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))


union {

	/**
	 * Capacity of `*ptr`.  A continuous  memory region of at least
	 * `capa` bytes  is expected to  exist at `*ptr`.  This  can be
	 * bigger than `len`.
	 */
	long capa;

	/**
	 * Parent  of the  string.   Nowadays strings  can share  their
	 * contents each other, constructing  gigantic nest of objects.
	 * This situation is called "shared",  and this is the field to
	 * control such properties.
	 */
	VALUE shared;
} aux;


static inline VALUE
RUBY_BIT_ROTR(VALUE v, int n)
{
    const int m = (sizeof(ULVALUE) * CHAR_BIT) - 1;
	return (CULONG(v) << (-n & m)) | (CULONG(v) >> (n & m));
}

// TODO: if with cap, what bytes will take by other types 
int main() {
	// VALUE v = 18421523915796276842ULL;

	// union {
	// 	double d;
	// 	ULVALUE v;
	// } t;

	// ULVALUE b63 = (CULONG(v) >> 63);
	// /* e: xx1... -> 011... */
	// /*    xx0... -> 100... */
	// /*      ^b63           */
	// t.v = RUBY_BIT_ROTR((2 - b63) | (CULONG(v) & ~(ULVALUE)0x03), 3);
	// printf("%f\n", t.d);

	aux.capa = 0x1234567812345678L;
	printf("%lx\n", aux.capa);
	VALUE v = aux.shared;
	printf("%lx\n", cheri_address_get(v));
	printf("%lx\n", cheri_perms_get(v));
	printf("%lx\n", cheri_type_get(v));
	printf("%lx\n", cheri_length_get(v));
	printf("%lx\n", cheri_tag_get(v));

	return 0;
}	

