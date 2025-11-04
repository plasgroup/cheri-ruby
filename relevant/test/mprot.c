#include	<sys/mman.h>

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

#define HEAP_PAGE_ALIGN (1 << 16)
#define HEAP_PAGE_SIZE HEAP_PAGE_ALIGN
#define HEAP_PAGE_ALIGN_MASK (~(~0UL << 16))


#define HEAP_PAGE_LOCK (PROT_NONE)
#define HEAP_PAGE_UNLOCK (PROT_READ | PROT_WRITE)

struct body {
	struct page* page;
	struct other* other;
	int flags;
};

struct page {
	struct body *body;
	struct page *next;
};
struct other {
	int flags;
	struct other *next;
};

int main() {
	size_t mmap_size = sizeof(struct body);
	char *ptr = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (ptr == MAP_FAILED) {
		printf("mmap failed\n");
	}
	struct body *b;
	b = (struct body *)ptr;
	b->page = calloc(1, sizeof(struct page));
	struct page *p = b->page;
	p->body = b;

	struct other *o = calloc(1, sizeof(struct other));
	struct other *o2 = calloc(1, sizeof(struct other));
	struct page *p2 = calloc(1, sizeof(struct page));

	b->other = o;
	o->next = o2;
	p->next = p2;
	b->flags = 100;

	pp_cap(b->page, "1");
	int r = mprotect(b, sizeof(struct body), PROT_NONE);
	if (r == -1) {
		perror("mprotect1");
	}
	r = mprotect(b, sizeof(struct body), PROT_READ | PROT_WRITE );
	if (r == -1) {
		perror("mprotect2");
	}
	pp_cap(b->page, "2");

	r = mprotect(b, sizeof(struct body), PROT_NONE);
	if (r == -1) {
		perror("mprotect1");
	}
	r = mprotect(b, sizeof(struct body), PROT_READ | PROT_WRITE);
	if (r == -1) {
		perror("mprotect1");
	}
	pp_cap(b->page, "3");

	r = mprotect(b, sizeof(struct body), PROT_NONE);
	if (r == -1) {
		perror("mprotect1");
	}
	r = mprotect(b, sizeof(struct body), PROT_READ | PROT_WRITE);
	if (r == -1) {
		perror("mprotect1");
	}
	pp_cap(b->page, "3");


	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif