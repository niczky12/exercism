struct Point{T<:Real}
    x::T
    y::T
    Point{T}(x,y) where {T<:Real} = new(x,y)
    Point{T}(a) where {T<:Real} = new(a[1],a[2])
    Point(x::T, y::T) where {T<:Real} = Point{T}(x,y)
end


mutable struct Robot
    position::Point
    heading::Point

    function Robot(p::Tuple{T, T}, heading::Point) where T <: Real
        new(Point(p...), heading)
    end
end



position(r::Robot) = r.position
heading(r::Robot) = r.heading


# got this from tomerarnon via mentoring
# extremely fancy loop to define all arithmetic operations!
for op in (:+, :-, :*, :/)
    @eval Base.$op(p1::Point, p2::Point) = Point($op(p1.x, p2.x), $op(p1.y, p2.y))
end

  
function rotate(p::Point, direction::Symbol)
    @assert direction in (:left, :right)

    if direction == :right
        return Point(p.y, -p.x)
    else
        return Point(-p.y, p.x)
    end
end
  
  
advance!(r::Robot) = (r.position += r.heading; r)
turn_right!(r::Robot) = (r.heading = rotate(r.heading, :right); r)
turn_left!(r::Robot) = (r.heading = rotate(r.heading, :left); r)


const NORTH = Point(0, 1)
const EAST = rotate(NORTH, :right)
const SOUTH = rotate(EAST, :right)
const WEST = rotate(SOUTH, :right)

@assert rotate(WEST, :right) == NORTH

## using mod1 to turn the robot - my original solution
# const compass = (NORTH, EAST, SOUTH, WEST)

# function turn!(r::Robot, direction)
#     current_heading = heading(r)

#     # is there a better way of doing this?
#     next_heading_pos = mod1(findfirst(d -> d == current_heading, compass) + direction, 4)
#     r.heading = compass[next_heading_pos]
#     return r
# end


function move!(r::Robot, instructions::String)
    instructions_map = Dict(
        'A' => advance!,
        'R' => turn_right!,
        'L' => turn_left!
    )

    foreach(k -> instructions_map[k](r), instructions)
    return r
end

