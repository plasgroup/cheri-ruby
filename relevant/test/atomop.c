// #include <cheriintrin.h>
// #include <cheri.h>
// /cheruby-purecap/src/output/sdk/lib/clang/15.0.0/include/cheri.h
// #include <cheri/cheri.h>

// #include <sys/atomic.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdatomic.h>
#include <stdint.h>

#define RUBY_ATOMIC_PTR_CAS(var, oldval, newval) \
    (rbimpl_atomic_ptr_cas((void **)&(var), (void *)(oldval), (void *)(newval)))

void *
rbimpl_atomic_ptr_cas(void **ptr, const void *oldval, const void *newval)
{
	_Atomic(void*) *p = (_Atomic(void*) *)ptr;
	void *pold = ((void *)oldval);
    void *pnew = ((void *)newval);
	if (atomic_compare_exchange_strong(p, &pold, pnew)) {
		return pold; // ret old upon success
	} else {
		return pnew;
	}
}

int main() {
	// as in ruby 
	int *var = NULL;
	int *old = (int *)malloc(sizeof(int));
	printf("old: %p\n", old);

	*old = 10;
	int *new = (int *)malloc(sizeof(int));
	printf("new: %p\n", new);

	*new = 100;
	var = old;
	printf("var: %p\n", var);

	int *ret = RUBY_ATOMIC_PTR_CAS(var, old, new);
	printf("var: %p\n", var);
	printf("old: %p\n", old);
	printf("new: %p\n", new);
	printf("ret: %p\n", ret);
	printf("*var: %d\n", *var);
	printf("*old: %d\n", *old);
	printf("*new: %d\n", *new);


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