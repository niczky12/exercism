using Test

struct ISBN <: AbstractString
    isbn::AbstractString
    ISBN(s::AbstractString) = 
        isvalid(ISBN, s) ? new(replace(s, "-" => "")) : throw(DomainError("Invalid ISBN format"))
end

function is_syntax_correct(isbn)
    match(r"^\d{9}[\dX]$", replace(isbn, "-" => "")) !== nothing
end

@test is_syntax_correct("3598215088")
@test is_syntax_correct("359821508X")
@test !is_syntax_correct("A3598215088")
@test !is_syntax_correct("13598215088")
@test !is_syntax_correct("13598218")
@test is_syntax_correct("359821-50-88")


function isvalid(T::Type{ISBN}, input::AbstractString)
    is_syntax_correct(input) || return false

    clean_isbn = replace(input, "-" => "")

    numbers = parse.(Int, replace(collect(clean_isbn), 'X'=> "10"))

    sum(numbers .* (10:-1:1)) % 11 == 0
end


macro isbn_str(input)
    ISBN(input)
end

string(isbn::ISBN) = isbn.isbn