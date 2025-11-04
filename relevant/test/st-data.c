#include <stdio.h>

// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheriintrin.h>

#include <stdint.h>

int main() {
	uintptr_t a = (~(uintptr_t) 0); 
	printf("a %lu\n", a);

	int arr[10];
	for (size_t i = 0; i < 10; i++) {
		arr[i] = i;
	}
	a = 2;
	printf("a %d\n", arr[a]);

	return 0;
}
