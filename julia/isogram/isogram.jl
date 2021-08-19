# using StatsBase solution
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

# concise one-liner
isisogram2(s) = s |> lowercase |> word -> filter(isletter, word) |> allunique


# crazy fast solution from the community
using Strs: ASCIIChr

function  isisogram3(str)
    seen = BitSet()
    for char in str
        char = ASCIIChr(char)
        if isletter(char)
            letter = Int(lowercase(char))
            letter in seen && return false
            push!(seen, letter)
        end
    end
    return true
end
