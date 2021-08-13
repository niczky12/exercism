using Test
using BenchmarkTools


# naive solution
square_of_sum_naive(n) = sum(1:n) ^ 2
sum_of_squares_naive(n) = sum((1:n) .^ 2)
difference_naive(n) = square_of_sum_naive(n) - sum_of_squares_naive(n)


# closed form solution
# using div to keep it an int
square_of_sum(n) = div(n * (n + 1), 2) ^ 2
sum_of_squares(n) = div(n * (n+1) * (2n+1), 6)

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
difference(n) = square_of_sum(n) - sum_of_squares(n)


@test all((difference(i) == difference_naive(i) for i in 1:20))


# @benchmark sum_of_squares(100)
# @benchmark sum_of_squares_naive(100)

# @benchmark difference_naive(1000)
# @benchmark difference(1000)

