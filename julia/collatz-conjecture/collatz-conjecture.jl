using Memoize

# recursive solution
@memoize function collatz_steps(n::Int; steps::Int=0)
    n < 1 && throw(DomainError("n must be positive intger."))

    n == 1 && return 0

    if iseven(n)
        return 1 + collatz_steps(div(n, 2))
    else
        return 1 + collatz_steps(3n+1)
    end
end


# iterative solution
function collatz_steps2(n::Int)
    n < 1 && throw(DomainError("n must be positive intger."))
    
    steps = 0
    
    while n > 1
        if iseven(n)
            n = div(n, 2)
        else
            n = 3n+1
        end
        steps += 1
    end
    return steps
end


all([collatz_steps(i) == collatz_steps2(i) for i in 1:1000])


# # benchmarking
# using BenchmarkTools
# using Random
# Random.seed!(10)
# test_numbers = rand(1:100000, 1000);

# @benchmark collatz_steps.(test_numbers)
# @benchmark collatz_steps2.(test_numbers)