function acronym(phrase)
    clean_phrase =  replace(replace(" " * phrase, "-" => " "), "_" => " ")
    letters = map(idx -> clean_phrase[idx], findall(r"(?<=\s)(\w)", clean_phrase))
    string(uppercase.(letters)...)
end


# community solution
function acronym2(phrase)
    split(phrase, r"[ _-]+").|> first .|> uppercase |> join
end
