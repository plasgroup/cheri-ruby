#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
#include <string.h>
// #include <stdatomic.h>

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))


#ifndef _PP_CAP 
#define _PP_CAP
#include <cheriintrin.h>
void pp_cap(void * ptr, const char *name)
{
    uint64_t length = cheri_length_get(ptr);
    uint64_t address = cheri_address_get(ptr);
    uint64_t base = cheri_base_get(ptr);
    uint64_t flags = cheri_flags_get(ptr);
    uint64_t perms = cheri_perms_get(ptr);
    uint64_t type = cheri_type_get(ptr);
    int tag = cheri_tag_get(ptr);

    uint64_t offset = cheri_offset_get(ptr);

	int is_executable = cheri_perms_get(ptr) & CHERI_PERM_EXECUTE;
	int is_read = cheri_perms_get(ptr) & CHERI_PERM_LOAD;
	int is_write = cheri_perms_get(ptr) & CHERI_PERM_STORE;
	int is_invoke = cheri_perms_get(ptr) & CHERI_PERM_INVOKE;

	int is_aligned = __builtin_is_aligned(ptr, 16);

	int is_sealed = cheri_is_sealed(ptr);

	printf("Executable: %d, Read: %d, Write: %d invoke: %d\n", is_executable, is_read, is_write, is_invoke);
	printf("%s: %p\n", name, ptr);
    printf("Capability: %#lp\n", ptr);
	printf("Is aligned: %d\n", is_aligned);
	printf("Is sealed: %d\n", is_sealed);

    printf("Tag: %d, Perms: %04lx, Type: %lx, Address: %04lx, Base: %04lx, End: %04lx, Flags: %lx, "
           "Length: %04lx, Offset: %04lx\n\n",
           tag, perms, type, address, base, base + length, flags, length, offset);
}
#endif

void 
print_uint128_as_bytes_and_string(VALUE *value) {
	char buf[sizeof(__uint128_t) + 1];
	memcpy(buf, value, sizeof(__uint128_t));
	buf[sizeof(__uint128_t)] = '\0';
	printf("buf: ");
	for (size_t i = 0; i < sizeof(__uint128_t); i++) {
		printf("%02x ", (unsigned char)buf[i]);
	}
	printf("\n");
	printf("buf as string: %s\n", buf);
}

uintptr_t f(uintptr_t x, int n) {return x << n;}
void g(){f(1,100);}

int main() {
	// each a small program for the issue 
	VALUE a = (VALUE)malloc(16 * sizeof(int));
    VALUE b = (VALUE)malloc(16 * sizeof(int));

    VALUE offset = a + b;
	int c = (int)offset;

	VALUE d = f(1,65);
	printf("d: %p\n", d);
	// intrinsics
// 	The object-type field is set when a capability is sealed based on a second input capability
// authorizing use of the type space
// cannot be set some of them depend on other, also should not set, is impractical 
	// cheri_high_set()
	// cheri_offset_set()
	// cheri_bounds_set()
	// cheri_seal()
	// cheri_perms_and()
	// cheri_flags_set()

	// memset yes 
	// VALUE a[2]; 	
	// // pp_cap((void*)a[0], "a");
	// memset(a, 0x67, 16);
	// memset(&a[1], 0x99, 16);
	// // pp_cap((void*)a[0], "a");
	// // pp_cap((void*)a[1], "a");
	// print_uint128_as_bytes_and_string(&a[0]);
	// print_uint128_as_bytes_and_string(&a[1]);

	// char b[32];
	// memcpy(b, a, 32);
	// printf("b: ");
	// for (size_t i = 0; i < 32; i++) {
	// 	printf("%02x ", (unsigned char)b[i]);
	// }
	// printf("\n");


	// uint128_t no 
	// __uint128_t a = 0x1234567890abcdef;
	// a <<= 64;
	// a |= 0xfedcba0987654321;
	// print_uint128_as_bytes_and_string(&a);
	// VALUE b = 0;
	// // pp_cap((void*) b, "b");
	// b |= a; 
	// // pp_cap((void*) b, "b");
	// print_uint128_as_bytes_and_string(&b);

	// // uintptr_t no 
	// int *p = malloc(100);
	// // pp_cap((void*) p, "p");
	// VALUE c = (VALUE) p;
	// print_uint128_as_bytes_and_string(&c);

	// VALUE d = 0;
	// print_uint128_as_bytes_and_string(&d);
	// // pp_cap((void*) d, "d");
	// d |= c; 
	// // pp_cap((void*) d, "d");
	// print_uint128_as_bytes_and_string(&d);

	// punning with unions
	// union batchprocstring
	// {
	// 	VALUE v;
	// 	unsigned char bytes[sizeof(VALUE)];
	// };
	// union batchprocstring u;
	// u.v = 0;
	// pp_cap((void*) u.v, "u.v initial");
	// for (size_t i = 0; i < sizeof(VALUE); i++) {
	// 	u.bytes[i] = 1;
	// }
	// pp_cap((void*) u.v, "u.v after setting d");
	

	// // type punning with pointers
	// const char *str = "hello worldasdfg";
	// VALUE *p = (VALUE *) str;
	// VALUE v = *p;
	// // pp_cap((void*) v, "v from str");
	// print_uint128_as_bytes_and_string(&v);


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif
