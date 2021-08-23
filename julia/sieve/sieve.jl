using BenchmarkTools

function sieve(limit)    
    ints = 1:limit
    mask = ints .> 1

    p = 0

    while p < limit
        p += 1

        # skip to next number if p is not a prime
        !(mask[p]) && continue

        # eliminate all multiples of p from mask
        foreach(np -> mask[np] = false, 2p:p:limit)
    end

    return ints[mask]
end


# pretty community solution using double loops
# I didn't know that the second loop can depened on the first
function sieve2(limit::Integer)
    s=1:limit .> 1
    for n=2:limit, k=2n:n:limit
        s[k]=false
    end
    findall(s)
end


@benchmark sieve(1000)
@benchmark sieve2(1000)

