# using IterTools

# split_string(s) = map(join, groupby(identity, s))
# encode_chunk(chunk) = length(chunk) <= 1 ? chunk : "$(length(chunk))$(chunk[1])"
# encode(s) = join(map(encode_chunk, split_string(s)))


# split_encoding(s) = map(m -> m.match, eachmatch(r"[0-9]{0,}[^\d]", s))
# function decode_chunk(chunk)
#     l = length(chunk) == 1 ? 1 : parse(Int, chunk[1:end-1])
#     return chunk[end] ^ l
# end
# decode(s) = join(map(decode_chunk, split_encoding(s)))


function encode(s::AbstractString)::AbstractString
    s == "" && return ""
    mem = s[begin]
    counter = 0
    iobuffer = IOBuffer()
    
    count_to_string(i::Int) = i == 1 ? "" : string(i)

    for char in s
        if mem == char
            counter += 1
        else
            # write result to buffer
            write(iobuffer, count_to_string(counter), mem)

            # reset buffer with new letter
            counter = 1
            mem = char
        end
    end

    # empty memory again
    write(iobuffer, count_to_string(counter), mem)

    return String(take!(iobuffer))
end


function decode(s::AbstractString)::AbstractString
    s == "" && return ""

    iobuffer = IOBuffer()
    counterbuffer = IOBuffer()

    function parse_counter_buffer(buff::IOBuffer)::Int
        stringval = String(take!(buff))
        stringval == "" ? 1 : parse(Int, stringval)
    end
    
    for char in s
        if isdigit(char)
            write(counterbuffer, char)
            
        else
            counter = parse_counter_buffer(counterbuffer)
            write(iobuffer, repeat(char, counter))
        end
    end

    return String(take!(iobuffer))
end

decode("2 hs2q q2w2 ")