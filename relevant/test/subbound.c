#include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheri/cheric.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
#include <assert.h>
#include <stddef.h>
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


struct ccan_list_node
{
	struct ccan_list_node *next, *prev;
};

struct rb_thread_sched_waiting {
    enum thread_sched_waiting_flag {
        thread_sched_waiting_none     = 0x00,
        thread_sched_waiting_timeout  = 0x01,
        thread_sched_waiting_io_read  = 0x02,
        thread_sched_waiting_io_write = 0x08,
        thread_sched_waiting_io_force = 0x40, // ignore readable
    } flags;

    struct {
        // should be compat with hrtime.h
#ifdef MY_RUBY_BUILD_MAY_TIME_TRAVEL
        int128_t timeout;
#else
        uint64_t timeout;
#endif
        int fd; // -1 for timeout only
        int result;
    } data;

    // connected to timer_th.waiting
    struct ccan_list_node node;
};


struct rb_thread_sched_item {
    struct {
        struct ccan_list_node ubf;

        // connected to ractor->threads.sched.reqdyq
        // locked by ractor->threads.sched.lock
        struct ccan_list_node readyq;

        // connected to vm->ractor.sched.timeslice_threads
        // locked by vm->ractor.sched.lock
        struct ccan_list_node timeslice_threads;

        // connected to vm->ractor.sched.running_threads
        // locked by vm->ractor.sched.lock
        struct ccan_list_node running_threads;

        // connected to vm->ractor.sched.zombie_threads
        struct ccan_list_node zombie_threads;
    } node;

    struct rb_thread_sched_waiting waiting_reason;

    bool finished;
    bool malloc_stack;
    void *context_stack;
};

typedef struct rb_thread_struct {
    VALUE self;

    struct rb_thread_sched_item sched;
    bool mn_schedulable;

    VALUE last_status; /* $? */

    /* for cfunc */

    /* for load(true) */
    VALUE top_self;
    VALUE top_wrapper;

    /* thread control */

    /* bit flags */
    unsigned int has_dedicated_nt : 1;
    unsigned int to_kill : 1;
    unsigned int abort_on_exception: 1;
    unsigned int report_on_exception: 1;
    unsigned int pending_interrupt_queue_checked: 1;
    int8_t priority; /* -3 .. 3 (RUBY_THREAD_PRIORITY_{MIN,MAX}) */
    uint32_t running_time_us; /* 12500..800000 */

    void *blocking_region_buffer;

    VALUE thgroup;
    VALUE value;

    /* temporary place of retval on OPT_CALL_THREADED_CODE */
#if OPT_CALL_THREADED_CODE
    VALUE retval;
#endif

    /* async errinfo queue */
    VALUE pending_interrupt_queue;
    VALUE pending_interrupt_mask_stack;


    union {
        struct {
            VALUE proc;
            VALUE args;
            int kw_splat;
        } proc;
        struct {
            VALUE (*func)(void *);
            void *arg;
        } func;
    } invoke_arg;

    enum thread_invoke_type {
        thread_invoke_type_none = 0,
        thread_invoke_type_proc,
        thread_invoke_type_ractor_proc,
        thread_invoke_type_func
    } invoke_type;

    /* statistics data for profiler */
    VALUE stat_insn_usage;

    /* fiber */
    VALUE scheduler;
    unsigned int blocking;

    /* misc */
    VALUE name;
    void **specific_storage;

} rb_thread_t;

typedef struct Struct {
	int serial;
	int dedicated;
	struct a {
		struct b {
			int d;
		} c; 
	} has_dedicated;

} s_t; 

int main() {
	// rb_thread_t *th = malloc(sizeof(rb_thread_t));
	// pp_cap((void*)th, "th");
	// pp_cap((void*)&th->sched.waiting_reason.node, "th->sched.context_stack");
	// rb_thread_t *w = (rb_thread_t *)(&th->sched.waiting_reason.node - offsetof(rb_thread_t, sched.waiting_reason)); 
	// pp_cap((void *)w, "w");
	// ptraddr_t diff =  (ptraddr_t)&th->sched.waiting_reason.node - (ptraddr_t)th;
	// rb_thread_t *wth = (rb_thread_t *)(&th->sched.waiting_reason.node - diff);
	// pp_cap((void *)wth, "wth");

	// printf("diff: %ld\n", diff);
	// printf("diff: %ld\n", offsetof(rb_thread_t, sched.waiting_reason));


	s_t *s = malloc(sizeof(s_t));
	s->serial = 1;
	s->dedicated = 2;
	s->has_dedicated.c.d = 3;
	pp_cap((void*)s, "s");
	pp_cap((void*)&s->has_dedicated.c.d, "&s->has_dedicated.c.d");

	int *h = &s->has_dedicated.c.d;
	pp_cap((void*)h, "h");
	printf("h: %d\n", *h);

	size_t off = offsetof(s_t, has_dedicated.c.d);
	printf("off: %lu\n", off);
	ULVALUE diff = (ULVALUE)&s->has_dedicated.c.d - (ULVALUE)s;
	printf("diff: %lu\n", diff);

	s_t *so = (s_t *)((VALUE)h - offsetof(s_t, has_dedicated.c.d));
	pp_cap((void*)so, "so");
	printf("so: %d\n", so->has_dedicated.c.d);

	s_t *sd = (s_t *)((VALUE)h - diff);
	pp_cap((void*)sd, "sd");
	printf("sd: %d\n", sd->has_dedicated.c.d);

	return 0;
}	


// cheri support
#if defined(__CHERI_PURE_CAPABILITY__) 
#else
#endif