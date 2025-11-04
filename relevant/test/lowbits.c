#include <stdio.h>

// #include <cheri.h>
// #include <cheri/cheri.h>
#include <cheriintrin.h>

#include <stdint.h>
#include <stdlib.h>

// align and lowbits manipulation
int main() {
	//  uintptr_t bd, *p;
	//  uintptr_t bu, *t2;
	// const uintptr_t lowbits = 32 - 1;

	// printf("lowbits %p\n", &lowbits);
	
	// for (uintptr_t i = 0x3fffdfff70; i < 0x3fffdfff70 + 300; i+=1) {
	// 	// p = (uintptr_t *)malloc(sizeof(uintptr_t)) - 1;
	// 	// bd = (const uintptr_t*)(~lowbits & (uintptr_t)(p + lowbits)); // suppose down 
	// 	// bu = (const uintptr_t*)(~lowbits & (uintptr_t)p);

	// 	bd = ~lowbits & (i + lowbits); // == up 
	// 	bu = ~lowbits & (i); // == down 

	// 	uintptr_t cd = __builtin_align_down(i, 32); // less
	// 	uintptr_t cu = __builtin_align_up(i, 32); // larger
	// 	printf("i %0x\n", i);
	// 	printf("cd %0x\n", cd);
	// 	printf("bd %0x\n", bd);

	// 	printf("cu %0x\n", cu);
	// 	printf("bu %0x\n", bu);
	// }

	// test builtin 
	printf("align of ptr %d\n", _Alignof(void *));
	int *array = (int *)malloc(10 * sizeof(int));
	array[2] = 10;
	int *a = array;
	a += 2;
	printf("array[2] %d\n", *a);


	return 0;
}
