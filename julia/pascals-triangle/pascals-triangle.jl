function triangle(n::Int)

    # how I found DomainError?
    # I used @edit sqrt(1) to show me how it's done by the pros
    n < 0 && throw(DomainError("n must be non-negative. You provided $n"))

    rows = [[1]]

    for row_number in 2:n
        last_row = rows[end]

        # empty array with the same type as before
        new_row = similar(last_row, 0)

        for i in 1:row_number
            push!(
                new_row,
                get(last_row, i-1, 0) + get(last_row, i, 0)
            )
        end

        push!(rows, new_row)
    end

    return rows[1:n]
end



