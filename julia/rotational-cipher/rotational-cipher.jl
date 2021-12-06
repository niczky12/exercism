
function rotate(r::Integer, c::AbstractChar)::AbstractChar

    if c in 'a':'z'
        new_n = 'a' + (c - 'a' + r) % 26
    elseif c in 'A':'Z'
        new_n = 'A' + (c - 'A' + r) % 26
    else
        new_n = c
    end

    return new_n
end

rotate(r::Integer, s::AbstractString)::AbstractString = map(c -> rotate(r, c), s)

# macro with the key at the end
macro R_str(s, r::Integer)
    rotate(r, s)
end

@assert R"hello"12 == rotate(12, "hello")



# define macros
for i in 0:26
    r = Symbol("R",i,"_str")
    @eval begin
        macro $r(x)
            rotate($i, x)
        end
    end
end
