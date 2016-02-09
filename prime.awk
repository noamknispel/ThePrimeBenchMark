#!/usr/bin/awk -f

function isPrime (x) {
    if (sqrt(x) % 1 == 0)
        return 0
    for (j = 2; j < sqrt(x); j++)
        if (x % j == 0)
            return 0
    return 1
}

BEGIN {
    n = 0
    for (i = 0;  n < ARGV[1]; i++)
        if (isPrime(i)) {
            arr[n] = i
            n++
        }
    for (i in arr)
        print arr[i]
}
