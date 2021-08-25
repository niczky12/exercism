function look_around(x, y, M)
    neighbours = Vector{Char}()
    max_x = length(M)

    for idx_x in max(1, x-1):min(x+1, max_x)
        for idx_y in max(y-1, 1):min(y+1, length(M[idx_x]))
            idx_x == x && idx_y == y && continue
            push!(neighbours, M[idx_x][idx_y])
        end
    end

    return neighbours
end

function annotate(M)
    new_M = copy(M)

    for idx_x in 1:length(M)
        for idx_y in 1:length(M[idx_x])
            M[idx_x][idx_y] == '*' && continue
            neighbours = look_around(idx_x, idx_y, M)

            val = string(length(filter(x -> x == '*', neighbours)))
            val = val == "0" ? " " : val

            # this is ugly
            new_M[idx_x] = "$(new_M[idx_x][1:idx_y-1])$val$(new_M[idx_x][idx_y+1:end])"
        end
    end

    return new_M
end
