function is_tile_filled(coords, M)
    n = size(M, 1)

    return maximum(coords) > n || minimum(coords) < 1 || M[coords[1], coords[2]] != 0
end

function next_tile(previous, current, M)
    
    # keep current direction, if tile is filled, rotate
    δ = current .- previous

    if δ == [0, 0]
        return [1, 0], [1, 1]
    end

    # assume we can make a valid step forward
    next_tile = current .+ δ

    # check if next tile is out of bounds or already set
    if is_tile_filled(next_tile, M)
        # rotate delta
        δ = [δ[2], -δ[1]]
        return current, current .+ δ
    else
        # proceed as intended
        return current, next_tile
    end
end


function spiral_matrix(n)
    m = Matrix{Int}(undef,n,n)
    m .= 0

    pos_prev = [0,0]
    pos_curr = [0,0]
    idx = 0
    
    while idx < length(m)
        idx += 1
        pos_prev, pos_curr = next_tile(pos_prev, pos_curr, m)
        m[pos_curr[1], pos_curr[2]] = idx
    end
    return m

end

spiral_matrix(10)

