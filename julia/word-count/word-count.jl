using Pipe
using StatsBase


function wordcount(sentence)
    @pipe sentence |>
        lowercase |>
        replace(_, r"(?!\b'\b)[^\w ]" => " ") |>
        split(_, " ", keepempty=false) |>
        countmap
end
