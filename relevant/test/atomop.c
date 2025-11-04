// #include <cheriintrin.h>
// #include <cheri.h>
// /cheruby-purecap/src/output/sdk/lib/clang/15.0.0/include/cheri.h
// #include <cheri/cheri.h>

// #include <sys/atomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdatomic.h>
#include <stdint.h>

#include <pthread.h>
#include <assert.h>
#include <stdbool.h>
#include <unistd.h>  // for sleep()

typedef uintptr_t VALUE;


/**
 * Atomic compare-and-swap.   This stores  `val` to  `var` if  and only  if the
 * assignment changes  the value of `var`  from `oldval` to `newval`.   You can
 * detect whether the assignment happened or not using the return value.
 *
 * @param   var        A variable of ::rb_atomic_t.
 * @param   oldval     Expected value of `var` before the assignment.
 * @param   newval     What you want to store at `var`.
 * @retval  oldval     Successful assignment (`var` is now `newval`).
 * @retval  otherwise  Something else is at `var`; not updated.
 */

// Function under test
static inline VALUE
rbimpl_atomic_value_cas(volatile VALUE *ptr, VALUE oldval, VALUE newval)
{
    __atomic_compare_exchange_n(
        ptr, &oldval, newval, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
    return oldval;
}

/* -----------------------
 * Single-threaded tests
 * ----------------------*/

static void test_single_thread_success(void) {
    VALUE v = 42;
    VALUE oldv = 42, newv = 100;
    VALUE ret = rbimpl_atomic_value_cas(&v, oldv, newv);

    assert(ret == oldv);      // returned old value
    assert(v == newv);        // should have been updated
    printf("[PASS] single_thread_success\n");
}

static void test_single_thread_fail(void) {
    VALUE v = 42;
    VALUE oldv = 123, newv = 100;
    VALUE ret = rbimpl_atomic_value_cas(&v, oldv, newv);

    assert(ret == 42);        // should return current value, not oldv
    assert(v == 42);          // should remain unchanged
    printf("[PASS] single_thread_fail\n");
}

/* -----------------------
 * Multithreaded simulation
 * ----------------------*/

#define NTHREADS 8
#define NITER    100000

typedef struct {
    _Atomic(VALUE) *shared;
    VALUE thread_id;
    VALUE success_count;
} thread_arg_t;

void *worker(void *arg) {
    thread_arg_t *t = arg;
    for (int i = 0; i < NITER; i++) {
        VALUE expected = *t->shared;
        VALUE ret = rbimpl_atomic_value_cas((volatile VALUE *)t->shared, expected, t->thread_id);

        // If CAS succeeded, ret == expected and *shared == thread_id
        if (ret == expected && *t->shared == t->thread_id)
            t->success_count++;
    }
    return NULL;
}

static VALUE shared = 0;

static void test_multithreaded_contention(void) {
    // _Atomic(VALUE) shared = 0;
    pthread_t threads[NTHREADS];
    thread_arg_t args[NTHREADS] = {0};

    for (VALUE i = 0; i < NTHREADS; i++) {
        args[i].shared = &shared;
        args[i].thread_id = i + 1;  // avoid 0
        pthread_create(&threads[i], NULL, worker, &args[i]);
    }

    for (int i = 0; i < NTHREADS; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("[PASS] multithreaded_contention: final shared value = %lu\n", (unsigned long)shared);
    int total = 0;
    for (int i = 0; i < NTHREADS; i++) total += args[i].success_count;
    printf("  Total successful CAS operations: %d\n", total);
}

/* -----------------------
 * Main entry
 * ----------------------*/

int main() {
    test_single_thread_success();
    test_single_thread_fail();
    test_multithreaded_contention();

    printf("All tests passed.\n");
//     return 0;
// }



// int main() {
// 	// as in ruby 
// 	int *old = (int *)malloc(sizeof(int));
// 	printf("old: %p\n", old);
// 	*old = 10;

// 	int *new = (int *)malloc(sizeof(int));
// 	printf("new: %p\n", new);
// 	*new = 100;

// 	VALUE oldval = (VALUE)old;
// 	VALUE newval = (VALUE)new;

// 	int *ret = __atomic_exchange_n(&old, new, __ATOMIC_SEQ_CST);

// 	printf("old: %p\n", old);
// 	printf("new: %p\n", new);
// 	printf("ret: %#p\n", ret);
// 	printf("*old: %d\n", *old);
// 	printf("*new: %d\n", *new);
// 	printf("*ret: %d\n", *ret);


	// builtin atomic operations

	// stdatomic.h

	// atomic? asm res code 
	// value is address of the object
	// int *ptr = (int *)malloc(sizeof(int));
	// *ptr = 10;
	// int **pp = &ptr;
	// int *old = ptr;
	// int *new = (int *)malloc(sizeof(int));
	// void *pold = (void *)old;
	// void *pnew = (void *)new;
	// *new = 100; 
	// printf("ptr: %p\n", ptr);
	// printf("pp: %p\n", pp);
	// printf("old: %p\n", old);
	// printf("new: %p\n", new);
	// _Atomic(void*) *var = (_Atomic(void*) *)pp;
	
	// if (atomic_compare_exchange_strong(var, &pold, pnew)) { // works 
	// 	printf("1 ptr: %p\n", ptr);
	// 	printf("*ptr: %d\n", *ptr);
	// } else {
	// 	printf("*ptr: %d\n", *ptr);
	// 	printf("0 ptr: %p\n", ptr);
	// }

	// void * ret = atomic_exchange(var, pold); // works 
	// printf("ret: %p\n", ret);
	// printf("*ptr: %d\n", *ptr);


	// // value 
	// uintptr_t uvar = 10;
	// uintptr_t uold = 10;
	// uintptr_t unew = 100;
	// // uintptr_t uret = atomic_exchange((_Atomic(uintptr_t) *) &uvar, unew); // works
	// // printf("ret: %p\n", uret);
	// // printf("ret: %p\n", uvar);

	// if (atomic_compare_exchange_strong((_Atomic(uintptr_t) *) &uvar, &uold, unew)) {
	// 	printf("*ptr: %d\n", uvar);
	// } else {
	// 	printf("*ptr: %d\n", uvar);
	// }

  	return 0;
}	
