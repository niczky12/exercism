import Base: zero, one, +, -, *, /, inv, ^, abs, numerator, denominator, <, <=, >, >=, !=, ==, show
import Base: convert, promote, promote_type

function fix_signs(num, den)
    o = one(num)
    z = zero(num)


    if num < z
        if den < z
            return -o, -o
        else
            return o, o
        end
    else
        if den < z
            return -o, -o
        else
            return o, o
        end
    end
end
        


struct RationalNumber{T} <: Real where T <: Integer
    num::T
    den::T

    function RationalNumber{T}(num::T, den::T) where T <: Integer
        den == 0 && throw(ArgumentError("Denominator cannot be 0."))
        g = gcd(num, den)
        n, d = num ÷ g, den ÷ g
        o1, o2 = fix_signs(n ,d)
        new{T}(o1 * n, o2 * d)
    end

    RationalNumber(num::Integer, den::Integer) = RationalNumber{Int}(num::Integer, den::Integer)
end

RationalNumber{S}(num::T) where {T<:Integer,S<:Integer} = RationalNumber{promote_type(T, S)}(num, 1)

convert(::Type{RationalNumber{T}}, x::S) where {T<:Integer,S<:Integer} =
    RationalNumber{promote_type(T,S)}(x)
promote_type(::Type{RationalNumber{S}}, ::Type{T}) where {T<:Integer, S<:Integer} =
    RationalNumber{promote_type(S,T)}
promote_type(::Type{T}, ::Type{RationalNumber{S}}) where {T<:Integer, S<:Integer} =
    RationalNumber{promote_type(S,T)}

zero(::Type{RationalNumber{T}}) where {T<:Integer} = RationalNumber{T}(0, 1)
one(::Type{RationalNumber{T}}) where {T<:Integer} = RationalNumber{T}(1, 1)

inverse(r::RationalNumber) = RationalNumber(r.den, r.num)
negative(r::RationalNumber) = RationalNumber(-r.num, r.den)


function +(r1::RationalNumber, r2::RationalNumber)
    numerator = +(r1.num * r2.den, r2.num * r1.den)
    denominator = r1.den * r2.den
    RationalNumber(numerator, denominator)
end

-(r1::RationalNumber, r2::RationalNumber) = r1 + negative(r2)

function *(r1::RationalNumber, r2::RationalNumber)
    RationalNumber(r1.num * r2.num, r1.den * r2.den)  
end

/(r1::RationalNumber, r2::RationalNumber) = r1 * inverse(r2)
^(r1::Real, r2::RationalNumber) = r1^(r2.num/r2.den)

abs(r::RationalNumber) = RationalNumber(abs(r.num), r.den)


numerator(r::RationalNumber) = r.num
denominator(r::RationalNumber) = r.den

==(r1::RationalNumber, r2::RationalNumber) = r1.num == r2.num && r2.den == r1.den
<(r1::RationalNumber, r2::RationalNumber) = r1.num/r1.den < r2.num/r2.den
<=(r1::RationalNumber, r2::RationalNumber) = r1 < r2 || r1 == r2
>(r1::RationalNumber, r2::RationalNumber) = r1.num/r1.den > r2.num/r2.den
>=(r1::RationalNumber, r2::RationalNumber) = r1 > r2 || r1 == r2

show(io::IO, r::RationalNumber) = print(io, "$(r.num)//$(r.den)")