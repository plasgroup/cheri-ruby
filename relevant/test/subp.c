// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>

// void func (int *p) {
// 	int *addr = (int *)malloc(10 * sizeof(int));
// 	__ptrdiff_t s = addr - p;
// 	printf("addr: %ld\n", s);
// }

// int main() {
// 	int *addr = (int *)malloc(10 * sizeof(int));
// 	int *p = (int *)malloc(10 * sizeof(int));
// 	__ptrdiff_t s = (uintptr_t)func - (uintptr_t)p;
// 	printf("addr: %ld\n", s);
// 	return 0;
// }


#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <cheriintrin.h>
void func1() {
    printf("func1\n");
}
void func2() {
    printf("func2\n");
}
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
int main(void) {
    uintptr_t uptr1 = (uintptr_t)func1;
    uintptr_t uptr2 = 1000;
    uintptr_t uptr3 = uptr1 - uptr2;
    printf("%d\n", uptr3);
    pp_cap((void *)uptr1, "uptr1");
    pp_cap((void *)uptr3, "uptr3");

	// inline assembly to get the register value of ca0
    void *ca0;
    __asm__ __volatile__ ("cmove %0, $c0"
: "+C"(ca0) /* c0 is a capability output operand */
: /* No input operands */
: /* No clobbers */
);
	pp_cap((void *)ca0, "ca0");
    return 0;
}