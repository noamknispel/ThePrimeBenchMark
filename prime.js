#!/usr/bin/env node --use_strict

function isPrime(num) {
  let num_sqr = Math.sqrt(num)

  if(num_sqr % 1 == 0) return false

  for(let i=2; i<num_sqr; i++) 
    if(num % i == 0) return false

  return true
}

var primes = []
let i = 2;

while(primes.length < parseInt(process.argv[2])) {
  if(isPrime(i)) primes.push(i)
  i++
}

console.log(primes)
