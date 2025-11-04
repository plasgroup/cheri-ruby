#include <stdlib.h>
#include <stdio.h>

typedef struct s {
	int *a;
	int *b;
	int *c;
} S;

int main() {
	S* a = (S*) malloc(sizeof(S));
	a[2] = (S)0;
	return 0;
}

