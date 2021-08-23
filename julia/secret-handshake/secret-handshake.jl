binary(n::Int) = bitstring(n)[60:end]


function secret_handshake(code)
    binary_digits = reverse(binary(code))

    reverser = binary_digits[end] == '1' ? reverse : identity

    actions = ["wink", "double blink", "close your eyes", "jump"]

    handshake = empty(actions)

    for (idx, action) in enumerate(actions)
        if binary_digits[idx] == '1'
            push!(handshake, action) 
        end
    end

    return reverser(handshake)
end

# favourite comminity solution
# didn't know digits can return base 2 representation
function secret_handshake2(code)
    codes = ["wink", "double blink", "close your eyes", "jump"]
    key = isone.(digits(code, base=2, pad=5))
    result = codes[key[1:4]]
    key[5] ? reverse(result) : result
end
