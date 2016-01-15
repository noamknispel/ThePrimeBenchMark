#!/usr/bin/env python3
def is_prime(x):
    from math import sqrt, ceil
    if sqrt(x).is_integer():
        return False
    for i in range(2, ceil(sqrt(x))):
        if x % i == 0:
            return False
    return True

if __name__ == '__main__':
    from sys import argv
    primes = []
    i = 0
    while len(primes) < int(argv[1]):
        if is_prime(i):
            primes.append(i)
        i += 1
    print(primes)
