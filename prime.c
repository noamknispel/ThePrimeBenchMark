#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int isPrime(unsigned long x)
{
    if (sqrt(x) - (unsigned long)sqrt(x) == 0)
        return 0;
    for (unsigned long i = 2; i < ceil(sqrt(x)); i++)
        if (x % i == 0)
            return 0;
    return 1;
}

int main( int argc, char** argv)
{
    unsigned long max = atol(argv[1]);
    unsigned long *a = malloc(sizeof(unsigned long) * max);
    unsigned long x = 2;
    for (unsigned long i = 0; i < max; x++)
        if (isPrime(x))
            a[i++] = x;
    for (unsigned long i = 0; i < max; i++)
        printf("%lu\n", (unsigned long)a[i]);
    return 0;
}
