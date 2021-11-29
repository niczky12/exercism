"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

using BenchmarkTools
using StatsBase

function count_nucleotides(strand)
    strands = "ACGT"
    length(union(strands, strand)) != 4 && throw(DomainError("Invalid nucleotide."))
    Dict(i => count(string(i), strand) for i in strands)
end

long_string = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC" ^ 50
string_with_error = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGXTCTGATAGCAGC" ^ 50

@benchmark count_nucleotides(long_string)


function count_nucleotides_fast(strand)
    dna = Dict(c => 0 for c ∈ "ACGT")
    for c ∈ strand
        if !haskey(dna, c)
            throw(DomainError(c))
        end
        dna[c] += 1
    end
    return dna
end


@benchmark count_nucleotides_fast(long_string)

using StatsBase

function count_nucleotides_faster(strand)
    dna = countmap(strand)
    default = Dict(c => 0 for c ∈ "ACGT")
    dna = merge(default, dna)
    length(keys(dna)) != 4 && throw(DomainError("Invalid nucleotide."))
    return dna
end

@benchmark count_nucleotides_faster(long_string)