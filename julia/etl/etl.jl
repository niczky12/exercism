function transform(input::AbstractDict)
    new_dict = Dict{Char, Int64}()

    for (score, letters) in input
        for letter in letters
            new_dict[lowercase(letter)] = score
        end
    end
    return new_dict
end

# best community solution
function transform(input::Dict)
    Dict(
         lowercase(letter) => value
         for (value, letters) in input
         for letter in letters
    )
end