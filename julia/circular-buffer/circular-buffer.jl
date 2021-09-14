
mutable struct CircularBuffer{T}
    data::Array{T,1}
    capacity::Integer
    function CircularBuffer{T}(capacity::Integer) where {T}
        new(Array{T,1}(), capacity)
    end
end


isfull(cb::CircularBuffer) = cb.capacity == length(cb.data)
Base.isempty(cb::CircularBuffer) = isempty(cb.data)

function Base.popfirst!(cb::CircularBuffer)
    isempty(cb) && throw(BoundsError("Buffer must be non-empty."))
    popfirst!(cb.data)
end


function Base.push!(cb::CircularBuffer, item; overwrite::Bool=false)
    !overwrite && isfull(cb) && throw(BoundsError("Buffer is full."))

    if isfull(cb)
        !overwrite && throw(BoundsError("Buffer is full."))
        popfirst!(cb)
    end
    push!(cb.data, item)
    return cb
end


function Base.empty!(cb::CircularBuffer)
    while !isempty(cb)
        popfirst!(cb)
    end
    return cb
end
