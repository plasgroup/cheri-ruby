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

	printf("Executable: %d, Read: %d, Write: %d invoke: %d\n", is_executable, is_read, is_write, is_invoke);
	printf("%s: %p\n", name, ptr);
    printf("Capability: %#lp\n", ptr);
	printf("Is aligned: %d\n", is_aligned);

    printf("Tag: %d, Perms: %04lx, Type: %lx, Address: %04lx, Base: %04lx, End: %04lx, Flags: %lx, "
           "Length: %04lx, Offset: %04lx\n\n",
           tag, perms, type, address, base, base + length, flags, length, offset);
}
#endif

int main() {
	// int *p = malloc(16);
	// pp_cap(p, "malloc");
	// uintptr_t p2 = (uintptr_t)p;
	// char a = (p2 >> 70) & 0xff;
	// printf("a: %d\n", a);
	// p2 |= 0xac << 70;
	// char b = (p2 >> 70) & 0xff;
	// printf("b: %d\n", b);
	// pp_cap((void *)p2, "p2");

	int *c = malloc(16);
	pp_cap(c, "malloc");

	char *b = (char *)malloc(128);
	uintptr_t a_int = (uintptr_t)c;
	for (int i = 127; i >= 0; i--) {
		char v = (a_int & 1) + '0';
		a_int = a_int >> 1;
		b[i] = v;
	}
	printf("b: %s\n", b);
	pp_cap((void *)a_int, "malloc");



	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif