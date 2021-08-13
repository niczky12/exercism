function trinary_to_decimal(s)
    # check if string is valid
    
    if match(r"[^0-2]", s) !== nothing
        return 0
    end

    digits = map(c -> parse(Int, c), reverse(collect(s)))
    powers = 3 .^ range(0, step=1, length=length(digits))

    return sum(digits .* powers)
end

