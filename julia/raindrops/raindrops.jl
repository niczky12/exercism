plinger(x, mapping) = x % mapping[1] == 0 ? mapping[2] : ""

function raindrops(number)

    mapping = (
        (3, "Pling"),
        (5, "Plang"),
        (7, "Plong")
    )

    s = string(map(m -> plinger(number, m), mapping)...)

    s == "" && return string(number)
    return s
end

