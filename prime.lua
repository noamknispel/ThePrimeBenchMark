#!/usr/bin/env lua
function isPrime (x)
    -- Here will be a for loop
    if math.sqrt(x) % 1 == 0 then
        return false
    end
    for i = 2, math.sqrt(x) do
        if x % i == 0 then
            return false
        end
    end
    return true;
end

primes = {}
i = 0
while (#primes < tonumber(arg[1])) do
    if isPrime(i) then
        table.insert(primes, i)
    end
    i = i + 1
end
for key, value in pairs(primes) do
    print(value)
end
