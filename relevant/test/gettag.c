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
	int load_cap = cheri_perms_get(ptr) & CHERI_PERM_LOAD_CAP;

	printf("Load Cap: %d\n", load_cap);
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

int *i;
int **ip; 

int main() {
	i = (int *)malloc(sizeof(int));
	*i = 0x12345678; 
	ip = &i;
	printf("ip: %p\n", ip);
	printf("i: %p\n", i);
	int *ret = NULL;
	__asm__ __volatile__ (
        // "cincoffset      csp, csp, -16\n"
        // "csc     ca0, 16(csp)\n"
        "clc     ca0, 0(%1)\n"
        // "clc     ca0, 0(ca0)\n"
        // "clc     ca0, 0(ca0)\n"
        // "csc     %0, 0(ca0)\n"
        // "csc     ca0, %0\n"
        // "mv     a0, %0\n"
        // "clc     ca0, 0(ca0)\n"
        "cgettag %0, ca0\n"
        // "clc     ca0, 16(csp)\n"
        // "cincoffset      csp, csp, 16"
        :"=r"(tag)
        // :"=C"(ret)
        :"C"(ip)
	);
	printf("Return: %p\n", ret);
	printf("Tag: %d\n", tag);
	i = cheri_tag_clear(i);
	
	int tag = 0;
	__asm__ __volatile__ (
        "clc     ca0, 0(%1)\n"
        "cgettag %0, ca0\n"
        :"=r"(tag)
        :"C"(ip)
	);
	if (tag) {
		printf("GOOD, i: %p\n", i);
	} else {
		printf("INVALID, i: %p\n", i);
	}

	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif
