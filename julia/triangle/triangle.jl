function is_valid_triangle(sides)
    a,b,c = sides
    return !(a + b <= c || a+c <= b || b+c <= a)
end


function side_check(sides, n)
    !is_valid_triangle(sides) && return false
    return length(unique(sides)) == n
end

is_equilateral(sides) = side_check(sides, 1)
is_isosceles(sides) = is_equilateral(sides) || side_check(sides, 2)
is_scalene(sides) = side_check(sides, 3)
