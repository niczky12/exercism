
using Test

function rotate(r::Int, c::Char)::Char

    n = Int(c)

    if Int('a') <= Int(c) <= Int('z')
        new_n = (Int(c) - Int('a') + r) % 26
        return Char(Int('a') + new_n)
    elseif Int('A') <= Int(c) <= Int('Z')
        new_n = (Int(c) - Int('A') + r) % 26
        return Char(Int('A') + new_n)
    end

    return c
end



@test rotate(26, 'a') == 'a'
@test rotate(12, '1') == '1'
@test rotate(3, 'a') == 'd'
@test rotate(-1, 'B') == 'A'
@test rotate(26, 'B') == 'B'
@test rotate(28, 'B') == 'D'
@test rotate(12323, '!') == '!'
@test rotate(12323, ' ') == ' '

rotate(r::Int, s::String)::String = map(c -> rotate(r, c), s)

@test rotate(0, "hello") == "hello"
@test rotate(26, "my name is") == "my name is"
@test rotate(2, "abc") == "cde"

# define macros
for i in 0:26
    r = Symbol("R",i,"_str")
    @eval begin
        macro $r(x)
            rotate($i, x)
        end
    end
end

@test R1"abc" == "bcd"
