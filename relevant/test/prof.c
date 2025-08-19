#include <stdio.h>

void function1(void) {
	int i;
	for (i = 0; i < 1000000; i++) {
		// Some dummy work
		double x = i * 2.5;
	}
}

void function2(void) {
	int i;
	for (i = 0; i < 500000; i++) {
		// More dummy work
		int y = i * i;
	}
}

void function3(int count) {
	int i;
	for (i = 0; i < count; i++) {
		// Even more dummy work
		int z = i % 17;
	}
}

int main(void) {
	int i;
	
	// Call functions with different frequencies
	for (i = 0; i < 500; i++) {
		function1();  // Called 500 times directly
		if (i % 2 == 0) {
			function2();  // Called 250 times directly
			if (i % 4 == 0) {
				function3(5000);  // Called 125 times directly
			}
		}
	}
	
	printf("Program completed\n");
	printf("function1 called 500 times\n");
	printf("function2 called 250 times\n");
	printf("function3 called 125 times\n");
	return 0;
}