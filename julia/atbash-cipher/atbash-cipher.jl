using Test

clean(s::String) = replace(lowercase(s), r"\W" => "")


function rotate(c::Char)
    if 'a' <= c <= 'z'
        return Char(Int('z') - (Int(c) - Int('a')))
    else
        return c
    end
end


@test rotate('a') == 'z'
@test rotate('z') == 'a'
@test rotate('y') == 'b'
@test rotate(rotate('a')) == 'a'
@test rotate('1') == '1'

function add_spaces(s)
    n = length(s)
    start_pos = 1:5:n

    # this min is here to make sure we don't try to select anything
    # over the end of the string
    finish_pos = min.(start_pos .+ 4, n)
   

    # is there a better way of unpacking zip?
    split_text = map(
        x -> s[x[1]:x[2]],    
        zip(start_pos, finish_pos)
    )

    join(split_text, " ")
end

@test add_spaces("hello") == "hello"
@test add_spaces("mynameis") == "mynam eis"
@test add_spaces("") == ""
@test add_spaces("dog") == "dog"
@test add_spaces("12345678901") == "12345 67890 1"


function encode(input)
    add_spaces(map(rotate, clean(input)))
end

function decode(input)
    map(rotate, clean(input))
end

