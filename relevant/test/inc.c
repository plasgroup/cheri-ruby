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

void pp_cap(void * ptr, const char *name)
{
    uint64_t length = cheri_length_get(ptr);
    uint64_t address = cheri_address_get(ptr);
    uint64_t base = cheri_base_get(ptr);
    uint64_t flags = cheri_flags_get(ptr);
    uint64_t perms = cheri_perms_get(ptr);
    uint64_t type = cheri_type_get(ptr);
    bool tag = cheri_tag_get(ptr);

    uint64_t offset = cheri_offset_get(ptr);

	printf("%s: %p\n", name, ptr);
    printf("Capability: %#lp\n", ptr);
    printf("Tag: %d, Perms: %04lx, Type: %lx, Address: %04lx, Base: %04lx, End: %04lx, Flags: %lx, "
           "Length: %04lx, Offset: %04lx\n \n",
           tag, perms, type, address, base, base + length, flags, length, offset);
}

int foo() {
	int a = 0;
	while (a < 10) {
		a++;
	}
	int b = a; 
	return b;
}