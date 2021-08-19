using StatsBase

function isisogram(s)
    s == "" && return true

    replace(s, r"\W" => "") |>
    lowercase |>
    countmap |>
    values |>
    maximum |>
    x -> x <= 1
end
