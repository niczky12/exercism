# super naive solution that tries all possible combinations
function pythagorean_triplets(n)    
    finds = []
    
    for a in 1:div(n, 3)
        for b in a:(n - div(n, 3))
            c = n - b - a
            if a^2 + b^2 == c^2
                push!(finds, (a,b,c))
            end
        end
    end
    return finds
end


# something that's a lot faster :D
function pyth(N::T) where T<:Integer
    triples = Tuple{T, T, T}[]
    Threads.@spawn for a in 1:div(N, 3)
        # could be made faster by separating dev and rem
        b, r = divrem(N * (N - 2a), 2 * (N - a))
        (r != 0 || a >= b) && continue
        push!(triples, (a, b, N - a - b))
    end
    return triples
end
