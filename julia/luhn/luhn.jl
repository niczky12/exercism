isnotvalid(s) = length(s) < 2 || match(r"\D", s) !== nothing
double_luhn(d) = 2d > 9 ? 2d-9 : 2d


function luhn(str)
    clean_str = replace(str, r"\s" => "")
    isnotvalid(clean_str) && return false

    digits = map(x -> parse(Int, x), collect(clean_str))
    digits_to_double = digits[end-1:-2:1]
    digits_to_leave = digits[end:-2:1]

    luhn_sum = sum(map(double_luhn, digits_to_double)) + sum(digits_to_leave)

    return luhn_sum % 10 == 0
end
