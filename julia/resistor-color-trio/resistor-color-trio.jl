const COLOR_CODES = (
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
)

get_color(str) = findfirst(x -> x == str, COLOR_CODES) - 1

function label(colors::AbstractArray)
    val = (get_color(colors[1]) * 10 + get_color(colors[2])) * 10^get_color(colors[3])
    n, remainder = divrem(val, 1000)
    remainder == 0 ? "$n kiloohms" : "$val ohms"
end
