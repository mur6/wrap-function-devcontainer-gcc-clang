#include <stdio.h>

extern int foo();
extern int __real_foo();

int __wrap_foo()
{
    printf("wrap foo\n");
    __real_foo();
    return 0;
}

int main()
{
    foo();
    return 0;
}
