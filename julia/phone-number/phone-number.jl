function clean(phone_number::AbstractString)
    cleaned = filter(isnumeric, phone_number)
    m = match(r"^1?([2-9]\d{2}[2-9]\d{6})$", cleaned)
    m === nothing ? nothing : m.captures[1]
end