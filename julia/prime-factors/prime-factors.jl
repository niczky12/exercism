using BenchmarkTools
import Random

# super simple reursive solution
function prime_factors(n)
    if n == 1
        return empty([n])
    end

    for i in 2:n
        if n % i == 0
            return vcat([i], prime_factors(n ÷ i))
        end
    end
end


# slightly more elegant recursive solution
function prime_factors2(n, i)
    n == 1 && return empty([n])

    if n % i == 0
        return vcat([i], prime_factors2(n ÷ i, i))
    elseif i <= sqrt(n)
        return prime_factors2(n, i+1)
    else
        return [n]
    end
end

prime_factors2(n) = prime_factors2(n, 2)


# built in solution
import Primes

prime_factors3(n) = Primes.factor(Vector, n)

Random.seed!(1234)
candidates = rand(10_000:100_000, 100)

# this is about 10x slower than anything
@benchmark prime_factors.(candidates)
@benchmark prime_factors2.(candidates)
@benchmark prime_factors3.(candidates)


Random.seed!(1234)
candidates = rand(10_000:100_000_000, 10000)

@benchmark prime_factors2.(candidates)
# built in is 10x faster
@benchmark prime_factors3.(candidates)
