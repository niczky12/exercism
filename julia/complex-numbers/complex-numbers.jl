import Base: ==, ≈, +, -, *, ^, /, conj, convert


struct ComplexNumber<:Number
    real::Real
    imag::Real
end

ComplexNumber(a::Real) = ComplexNumber(a,0)
convert(::Type{ComplexNumber}, x::S) where {S<:Real} = RationalNumber(x)



==(a::ComplexNumber, b::ComplexNumber) = a.real == b.real && a.imag == b.imag
≈(a::ComplexNumber, b::ComplexNumber) = a.real ≈ b.real && a.imag ≈ b.imag

+(a::ComplexNumber...)= ComplexNumber(mapfoldl(x-> x.real, +, a),
                                      mapfoldl(x-> x.imag, +, a))
                                   
-(a::ComplexNumber...)= ComplexNumber(mapfoldl(x-> x.real, -, a),
                                      mapfoldl(x-> x.imag, -, a))
*(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(   a.real*b.real-a.imag*b.imag, 
                                                        a.real*b.imag + a.imag*b.real)

exp(a::ComplexNumber)=ComplexNumber(ℯ^a.real,0)*ComplexNumber(cos(a.imag),sin(a.imag))
jm=ComplexNumber(0,1)
^(a::ComplexNumber,power::AbstractFloat)=
    ComplexNumber(abs(a)^power)*exp(jm*ComplexNumber(power)*ComplexNumber(atan(a.imag,a.real)))

real(a::ComplexNumber)=a.real
imag(a::ComplexNumber)=a.imag


conj(a::ComplexNumber) = ComplexNumber(a.real,-a.imag)
                                                     
/(a::ComplexNumber,b::ComplexNumber) = a* ComplexNumber((b.real,-b.imag)./(b.real^2+b.imag^2)...)

abs(a::ComplexNumber)=sqrt(real(a*conj(a)))