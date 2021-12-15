include("permutations.jl")


function solve(s)
           chars = string.(filter(c -> c ∈ 'A':'Z', unique(s)))

           for p in permutations(0:9, length(chars))
               d = Dict(zip(chars, string.(p)))
               statement = string(replace(i -> get(d, i, i), string.(collect(s)))...)
               res = eval(Meta.parse(statement))
               res == true && return d
           end

           return nothing
end