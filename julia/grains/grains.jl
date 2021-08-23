"""Calculate the number of grains on square `square`."""
function on_square(square)
    square < 1 || square > 64 && throw(DomainError("Must be on chess board. 1-64"))

    return BigInt(2) ^ (square - 1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    on_square(square) * 2 - 1
end

