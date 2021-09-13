function all_your_base(input_digits, base_in, base_out)

    check_digit(digit, base) = (0 <= digit < base) || throw(DomainError("Digits must be valid."))

    base_in < 2  && throw(DomainError("Bases must be bigger than 1"))
    base_out < 2  && throw(DomainError("Bases must be bigger than 1"))    
    foreach(d -> check_digit(d, base_in), input_digits)

    value = sum(input_digits .* base_in .^ (length(input_digits)-1:-1:0); init=0)
    value == 0 && return [0]

    new_digits = empty(input_digits)

    while value != 0
        push!(new_digits, value % base_out)
        value ÷= base_out
    end

    reverse(new_digits)
end
