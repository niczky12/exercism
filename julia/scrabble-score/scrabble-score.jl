"""
```text
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
```
"""
value_to_letters = Dict(
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K', ],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
)


letter_to_value = Dict{Char, Int}()

for (value, letters) in value_to_letters
    for letter in letters
        letter_to_value[letter] = value
    end
end

function score(str)
    score_letter(c::Char)::Int64 = get(letter_to_value, c, 0)

    score = 0

    for letter in uppercase(str)
        score += score_letter(letter)
    end
    return score
end


