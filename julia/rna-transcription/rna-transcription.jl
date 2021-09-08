function mapper(c)

    letter_map = Dict(
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U'
    )
    c ∉ keys(letter_map) && throw(error("Incorrect DNA"))
    letter_map[c]
end

to_rna(dna) = map(mapper, dna)
