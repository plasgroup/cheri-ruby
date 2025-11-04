#include <cheriintrin.h>
// #include <cheri.h>
#include <cheri/cheri.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
#include <sys/sysctl.h>
// #include <stdatomic.h>

#define VALUE uintptr_t
#define ULVALUE unsigned long 
#define CULONG(x) ((ULVALUE) (x))


#ifndef _PP_CAP 
#define _PP_CAP
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

void *unseal; 
size_t myotype = 0x1234;

int main() {
	int *cap = (int *) malloc(sizeof(int) * 10);
	unseal = cap;
	cap[0] = 42;
	pp_cap(cap, "original cap");

	void * sealcap;
	size_t sealcap_size = sizeof(sealcap);
	if (sysctlbyname("security.cheri.sealcap", &sealcap, &sealcap_size, NULL, 0) < 0)
	{
		fprintf(stderr, "Fatal error. Cannot get `security.cheri.sealcap`.");
		exit(1);
	}

	void *sealed = cheri_seal(cap, unseal);
	// void *sealed = cheri_seal(cap, sealcap);
	pp_cap(sealed, "sealed cap");

	// int *c = (int *) sealed;
	// printf("sealed[0] = %d\n", c[0]);

	void *unsealed = cheri_unseal(sealed, unseal);
	// void *unsealed = cheri_unseal(sealed, sealcap);
	pp_cap(unsealed, "unsealed cap");
	printf("unsealed[0] = %d\n", ((int *)unsealed)[0]);

	free(cap);
	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif