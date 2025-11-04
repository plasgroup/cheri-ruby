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
	// cap & int 
	VALUE cap = (VALUE) 0x123456789abcdef;
	VALUE res = cap & 0xf00000;
	ULVALUE expected = 0x123456789abcdef & 0xf00000; 
	if ((unsigned) res == expected) {
	 	printf("Bitwise AND operation on VALUE passed: %#p %x\n", res, expected);
	} else {
		printf("Bitwise AND operation on VALUE failed: expected %lx, got %lx\n", expected, res);
	}
	res >>= 5;
	expected >>= 5;
	if ((unsigned) res == (expected)) {
   		printf("Right shift operation on VALUE passed: %lx >> 5 = %lx\n", expected, cap);
	} else {
		printf("Right shift operation on VALUE failed: expected %lx, got %lx\n", expected >> 5, cap);
	}


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif