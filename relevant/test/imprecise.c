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

typedef uint16_t pm_node_type_t;
typedef uint16_t pm_node_flags_t;

typedef struct {
    /** A pointer to the start location of the range in the source. */
    const uint8_t *start;

    /** A pointer to the end location of the range in the source. */
    const uint8_t *end;
} pm_location_t;

typedef struct pm_node {
    /**
     * This represents the type of the node. It somewhat maps to the nodes that
     * existed in the original grammar and ripper, but it's not a 1:1 mapping.
     */
    pm_node_type_t type;

    /**
     * This represents any flags on the node. Some are common to all nodes, and
     * some are specific to the type of node.
     */
    pm_node_flags_t flags;

    /**
     * The unique identifier for this node, which is deterministic based on the
     * source. It is used to identify unique nodes across parses.
     */
    uint32_t node_id;

    /**
     * This is the location of the node in the source. It's a range of bytes
     * containing a start and an end.
     */
    pm_location_t location;
} pm_node_t;

int main() {

	pm_node_t **nodes1 = malloc(sizeof(pm_node_t *) * 100);
	if (nodes1 == NULL) {
		perror("Failed to allocate memory for node");
		return 1;
	}
	size_t len = 4194304; 

	size_t rep = cheri_representable_length(len); 
	printf("rep: %zu\n", rep);

	printf("Allocated %zu bytes for nodes1\n", sizeof(pm_node_t *) * len);

    pm_node_t **nodes2 = (pm_node_t **) realloc(nodes1, sizeof(pm_node_t *) * len);

	pp_cap((void*)nodes2, "nodes2");

	// int *ptr = (int *) malloc(sizeof(int) * 100);
	// for (int i = 0; i < 100; i++) {
	// 	ptr[i] = i;
	// }
	// int *ptr2 = (int *) realloc(ptr, sizeof(int) * 200);
	// for (int i = 0; i < 200; i++) {
	// 	printf("%d ", ptr2[i]);
	// }



	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif