int main() {
	int a = 5;
	int b = 10;
	int c = a + b;
	int d = c * 2;
	int e = d - a;
	int f = e / 3;
	int g = f % 2;

	for (int i = 0; i < g; i++) {
		c += i;
	}
	return 0;
}