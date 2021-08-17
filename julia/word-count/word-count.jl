const seperators = ('\t', '\n', ' ')

using Pipe
using DataStructures

function clean_sentence(sentence)
    @pipe sentence |>
        lowercase |>
        # this is ugly and fails 1 test case
        replace(_, r"[ .\n,\t!\^&*()~@#\$%{}?\[\]:;\/<>]" => " ") |>
        replace(_, r"\s{2,}" => " ") |>
        split(_, " ")
end


function wordcount(sentence)

    counter = DefaultDict{String, Int64}(0)

    for word in clean_sentence(sentence)
        word ∈ ("", "'") && continue

        counter[word] += 1
    end

    return counter
         
end

