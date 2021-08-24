using BenchmarkTools

# super simple reursive solution
function prime_factors(n)
    if n == 1
        return Vector{Int64}()
    end

    for i in 2:n
        if n % i == 0
            return vcat([i], prime_factors(n ÷ i))
        end
    end
end

prime_factors(2^5 * 7 * 13 * 5 * 31)


function prime_factors2(n, up_to)

    if n % up_to == 0
        return vcat([up_to], prime_factors2(n ÷ up_to, up_to))
    elseif up_to <= sqrt(n)
        return prime_factors2(n, up_to+1)
    else
        return [n]
    end
end

prime_factors2(n) = prime_factors2(n, 2)

prime_factors2(2^5 * 7 * 13 * 5 * 31)
prime_factors2(31)