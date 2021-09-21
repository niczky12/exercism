
struct RationalNumber{T} <: Real where T <: Int
    num::T
    dem::T

    function RationalNumber{T}(num::T, dem::T) where T <: Int
        dem == 0 && throw(ArgumentError("Denominator cannot be 0."))
        g = gcd(num, dem)
        new{T}(num ÷ g, dem ÷ g)
    end

    RationalNumber(num::Int, dem::Int) = RationalNumber{Int}(num::Int, dem::Int)
end

Base.zero(::RationalNumber{T}) where T <: Int = RationalNumber{T}(0, 1)
Base.one(::RationalNumber) = RationalNumber(1, 1)

inverse(r::RationalNumber) = RationalNumber(r.dem, r.num)
negative(r::RationalNumber) = RationalNumber(-r.num, r.dem)


function Base.+(r1::RationalNumber, r2::RationalNumber)
    numerator = +(r1.num * r2.dem, r2.num * r1.dem)
    denominator = r1.dem * r2.dem
    RationalNumber(numerator, denominator)
end

Base.-(r1::RationalNumber, r2::RationalNumber) = r1 + negative(r2)

function Base.*(r1::RationalNumber, r2::RationalNumber)
    RationalNumber(r1.num * r2.num, r1.dem * r2.dem)  
end

Base./(r1::RationalNumber, r2::RationalNumber) = r1 * inverse(r2)

