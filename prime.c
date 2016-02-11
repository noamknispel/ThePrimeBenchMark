#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int isPrime(unsigned int x)
{
    if (sqrt(x) - (unsigned int)sqrt(x) == 0)
        return 0;
    for (unsigned int i = 2; i < ceil(sqrt(x)); i++)
        if (x % i == 0)
            return 0;
    return 1;
}

int main( int argc, char** argv)
{
    unsigned int max = atol(argv[1]);
    unsigned int *a = malloc(sizeof(unsigned int) * max);
    unsigned int x = 2;
    for (unsigned int i = 0; i < max; x++)
        if (isPrime(x))
            a[i++] = x;
    for (unsigned int i = 0; i < max; i++)
        printf("%u\n", (unsigned int)a[i]);
    return 0;
}
