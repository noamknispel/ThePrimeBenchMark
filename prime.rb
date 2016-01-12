#!/usr/bin/env ruby

def isPrime(num)
  num_sqr = Math.sqrt(num)

  return false if num_sqr % 1 == 0

  (2..num_sqr.to_i).each do |n|
    return false if num % n == 0
  end

  return true
end

primes = []
i = 2

while primes.count < ARGV.first.to_i do
  primes << i if isPrime(i)
  i += 1
end

puts primes
