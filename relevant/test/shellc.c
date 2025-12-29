#include <unistd.h>

int main(void) {
    // Path to the shell
    char *path = "/bin/sh";

    // Arguments must be a NULL-terminated array.
    // argv[0] conventionally is the program name.
    char *argv[] = { "sh", NULL };

    // No special environment → inherit by passing NULL
    execve(path, argv, NULL);

    // If execve returns, an error occurred.
    return 1;
}

