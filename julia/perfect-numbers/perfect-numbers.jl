# slow but simple method for finding all divisors
function divisors(n::Int)
    n < 1 && throw(DomainError("n must be a positive integer"))
    filter(i -> n % i == 0, 1:n-1)
end

# super fast solution using packages
using Combinatorics
using Primes

# this is 500x faster
function divisors_fast(n::Int)
    n < 1 && throw(DomainError("n must be a positive integer"))
    divisors = unique(map(prod, combinations(factor(Vector, n))))
    
    # the above misses 1 as a divisor and keeps n itself
    # also handle the edge case of n = 1
    if !isempty(divisors)
        divisors[end] = 1
    end

    return divisors
end


aliquot_sum(n) = sum(divisors_fast(n))

isperfect(n) = aliquot_sum(n) == n
isabundant(n) = aliquot_sum(n) > n
isdeficient(n) = aliquot_sum(n) < n

# # Benchmarking
# using BenchmarkTools
# import Random

# Random.seed!(12334);
# candidates = rand(10000:1_000_000, 100);


# @benchmark divisors.(candidates)
# @benchmark divisors_fast.(candidates)
