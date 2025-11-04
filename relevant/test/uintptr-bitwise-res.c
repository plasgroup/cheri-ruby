// #include <cheriintrin.h>
// #include <cheri.h>
// #include <cheri/cheri.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include <limits.h>
// #include <stdatomic.h>

int main() {
	for (unsigned long i = 0; i < ULONG_MAX; i++)
	{
		uintptr_t p1 = i; 
		for (unsigned long j = 0; j < ULONG_MAX; j++)
		{
			/* code */
			uintptr_t p2 = j;
			uintptr_t p3 = p1 & p2;
			unsigned long k = i & j;
			if ((unsigned long)p3 != k)
			{
				printf("Error: %lu %lu %lu %lu\n", i, j, p3, k);
				return 1;
			}
		}
	}
	return 0;
}	


